//
//  ZJProgressView.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/21.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJProgressView.h"

@implementation ZJProgressView

- (void)awakeFromNib
{
    self.roundedCorners = 2;
    self.progressLabel.textColor = [UIColor whiteColor];
}

@end
