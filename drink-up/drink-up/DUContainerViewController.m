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
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;

@end

@implementation DUContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameLabel.text = self.sourse[0];
    self.volumeLabel.text = [NSString stringWithFormat:@"%@mL", self.sourse[1]];
    self.containerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"container-%@-empty", self.sourse[1]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)zoomingImageIn {
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
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
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
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
