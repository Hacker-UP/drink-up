//
//  DUContainerViewController.m
//  drink-up
//
//  Created by Polaris Chen on 13/05/2017.
//  Copyright © 2017 hackathon-UP. All rights reserved.
//

#import "DUContainerViewController.h"

@interface DUContainerViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *containerImageView;

@end

@implementation DUContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)zoomingImageIn {
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect rectOfImage = self.containerImageView.frame;
        rectOfImage.origin.x -= 26;
        rectOfImage.origin.y -= 26;
        rectOfImage.size.height += 52;
        rectOfImage.size.width += 52;
        self.containerImageView.frame = rectOfImage;
    } completion:^(BOOL finished) {
    }];
}

- (void)zoomingImageOut {
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect rectOfImage = self.containerImageView.frame;
        rectOfImage.origin.x += 26;
        rectOfImage.origin.y += 26;
        rectOfImage.size.height -= 52;
        rectOfImage.size.width -= 52;
        self.containerImageView.frame = rectOfImage;
    } completion:^(BOOL finished) {
    }];
}

@end
