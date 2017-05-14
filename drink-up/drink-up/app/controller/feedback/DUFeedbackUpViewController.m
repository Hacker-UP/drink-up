//
//  DUFeedbackUpViewController.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUFeedbackUpViewController.h"

@interface DUFeedbackUpViewController ()
@property (weak, nonatomic) IBOutlet UILabel *upLabel;
@end

@implementation DUFeedbackUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void) configure {
    NSString *one = @"Congratulation! You have saved ";
    NSString *two = self.msg1;
    NSString *three = @" of water and got a ";
    NSString *four = self.msg2;
    NSString *five = @" tree.";
    
    NSMutableAttributedString *txt = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@%@", one, two, three, four, five]];
    [txt addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, one.length)];
    [txt addAttribute:NSForegroundColorAttributeName value:DUButtonColor range:NSMakeRange(one.length, two.length)];
    [txt addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(one.length + two.length, three.length)];
    [txt addAttribute:NSForegroundColorAttributeName value:DUButtonColor range:NSMakeRange(one.length + two.length + three.length, four.length)];
    [txt addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(one.length + two.length + three.length + four.length, five.length)];
    [txt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Thin" size:16.0] range:NSMakeRange(0, txt.length)];
    
    self.upLabel.attributedText = txt;
}

- (IBAction)return:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
