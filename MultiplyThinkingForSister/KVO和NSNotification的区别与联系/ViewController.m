//
//  ViewController.m
//  KVO和NSNotification的区别与联系
//
//  Created by tanmanqi on 15/9/17.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "MQPerson.h"
#import "MQBank.h"

@interface ViewController ()
/**bank*/
@property(nonatomic, strong) MQBank *bank;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MQPerson *person = [[MQPerson alloc] init];

    self.bank = [[MQBank alloc] init];
    [self.bank setValue:@(10) forKeyPath:@"accountBalance"];

#warning 如果这个将bank变成局部变量的话,会报错\
reason: 'An instance 0x7fc261516290 of class MQBank was deallocated while key value observers were still registered with it.
    [_bank addObserver:person forKeyPath:@"accountBalance" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    /**
     *  以下说明通过kvo也可以监听私有property的属性值的变化.
     */
#warning 单纯的改变值不会触发KVO,只有通过getter和setter方法修改属性的值的变化就会触发kvo方法.
    [self.bank setValue:@(20) forKeyPath:@"accountBalance"];
    id value = [self.bank valueForKeyPath:@"accountBalance"];
    NSLog(@"%d", [value intValue]);
}


/**
 *  联系：
 （1）都是用于对象与对象之间的通信
 （2）都是只负责发出消息，剩下的事情就不管了，因此没有返回值
 （3）：都是基于观察者模式
 区别：
 KVO：实现步骤：
 （1）被观察者通过 addObserver:forKeyPathptions:context:  方法来添加观察者（添加观察者的操作是在观察者中进行的）。
 （2）改变被观察者的keyPath值(注意：单纯改变其值不会调用此方法，只有通过getters和setters来改变值才会触发KVO)
 （3）观察者里调用方法observeValueForKeyPathfObject:change:context:来作出相应的回应
 （4）如果不再使用该观察者我们需要移除相应的观察者（removeObserver:forKeyPath:）
 通过上述KVO实现步骤的描述我们不难发现整个代码都只需在观察者里进行实现，被观察者不用添加任何代码。
 优点：谁要监听谁注册，然后对响应进行处理即可，使得观察者与被观察者完全解耦，运用很灵活很 简便。
 不足：但是KVO只能检测类中的属性，并且属性名都是通过NSString来查找，编译器不会帮你检错和补全，纯手敲所以比较容易出错。
 NSNotificationcenter：实现步骤：
 （1）被观察者自己在必要的方法A里，通过方法postNotificationNamebject:来发出通知notificationName（通知标识名，不同通知通过唯一的通知标识名来区分），这样发送通知者这边的工作就完成（注意：通知不是由被观察者发出，而是由NSNotificationCenter来统一发出）
 （2）谁要监听，就通过[NSNotificationCenter defaultCenter]的方法addObserver:selector:namebject:为观察者注册监听name为notificationName的通知。
 （3）每当发出name为notificationName的通知时，注册监听后的观察者就会调用其自己定义的方法notificationSelector来进行响应
 （4）如果不再需要观察者那么我们要及时的移除相应的观察者。（[NSNotificationCenter defaultCenter] removeObserver:name: object:）
 优点：监听不局限于属性的变化，还可以对多种多样的状态变化进行监听，监听范围广，使用也更灵活。
 缺点：需要被观察者先主动发出通知，然后观察者注册监听后再来进行响应，比KVO多了发送通知的一步。而且不能使得观察者与被观察者完全解耦。
 其实NSNotification与KVO最本质的区别就是：接收消息的主动性上来讲KVO模式下接受消息是主动的，在NSNotification模式下接受消息是被动的。消息与观察者的关系：KVO是一对一的关系而NSNotification是一对多的关系
 
 */
@end
