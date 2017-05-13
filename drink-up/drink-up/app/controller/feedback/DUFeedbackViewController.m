//
//  DUFeedbackViewController.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/13.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUFeedbackViewController.h"

#import "Masonry.h"

@interface DUFeedbackViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *containerEmptyImageView;
@property (nonatomic, strong) UIImageView *containerFullImageView;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation DUFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialViews];
    [self addSubviews];
    [self setLayouts];
    [self animated];
}

- (void)initialViews {
    self.containerView = [[UIView alloc] init];
    self.containerView.frame = CGRectMake(self.view.frame.size.width / 2.0 - 100, self.view.frame.size.height - 352 - 239, 200, 352);
    self.containerView.backgroundColor = [UIColor clearColor];
    
    self.containerEmptyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"container-1-empty"]];
    self.containerEmptyImageView.contentMode = UIViewContentModeBottom;
    
    self.maskView = [[UIView alloc] initWithFrame: CGRectZero];
    self.maskView.backgroundColor = [UIColor clearColor];
    self.maskView.clipsToBounds = YES;
    
    self.containerFullImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"container-1-full"]];
    self.containerFullImageView.contentMode = UIViewContentModeBottom;
}

- (void)addSubviews {
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.containerEmptyImageView];
    [self.containerView addSubview:self.maskView];
    [self.maskView addSubview:self.containerFullImageView];
}

- (void)setLayouts {
    [self.containerEmptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView.mas_left);
        make.right.equalTo(self.containerView.mas_right);
        make.bottom.equalTo(self.containerView.mas_bottom);
        // TODO:
        make.height.equalTo(@30);
    }];
    
    [self.containerFullImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.maskView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)animated {
    [CATransaction begin];
    
}

@end
