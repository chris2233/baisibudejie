//
//  ZJTopicCell.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/13.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJTopicCell.h"


@implementation ZJTopicCell

-(void)awakeFromNib
{
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
    
    for (id obj in self.subviews)
    {
        if ([NSStringFromClass([obj class])isEqualToString:@"UITableViewCellScrollView"])
        {
            UIScrollView *scroll = (UIScrollView *) obj;
            scroll.delaysContentTouches =NO;
            break;
        }
    }

    
}
- (IBAction)dingButtonClick:(UIButton *)sender {
    
    ZJLogFunc;
    
}

-(void)setTopic:(ZJTopic *)topic
{
    
}

-(void)setFrame:(CGRect)frame
{
    static CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= frame.origin.x * 2;
    frame.size.height -= margin;
    frame.origin.y += margin;
    [super setFrame:frame];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

@end
