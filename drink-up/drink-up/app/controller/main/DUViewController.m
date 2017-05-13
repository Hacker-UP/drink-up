//
//  ViewController.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/13.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUViewController.h"
#import "DUSelectViewController.h"
#import "HVideoViewController.h"

@interface DUViewController ()

@end

@implementation DUViewController

- (IBAction)toCamera:(id)sender {
    HVideoViewController *ctrl = [[NSBundle mainBundle] loadNibNamed:@"HVideoViewController" owner:nil options:nil].lastObject;
    ctrl.HSeconds = 10000;//设置可录制最长时间
    ctrl.takeBlock = ^(id item) {
        if ([item isKindOfClass:[NSURL class]]) {
            NSURL *videoURL = item;
            //视频url
            
        } else {
            //图片
            
        }
    };
//    [self presentViewController:ctrl animated:YES completion:nil];
    DUSelectViewController *selectVC = [[UIStoryboard storyboardWithName:@"DUSelectViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DUSelectViewController"];

    [self.navigationController pushViewController:selectVC animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    self.navigationController.navigationBar.hidden = YES;
}


@end
