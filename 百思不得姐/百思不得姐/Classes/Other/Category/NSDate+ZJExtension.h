//
//  NSDate+ZJExtension.h
//  百思不得姐
//
//  Created by 张杰 on 16/5/14.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZJExtension)

- (NSDateComponents *)deltaFrom:(NSDate *)From;
/**
 *是否为今年
 */
- (BOOL)isThisYear;
/**
 *是否为今天
 */
- (BOOL)isToday;
/**
 *是否为昨天
 */
- (BOOL)isYesterday;

@end
