//
//  DUContainerViewController.h
//  drink-up
//
//  Created by Polaris Chen on 13/05/2017.
//  Copyright © 2017 hackathon-UP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DUContainerViewController : UIViewController

@property (strong, nonatomic) NSArray *sourse;

- (void)zoomingImageIn;
- (void)zoomingImageOut;

@end
