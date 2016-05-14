//
//  ZJRecommandTagTableViewCell.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/11.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJRecommandTagTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface ZJRecommandTagTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNameLabel;


@end

@implementation ZJRecommandTagTableViewCell


-(void)setRecommandTag:(ZJRecommandTag *)recommandTag
{
    _recommandTag = recommandTag;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:recommandTag.image_list]
                          placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeNameLabel.text = recommandTag.theme_name;
    
    NSString *subName = nil;
    if (recommandTag.sub_number < 10000) {
        subName = [NSString stringWithFormat:@"%zd人订阅",recommandTag.sub_number];
    } else {
        subName = [NSString stringWithFormat:@"%.1f人万人订阅",recommandTag.sub_number/10000.0];
    }
    
    self.subNameLabel.text = subName;
}
/**
 *  可以用这个方法设置cell的frame，而且外界是无法改变的
 */
-(void)setFrame:(CGRect)frame
{
    frame.origin.x = 10;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    //调用父类让父类拿到这个值然后去设置
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
