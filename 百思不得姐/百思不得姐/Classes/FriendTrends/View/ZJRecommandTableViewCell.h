//
//  ZJRecommandTableViewCell.h
//  百思不得姐
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJRecommandCategory.h"

@interface ZJRecommandTableViewCell : UITableViewCell

@property (nonatomic, strong) ZJRecommandCategory *category;


@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end
