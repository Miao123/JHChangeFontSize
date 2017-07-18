//
//  ChangeFontController.m
//  更改字体大小
//
//  Created by 苗建浩 on 2017/7/17.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "ChangeFontController.h"
#import "AppDelegate.h"

@interface ChangeFontController ()
@property (nonatomic, copy) NSString *fontStr;
@property (nonatomic, strong) NSArray *fontArr;

@end

@implementation ChangeFontController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"字体大小";
    self.view.backgroundColor = [UIColor whiteColor];
    self.fontStr = [NSString stringWithFormat:@"%d",[MJHUser getFont]];
    
    
    
    NSArray *fontTextArr = @[@"标准",@"大",@"特大"];
    _fontArr = @[@16, @18, @20];
    for (int i = 0; i < 3; i++) {
        UIButton *fontBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        fontBtn.frame = CGRectMake(10 + 70 * i, NAVGATION_ADD_STATUS_HEIGHT + 10, 60, 50);
        fontBtn.backgroundColor = [UIColor whiteColor];
        [fontBtn setTitle:fontTextArr[i] forState:0];
        fontBtn.titleLabel.font = [UIFont systemFontOfSize:[_fontArr[i] intValue]];
        [fontBtn setTitleColor:[UIColor darkGrayColor] forState:0];
        [fontBtn addTarget:self action:@selector(fontBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        fontBtn.tag = 1000 + i;
        [self.view addSubview:fontBtn];
    }
    
    
    UIButton *gotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gotoBtn.frame = CGRectMake((screenWidth - 150) / 2, NAVGATION_ADD_STATUS_HEIGHT + 100, 150, 50);
    gotoBtn.backgroundColor = [UIColor redColor];
    [gotoBtn setTitle:@"确定" forState:0];
    [gotoBtn addTarget:self action:@selector(gotoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gotoBtn];
}


- (void)fontBtnClick:(UIButton *)sender{
    int tagCount = (int)sender.tag - 1000;
    _fontStr = [NSString stringWithFormat:@"%@",_fontArr[tagCount]];
}


- (void)gotoBtnClick:(UIButton *)sender{
    NSString *fontStr = [NSString stringWithFormat:@"%d",[MJHUser getFont]];
    if ([_fontStr isEqualToString:fontStr]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"labelFount" object:_fontStr];
        [[AppDelegate sharedApplication] openHomeVC];
    }
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
