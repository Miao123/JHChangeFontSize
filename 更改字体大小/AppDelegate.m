//
//  AppDelegate.m
//  更改字体大小
//
//  Created by 苗建浩 on 2017/7/17.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ActivityViewController.h"
#import "SetUpViewController.h"


@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic, strong) UITabBarController *tabBarController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self openHomeVC];
    //    [self setUpNavigationBarAppearance];
    [self.window makeKeyAndVisible];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFont:) name:@"labelFount" object:nil];
    
    if (![personalNSUserDe boolForKey:@"BaseFontYes"]) {
        [personalNSUserDe setObject:@"16" forKey:@"BaseFont"];
    }
    return YES;
}


- (void)changeFont:(NSNotification *)notification{
    
    [personalNSUserDe setBool:YES forKey:@"BaseFontYes"];
    NSString *font = [NSString stringWithFormat:@"%@",notification.object];
    [personalNSUserDe setObject:font forKey:@"BaseFont"];
}


- (void)openHomeVC{
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    self.tabBarController = [self tabBarItemControllers:homeVC];
    self.tabBarController.delegate = self;
    self.window.rootViewController = self.tabBarController;
}


+ (instancetype)sharedApplication{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (UITabBarController *)tabBarItemControllers:(UIViewController *)mainViewController{
//    if (_tabBarController == nil) {
        UITabBarItem *itemHome = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"首页"] selectedImage:[UIImage imageNamed:@"首页-2"]];
        
        UITabBarItem *itemActive = [[UITabBarItem alloc] initWithTitle:@"动态" image:[UIImage imageNamed:@"活动"] selectedImage:[UIImage imageNamed:@"活动-2"]];
        
        UITabBarItem *itemSetUp = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"设置"] selectedImage:[UIImage imageNamed:@"设置-2"]];
        
        UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        navHome.tabBarItem = itemHome;
        
        ActivityViewController *activityVC = [[ActivityViewController alloc] init];
        UINavigationController *actiNav = [[UINavigationController alloc] initWithRootViewController:activityVC];
        actiNav.tabBarItem = itemActive;
        
        SetUpViewController *setUpVC = [[SetUpViewController alloc] init];
        UINavigationController *setUpNav = [[UINavigationController alloc] initWithRootViewController:setUpVC];
        setUpNav.tabBarItem = itemSetUp;
        
        UITabBarController *tabBarCotroller = [[UITabBarController alloc] init];
        [tabBarCotroller setViewControllers:@[navHome, actiNav, setUpNav]];
        
        [self customizeTabBarAppearance:tabBarCotroller];
        _tabBarController = tabBarCotroller;
//    }
    return _tabBarController;
}


- (void)customizeTabBarAppearance:(UITabBarController *)tabBarController {
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.086 green:0.522 blue:0.837 alpha:1.000];
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}


- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    navigationBarAppearance.barTintColor = [UIColor colorWithRed:0.165 green:0.157 blue:0.180 alpha:1.000];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        //        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        textAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18],
                           NSForegroundColorAttributeName: [UIColor whiteColor],};
        
    }else{
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        //        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        
        textAttributes = @{
                           UITextAttributeFont: [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor: [UIColor blackColor],
                           UITextAttributeTextShadowColor: [UIColor clearColor],
                           UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    [navigationBarAppearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:@"labelFount"];
}

@end
