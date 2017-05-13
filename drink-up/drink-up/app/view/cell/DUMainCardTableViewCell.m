//
//  DUMainCardTableViewCell.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUMainCardTableViewCell.h"

@interface DUMainCardTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *bakView;


@end

@implementation DUMainCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    
    self.bakView.layer.masksToBounds = YES;
    self.bakView.layer.cornerRadius = 3;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
