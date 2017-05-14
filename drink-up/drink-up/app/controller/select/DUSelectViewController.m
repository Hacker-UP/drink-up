//
//  DUSelectViewController.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/13.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUSelectViewController.h"
#import "HVideoViewController.h"
#import "CRPageViewController.h"
#import "DUContainerViewController.h"
#import "DUFeedbackViewController.h"

#import "Masonry.h"
#import "HTPressableButton.h"

@interface DUSelectViewController ()<CRPageViewControllerDataSource>

@property (weak, nonatomic) IBOutlet HTPressableButton *nextButton;

@property (strong, nonatomic) CRPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray <DUContainerViewController *> *sourse;
@property (assign, nonatomic) NSInteger viewControllersNumber;
@property (strong, nonatomic) NSArray *dataSourse;

@property (strong, nonatomic) DUContainerViewController *currentVC;

@end

@implementation DUSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialsViews];
//    [self addSubViews];
//    [self setLayouts];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)initialsViews {
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.nextButton = [[HTPressableButton alloc] init];
//    self.nextButton = [HTPressableButton buttonWithType:UIButtonTypeCustom];
//    [self.nextButton setTitle:@"Select" forState:UIControlStateNormal];
    self.nextButton.backgroundColor = DUButtonColor;
//    [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.nextButton.titleLabel.font = DUButtonTitleFont;
    [self.nextButton addTarget:self action:@selector(toShoot) forControlEvents:UIControlEventTouchUpInside];
    
    self.nextButton.style = HTPressableButtonStyleRounded;
    self.nextButton.shadowHeight = 8;
    self.nextButton.buttonColor = DUButtonColor;
    self.nextButton.shadowColor = DUButtonDarkenColor;
    self.nextButton.cornerRadius = 6;
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
    ctrl.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    ctrl.modalPresentationStyle = UIModalPresentationOverFullScreen;
    ctrl.HSeconds = 10000;//设置可录制最长时间
    ctrl.capacity = [self.currentVC.sourse[1] integerValue];
    WS(weakSelf);
    
    ctrl.takeBlock = ^(id item, CGFloat proportion) {
        DUFeedbackViewController *feedbackVC = [[UIStoryboard storyboardWithName:@"DUFeedbackViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DUFeedbackViewController"];
        feedbackVC.proportion = proportion;
        feedbackVC.capacity = [weakSelf.currentVC.sourse[1] floatValue] * proportion;
        feedbackVC.fullCapacity = [weakSelf.currentVC.sourse[1] integerValue];
        [self.navigationController pushViewController:feedbackVC animated:true];
    };
    [self presentViewController:ctrl animated:YES completion:nil];
}

- (DUContainerViewController *)createViewControllerWithNumber: (float) number {
    DUContainerViewController *childVC = [[UIStoryboard storyboardWithName:@"DUSelectViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DUContainerViewController"];
    NSArray *sourse = self.dataSourse[[NSNumber numberWithFloat:number].integerValue];
    childVC.sourse = sourse;
    return childVC;
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.dataSourse = @[@[@"S Container", @"250"],
                        @[@"M Container", @"550"],
                        @[@"L Container", @"1500"],
                        @[@"XL Container", @"4000"]];
    if ([segue.destinationViewController isKindOfClass:[CRPageViewController class]]) {
        self.pageViewController = [CRPageViewController new];
        self.sourse = [NSMutableArray new];
        self.viewControllersNumber = 3;
        for (int i = 0; i < self.viewControllersNumber; i++) {
            [self.sourse addObject:[self createViewControllerWithNumber:i]];
        }
        self.pageViewController = (CRPageViewController *)segue.destinationViewController;
        self.pageViewController.countPageInController = self.viewControllersNumber;
        self.pageViewController.childVCSize = CGSizeMake(250, 352);
        self.pageViewController.sizeBetweenVC = -14;
        self.pageViewController.OffsetOfHeightCentralVC = -20;
        self.pageViewController.animationSpeed = 0.5;
        self.pageViewController.animation = UIViewAnimationCurveEaseInOut;
        self.pageViewController.viewControllers = [NSMutableArray arrayWithArray:self.sourse];
        self.pageViewController.dataSource = self;
        for (int i = (int)self.viewControllersNumber; i < 4; i++) {
            [self.sourse addObject:[self createViewControllerWithNumber:i]];
        }
    }
}

#pragma mark - CRPageViewControllerDelegate

- (void)unfocusedViewController:(DUContainerViewController *)viewController {
//    NSLog(@"unfocusedViewController");
//    [viewController zoomingImageOut];
}

- (void)focusedViewController:(DUContainerViewController *)viewController {
//    NSLog(@"focusedViewController");
    self.currentVC = viewController;
//    [viewController zoomingImageIn];
}

- (DUContainerViewController *)pageViewController:(CRPageViewController *)pageViewController viewControllerAfterViewController:(DUContainerViewController *)viewController {
    NSInteger numberViewControllerInSourse = [self.sourse indexOfObject:viewController] + 1;
    if (numberViewControllerInSourse >= self.sourse.count) {
        numberViewControllerInSourse = 0;
    }
    return self.sourse[numberViewControllerInSourse];
}

- (DUContainerViewController *)pageViewController:(CRPageViewController *)pageViewController viewControllerBeforeViewController:(DUContainerViewController *)viewController {
    NSInteger numberViewControllerInSourse = [self.sourse indexOfObject:viewController] - 1;
    if (numberViewControllerInSourse < 0) {
        numberViewControllerInSourse = self.sourse.count - 1;
    }
    return self.sourse[numberViewControllerInSourse];
}


@end
