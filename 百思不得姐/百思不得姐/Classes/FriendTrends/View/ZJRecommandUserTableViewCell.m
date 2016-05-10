//
//  ZJRecommandUserTableViewCell.m
//  百思不得姐
//
//  Created by 张杰 on 16/5/10.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJRecommandUserTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface ZJRecommandUserTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *sreenName;
@property (weak, nonatomic) IBOutlet UILabel *funsCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;



@end

@implementation ZJRecommandUserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setUser:(ZJRecommandUser *)user
{
    _user = user;
    self.sreenName.text = user.screen_name;
    self.funsCountLabel.text = [NSString stringWithFormat:@"%zd人关注",user.fans_count];
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
        
    
}

@end
