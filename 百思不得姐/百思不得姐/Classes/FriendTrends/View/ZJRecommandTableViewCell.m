//
//  ZJRecommandTableViewCell.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJRecommandTableViewCell.h"

@interface ZJRecommandTableViewCell()


@property (weak, nonatomic) IBOutlet UIView *MarkView;

@end

@implementation ZJRecommandTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = ZJRGBColor(244, 244, 244);
}

-(void)setCategory:(ZJRecommandCategory *)category
{
    _category = category;
    
    self.categoryLabel.text = category.name;
}
/**
 *  在这个方法中监听cell选中和不被选中的状态
 *
 *  @param selected BOOL 是否选中
 *  @param animated BOOL 是否需要动画
 */
-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    [self.MarkView setHidden:!selected];
    self.categoryLabel.textColor = selected ? ZJRGBColor(219, 21, 26) : ZJRGBColor(78, 78, 78);
}
@end
