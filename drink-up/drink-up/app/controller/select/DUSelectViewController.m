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

#import "Masonry.h"

@interface DUSelectViewController ()<CRPageViewControllerDataSource>

@property (nonatomic, strong) UIButton *nextButton;

@property (strong, nonatomic) CRPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray <DUContainerViewController *> *sourse;
@property (assign, nonatomic) NSInteger viewControllersNumber;
@property (strong, nonatomic) NSArray *dataSourse;

@property (strong, nonatomic) DUContainerViewController *curentVC;

@end

@implementation DUSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialsViews];
    [self addSubViews];
    [self setLayouts];
    
//    [self addContainerPageVC];
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
    ctrl.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    ctrl.HSeconds = 10000;//设置可录制最长时间
    ctrl.takeBlock = ^(id item) {
        
    };
    [self presentViewController:ctrl animated:YES completion:nil];
}

- (void)addContainerPageVC {
    self.dataSourse = @[@[@"Tristan" ,@"52"],
                        @[@"Victor"  ,@"36"],
                        @[@"Victor"  ,@"36"]];
    
    self.pageViewController = [CRPageViewController new];
    self.sourse = [NSMutableArray new];
    self.viewControllersNumber = 3;
    for (int i = 0; i < self.viewControllersNumber; i++) {
        [self.sourse addObject:[self createViewControllerWithNumber:i]];
    }
//    self.pageViewController = (CRPageViewController *)segue.destinationViewController;
    self.pageViewController.countPageInController = self.viewControllersNumber;
    self.pageViewController.childVCSize = CGSizeMake(250, 500);
    self.pageViewController.sizeBetweenVC = 10;
    self.pageViewController.OffsetOfHeightCentralVC = 0;
    self.pageViewController.animationSpeed = 0.5;
    self.pageViewController.animation = UIViewAnimationCurveEaseInOut;
    self.pageViewController.viewControllers = [NSMutableArray arrayWithArray:self.sourse];
    self.pageViewController.dataSource = self;
    for (int i = (int)self.viewControllersNumber; i < 3; i++) {
        [self.sourse addObject:[self createViewControllerWithNumber:i]];
    }
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
                        @[@"L Container", @"800"],
                        @[@"XL Container", @"1000"]];
    if ([segue.destinationViewController isKindOfClass:[CRPageViewController class]]) {
        self.pageViewController = [CRPageViewController new];
        self.sourse = [NSMutableArray new];
        self.viewControllersNumber = 3;
        for (int i = 0; i < self.viewControllersNumber; i++) {
            [self.sourse addObject:[self createViewControllerWithNumber:i]];
        }
        self.pageViewController = (CRPageViewController *)segue.destinationViewController;
        self.pageViewController.countPageInController = self.viewControllersNumber;
        self.pageViewController.childVCSize = CGSizeMake(250, 500);
        self.pageViewController.sizeBetweenVC = 10;
        self.pageViewController.OffsetOfHeightCentralVC = 0;
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
    [viewController zoomingImageOut];
}

- (void)focusedViewController:(DUContainerViewController *)viewController {
    self.curentVC = viewController;
    [viewController zoomingImageIn];
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
