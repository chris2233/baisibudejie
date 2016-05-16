//
//  ZJTopic.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/13.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTopic.h"

@implementation ZJTopic

-(NSString *)create_time
{
    //设置日期格式
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //日期格式化
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *create = [fmt dateFromString:_create_time];
    if (create.isThisYear) {//今年
        
        if (create.isToday) {//今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
            
            if (cmps.hour >= 1) {//时间差大于1小时
               return [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            } else if(cmps.minute >= 1){//时间差>=1分钟
                return [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            } else {//时间差距是小于1分钟的
                return @"刚刚";
            }
        } else if (create.isYesterday) {//昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:create];
        } else {//其他
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:create];
        }
    } else {//非今年
        return _create_time;
    }
    
}

@end
