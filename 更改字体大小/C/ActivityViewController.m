//
//  ActivityViewController.m
//  更改字体大小
//
//  Created by 苗建浩 on 2017/7/17.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"活动";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, NAVGATION_ADD_STATUS_HEIGHT + 10, screenWidth - 20, 50)];
    textLabel.text = @"中国是世界四大文明古国之一";
    textLabel.font = [UIFont systemFontOfSize:[MJHUser getFont]];
    [self.view addSubview:textLabel];
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
