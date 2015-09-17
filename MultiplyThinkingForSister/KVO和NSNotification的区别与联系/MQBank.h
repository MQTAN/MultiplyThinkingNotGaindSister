//
//  MQBank.h
//  MultiplyThinkingForSister
//
//  Created by tanmanqi on 15/9/17.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MQBank : NSObject
///**金额*/
//@property(nonatomic, assign) int accountBalance;
/**账号*/
@property(nonatomic, copy) NSString *bankCodeEn;
/**银行数量*/
@property(nonatomic, strong) NSMutableArray *departments;
@end
