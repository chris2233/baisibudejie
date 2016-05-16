//
//  NSDate+ZJExtension.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/14.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "NSDate+ZJExtension.h"

@implementation NSDate (ZJExtension)
/**
 *比较self和From的差值
 */
-(NSDateComponents *)deltaFrom:(NSDate *)From
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    //比较时间
    NSDateComponents *cmps = [calendar components:unit
                                         fromDate:From
                                           toDate:self
                                          options:0];
    return cmps;
}

- (BOOL)isThisYear
{
   NSCalendar *calendar = [NSCalendar currentCalendar];
    //拿到目前的年份
   NSInteger nowYear = [calendar component:(NSCalendarUnitYear) fromDate:[NSDate date]];
   NSInteger selfYear = [calendar component:(NSCalendarUnitYear) fromDate:self];
    
   return (nowYear == selfYear);
}

- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    //拿到目前的年份
   NSDateComponents * nowCmps = [calendar components:unit fromDate:[NSDate date]];
   NSDateComponents * selfCmps = [calendar components:unit fromDate:self];
                                  
   return (nowCmps.year == selfCmps.year && nowCmps.month == selfCmps.month && nowCmps.day == selfCmps.day);
}

- (BOOL)isYesterday
{
    //日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:selfDate toDate:nowDate options:0];
    
    return (cmps.year == 0 && cmps.month == 0 && cmps.day == 1);
}


@end
