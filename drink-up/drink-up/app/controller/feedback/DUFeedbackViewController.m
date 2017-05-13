//
//  DUFeedbackViewController.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/13.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUFeedbackViewController.h"
#import "DUFeedbackUpViewController.h"
#import "DUFeedbackDownViewController.h"
#import "DURecordObject.h"
#import "DUUserDefaultHelper.h"

#import "Masonry.h"

@interface DUFeedbackViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *containerEmptyImageView;
@property (nonatomic, strong) UIImageView *containerFullImageView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UILabel *capacityLabel;

@property (nonatomic, strong) UIImageView *resultImageView;
@property (nonatomic, strong) UIButton *arrorButton;

@end

@implementation DUFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialViews];
    [self addSubviews];
    [self setLayouts];
    [self setDatas];
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
    
    self.capacityLabel = [UILabel new];
    self.capacityLabel.text = [NSString stringWithFormat:@"%ld ml", self.capacity];
    self.capacityLabel.font = [UIFont fontWithName:@"PingFangSC-Thin" size:36];
    self.capacityLabel.textAlignment = NSTextAlignmentCenter;
    self.capacityLabel.alpha = 0;
    
    self.arrorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.arrorButton setImage:[UIImage imageNamed:@"arror"] forState:UIControlStateNormal];
    self.arrorButton.alpha = 0;
}

- (void)addSubviews {
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.containerEmptyImageView];
    [self.containerView addSubview:self.maskView];
    [self.maskView addSubview:self.containerFullImageView];
    [self.view addSubview:self.capacityLabel];
    [self.view addSubview:self.arrorButton];
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
        make.height.equalTo(@(self.proportion * 290));
    }];
    
    [self.containerFullImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.maskView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)setDatas {
    DURecordObject *record = [[DURecordObject alloc]initWithCapacity:self.capacity level:(self.capacity / 50 + 1) date:[NSDate new]];
    [DUUserDefaultHelper writeData:record];
}

- (void)animated {
    self.resultImageView = [[UIImageView alloc]initWithImage:[self convertViewToImage:self.containerView]];
    self.resultImageView.frame = self.containerView.frame;
    [self.view addSubview:self.resultImageView];
    
    self.containerView.alpha = 0;
    
    [UIView animateWithDuration:0.6
                          delay:1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.resultImageView.transform = CGAffineTransformMakeTranslation(-100, 0);
                         self.resultImageView.transform = CGAffineTransformScale(self.resultImageView.transform, 0.5, 0.5);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.4 animations:^{
                             self.capacityLabel.alpha = 1;
                         } completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.4 animations:^{
                                 self.arrorButton.alpha = 1;
                             } completion:^(BOOL finished) {
                                 
                             }];
                         }];
                     }];
    
    [self.capacityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.resultImageView.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.resultImageView);
    }];
    
    [self.arrorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@15);
        make.height.equalTo(@30);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.resultImageView).with.offset(20);
    }];
}

-(UIImage*)convertViewToImage:(UIView*)v{
    CGSize s = v.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, NO, 1.0);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (IBAction)toDownVC:(id)sender {
    DUFeedbackDownViewController *downVC = [[UIStoryboard storyboardWithName:@"DUFeedbackViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DUFeedbackDownViewController"];
    [self.navigationController pushViewController:downVC animated:YES];
}

- (IBAction)toUpVC:(id)sender {
    DUFeedbackUpViewController *upVC = [[UIStoryboard storyboardWithName:@"DUFeedbackViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DUFeedbackUpViewController"];
    [self.navigationController pushViewController:upVC animated:YES];
}


@end
