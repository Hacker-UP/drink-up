//
//  DUSelectViewController.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/13.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUSelectViewController.h"
#import "HVideoViewController.h"

#import "Masonry.h"

@interface DUSelectViewController ()

@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation DUSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialsViews];
    [self addSubViews];
    [self setLayouts];
}

- (void)initialsViews {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextButton setTitle:@"Select" forState:UIControlStateNormal];
    self.nextButton.backgroundColor = DUButtonColor;
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = DUButtonTitleFont;
    [self.nextButton addTarget:self action:@selector(toShoot) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addSubViews {
    [self.view addSubview:self.nextButton];
}

- (void)setLayouts {
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-20);
        make.height.equalTo(@53);
    }];
}

- (void)toShoot{
    HVideoViewController *ctrl = [[NSBundle mainBundle] loadNibNamed:@"HVideoViewController" owner:nil options:nil].lastObject;
    ctrl.HSeconds = 10000;//设置可录制最长时间
    ctrl.takeBlock = ^(id item) {
        
    };
    [self presentViewController:ctrl animated:YES completion:nil];
}

@end
