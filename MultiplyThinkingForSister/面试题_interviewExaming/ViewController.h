//
//  ViewController.h
//  面试题_interviewExaming
//
//  Created by tanmanqi on 15/9/21.
//  Copyright © 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
/***/
@property(nonatomic, copy) NSString *name;
/**
 *  常用property的修饰符:
 *  1.线程安全: nonatomic/atomic-->在iOS开发中基本都是用nonatomic
 *  2.内存管理: strong/weak/assign/copy/retain
 *  3.访问权限: readonly, readwrite
 *  4.指定方法名: getter=, setter=
 
 
 ** weak: 常用于IBOutlet和 定义在.m文件中类目的控件(UIButton...) /
    assign: 用于非对象变量CGFloat/NSIterger,int,double...
    retain/assign: 是MRC机制下的对对象和非对象的描述
    copy: 用于NSString 和 block
 */

@end

