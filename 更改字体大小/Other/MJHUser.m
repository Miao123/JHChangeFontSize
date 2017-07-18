//
//  MJHUser.m
//  更改字体大小
//
//  Created by 苗建浩 on 2017/7/17.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "MJHUser.h"

@implementation MJHUser

+ (int)getFont{
    int baseFont = [[personalNSUserDe objectForKey:@"BaseFont"] intValue];
    return baseFont;
}

@end
