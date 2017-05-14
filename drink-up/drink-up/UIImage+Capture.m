//
//  UIImage+Capture.m
//  TimeCaps
//
//  Created by Polaris Chen on 01/02/2017.
//  Copyright © 2017 Polaris Chen. All rights reserved.
//

#import "UIImage+Capture.h"

@implementation UIImage (Capture)

+ (UIImage *)imageCaptureFromView:(UIView *)view {
    CGSize size = CGSizeMake(view.frame.size.width, view.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
