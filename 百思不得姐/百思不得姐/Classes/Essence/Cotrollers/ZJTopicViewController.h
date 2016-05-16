//
//  ZJTopicViewController.h
//  百思不得姐
//
//  Created by 张杰 on 16/5/15.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZJTopicViewTypeAll = 1,
    ZJTopicViewTypePicture = 10,
    ZJTopicViewTypeWord = 29,
    ZJTopicViewTypeVoice = 31,
    ZJTopicViewTypeVideo = 41
}ZJTopicViewType ;

@interface ZJTopicViewController : UITableViewController

@property (nonatomic, assign) ZJTopicViewType type;

@end
