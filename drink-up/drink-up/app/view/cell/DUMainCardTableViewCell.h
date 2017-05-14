//
//  DUMainCardTableViewCell.h
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DURecordObject.h"

@interface DUMainCardTableViewCell : UITableViewCell

@property(nonatomic, strong) DURecordObject *obj;
@property (weak, nonatomic) IBOutlet UIView *bakView;
- (void)configCells;

@end
