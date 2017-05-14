//
//  DUMainCardTableViewCell.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUMainCardTableViewCell.h"

@interface DUMainCardTableViewCell()



@property (weak, nonatomic) IBOutlet UILabel *capacityLabel;

@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UIImageView *treeImageView;

@end

@implementation DUMainCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    
    self.bakView.layer.masksToBounds = YES;
    self.bakView.layer.cornerRadius = 3;
}

- (void)configCells {
    self.capacityLabel.text = self.obj.capacity;
    self.msgLabel.text = [NSString stringWithFormat:@"Gained a %@ Tree / %@", self.obj.level, self.obj.date];
    self.treeImageView.image = [UIImage imageNamed:[self.obj getImageName]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
