//
//  MQPerson.m
//  MultiplyThinkingForSister
//
//  Created by tanmanqi on 15/9/17.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "MQPerson.h"

@implementation MQPerson
/**
 *  anObserver：观察者对象，这个对象必须实现observeValueForKeyPath:ofObject:change:context:方法，以响应属性的修改通知。
 keyPath：被监听的属性。这个值不能为nil。
 options：监听选项，这个值可以是NSKeyValueObservingOptions选项的组合。关于监  听选项，我们会在下面介绍。
 context：任意的额外数据，我们可以将这些数据作为上下文数据，它会传递给观察者对象的observeValueForKeyPath:ofObject:change:context:方法。这个参数的意义在于用于区分同一对象监听同一属性(从属于同一对象)的多个不同的监听。
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"keyPath = %@, change = %@, context = %s, object = %@", keyPath, change, (char *)context, object);
}

///**
// *  enum {
// // 提供属性的新值
// NSKeyValueObservingOptionNew = 0x01,
//
// // 提供属性的旧值
// NSKeyValueObservingOptionOld = 0x02,
//
// // 如果指定，则在添加观察者的时候立即发送一个通知给观察者，
// // 并且是在注册观察者方法返回之前
// NSKeyValueObservingOptionInitial = 0x04,
//
// // 如果指定，则在每次修改属性时，会在修改通知被发送之前预先发送一条通知给观察者，
// // 这与-willChangeValueForKey:被触发的时间是相对应的。
// // 这样，在每次修改属性时，实际上是会发送两条通知。
// NSKeyValueObservingOptionPrior = 0x08
// };
// typedef NSUInteger NSKeyValueObservingOptions;
// */

@end
