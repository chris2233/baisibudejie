//
//  ZJTopicPictureView.h
//  百思不得姐
//
//  Created by 张杰 on 16/5/17.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJTopic.h"

@interface ZJTopicPictureView : UIView

+ (instancetype)pictureView;

@property (strong, nonatomic) ZJTopic *topic;

@end
