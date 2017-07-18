//
//  SetUpViewController.m
//  更改字体大小
//
//  Created by 苗建浩 on 2017/7/17.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "SetUpViewController.h"
#import "ChangeFontController.h"

@interface SetUpViewController ()

@end

@implementation SetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((screenWidth - 180) / 2, NAVGATION_ADD_STATUS_HEIGHT + 10, 180, 50);
    [button setTitle:@"点击更改字体大小" forState:0];
    button.titleLabel.font = [UIFont systemFontOfSize:[MJHUser getFont]];
    button.backgroundColor = [UIColor grayColor];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)buttonClick:(UIButton *)sender{
    ChangeFontController *changeFontVC = [[ChangeFontController alloc] init];
    changeFontVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:changeFontVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
