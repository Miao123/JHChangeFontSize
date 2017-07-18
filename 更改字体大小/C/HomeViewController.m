//
//  HomeViewController.m
//  更改字体大小
//
//  Created by 苗建浩 on 2017/7/17.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, NAVGATION_ADD_STATUS_HEIGHT + 10, screenWidth - 20, 50)];
    textLabel.text = @"可以提高编译速度";
    textLabel.font = [UIFont systemFontOfSize:[MJHUser getFont]];
    textLabel.textColor = [UIColor darkGrayColor];
    self.textLabel = textLabel;
    [self.view addSubview:textLabel];
    
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, NAVGATION_ADD_STATUS_HEIGHT + 70, screenWidth - 20, 50)];
    addressLabel.text = @"北京市，海淀区";
    addressLabel.font = [UIFont systemFontOfSize:[MJHUser getFont] - 2];
    addressLabel.textColor = [UIColor darkGrayColor];
    self.textLabel = addressLabel;
    [self.view addSubview:addressLabel];
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
