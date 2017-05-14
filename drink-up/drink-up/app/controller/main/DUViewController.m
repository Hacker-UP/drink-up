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
#import "DUUserDefaultHelper.h"

#import "DUMainCardTableViewCell.h"
#import "UIImage+Capture.h"

#import "Masonry.h"
#import "HTPressableButton.h"

@interface DUViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *bakView;
@property (weak, nonatomic) IBOutlet HTPressableButton *mainButton;

@property (nonatomic, copy) NSMutableArray<DURecordObject *> *cellDatas;

@end

@implementation DUViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialDatas];
    [self initialViews];
    [self registerCells];
    [self addViews];
    [self setLayouts];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self updateDatas];
}

- (void)initialDatas {
    self.cellDatas = [DUUserDefaultHelper readData].copy;
}

- (void)initialViews {
    self.title = @"Drink Up";
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 40.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.bakView.layer.masksToBounds = YES;
    self.bakView.layer.cornerRadius = 1;
    self.bakView.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    self.bakView.layer.shadowOffset = CGSizeMake(0, -4);
    self.bakView.layer.shadowOpacity = 0.4;
    self.bakView.layer.shadowRadius = 1.0;
    self.bakView.clipsToBounds = NO;
    
    self.mainButton.style = HTPressableButtonStyleRounded;
    self.mainButton.shadowHeight = 8;
    self.mainButton.buttonColor = DUButtonColor;
    self.mainButton.shadowColor = DUButtonDarkenColor;
    self.mainButton.cornerRadius = 6;
}

- (void)registerCells {
    [self.tableView registerNib:[UINib nibWithNibName:DUMainCardTableViewCellId bundle:nil] forCellReuseIdentifier:DUMainCardTableViewCellId];
}

- (void)addViews {
    [self.view insertSubview:self.tableView atIndex:0];
}

- (void)setLayouts {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.bakView.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}

- (void)updateDatas {
    self.cellDatas = [DUUserDefaultHelper readData].copy;
    [self.tableView reloadData];
}

- (IBAction)toCamera:(id)sender {
    DUSelectViewController *selectVC = [[UIStoryboard storyboardWithName:@"DUSelectViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DUSelectViewController"];

    [self.navigationController pushViewController:selectVC animated:YES];
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellDatas.count;
}

#pragma mark - UITableDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DUMainCardTableViewCell *cell = (DUMainCardTableViewCell *)[tableView dequeueReusableCellWithIdentifier:DUMainCardTableViewCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.obj = self.cellDatas[indexPath.row];
    [cell configCells];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DUMainCardTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIImage *image = [UIImage imageCaptureFromView:cell.bakView];
    NSArray *activityItems = @[image];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypePrint];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
