//
//  ZJTopic.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/13.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTopic.h"
#import <MJExtension.h>

@implementation ZJTopic
{
    CGFloat _cellHeight;
    CGRect _pictureViewFrame;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"small_image"  : @"image0",
             @"large_image"  : @"image1",
             @"middle_image" : @"image2"
             };
}

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

- (CGFloat)cellHeight
{
    if (!_cellHeight) {
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 40, MAXFLOAT);
        CGFloat textH = [self.text boundingRectWithSize:maxSize
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{
                                                          NSFontAttributeName : [UIFont systemFontOfSize:13]
                                                          }
                                                context:nil].size.height;
        //cell的高度
        _cellHeight = textH + ZJTopicTextY + ZJTopicCellBottom + 2 * ZJTopicCellMargin;
        if (self.type == ZJTopicViewTypePicture ) {//图片帖子
            
            CGFloat pictureW = maxSize.width;
            CGFloat pictureH = pictureW * self.height/self.width;
            //如果算出的pictureH高度>=我们所设定的最大图片高度，则设定图片高度为ZJTopicPicturebreakH ＝ 250
            if (pictureH >= ZJTopicPictureMaxH) {
                pictureH = ZJTopicPicturebreakH;
                self.bigPicture = YES;//大图
            }
            //计算图片控件的frame
            CGFloat pictureX = ZJTopicCellMargin;
            CGFloat pictureY = ZJTopicTextY + textH + ZJTopicCellMargin;
            _pictureViewFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            
            //这里还要加上一个图片离底部的间距
            _cellHeight += pictureH + ZJTopicCellMargin;
        }
    }
    return _cellHeight;
}

@end
