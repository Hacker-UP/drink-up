//
//  DUFeedbackDownViewController.m
//  drink-up
//
//  Created by 段昊宇 on 2017/5/14.
//  Copyright © 2017年 hackathon-UP. All rights reserved.
//

#import "DUFeedbackDownViewController.h"

@interface DUFeedbackDownViewController ()

@property (weak, nonatomic) IBOutlet UILabel *downLabel;

@end

@implementation DUFeedbackDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (IBAction)return:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)configure {
    int value = arc4random() % 3;
    if (value == 0) {
        NSString *one = @"But you could use this ";
        NSString *two = self.msg2;
        NSString *three = @" of water to shower a real plant.";
        NSMutableAttributedString *txt = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", one, two, three]];
        [txt addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, one.length)];
        [txt addAttribute:NSForegroundColorAttributeName value:DUButtonColor range:NSMakeRange(one.length, two.length)];
        [txt addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(one.length + two.length, three.length)];
        [txt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Thin" size:16.0] range:NSMakeRange(0, txt.length)];
        self.downLabel.attributedText = txt;
    }
    else if (value == 1) {
        self.downLabel.text = @"There are 30 million people in the world who are extremely short of water. Let’s take our responsibility.";
        
    }
    else if (value == 2) {
        NSString *one = @"";
        NSString *two = self.msg2;
        NSString *three = @" of water can help a dying tree regain its life. Don’t give up a life easily.";
        NSMutableAttributedString *txt = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", one, two, three]];
        [txt addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, one.length)];
        [txt addAttribute:NSForegroundColorAttributeName value:DUButtonColor range:NSMakeRange(one.length, two.length)];
        [txt addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(one.length + two.length, three.length)];
        [txt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Thin" size:16.0] range:NSMakeRange(0, txt.length)];
        self.downLabel.attributedText = txt;
    }
}

@end
