//
//  AppDelegate.m
//  BongDaEuro2013
//
//  Created by MAC on 4/14/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize _danhSachThamGia;
@synthesize _lichThiDau;
@synthesize _ketQua;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    _danhSachThamGia = [[DanhSachThamGiaViewController alloc] initWithNibName:@"DanhSachThamGiaViewController" bundle:nil];
    _lichThiDau = [[LichThiDauViewController alloc] initWithNibName:@"LichThiDauViewController" bundle:nil];
    _ketQua = [[KetQuaViewController alloc] initWithNibName:@"KetQuaViewController" bundle:nil];
    
    
    // create navigation
    UINavigationController *navDanhSachThiDau = [[UINavigationController alloc] initWithRootViewController:_danhSachThamGia];
    navDanhSachThiDau.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Danh sách" image:[UIImage imageNamed:@"112-group.png"] tag:1];
    navDanhSachThiDau.tabBarItem.badgeValue = @"4";
    
    
    UINavigationController *navLichThiDau = [[UINavigationController alloc] initWithRootViewController:_lichThiDau];
    navLichThiDau.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lịch thi đấu" image:[UIImage imageNamed:@"83-calendar.png"] tag:2];
    navLichThiDau.tabBarItem.badgeValue = @"8";
    
    
    UINavigationController *navKetQua = [[UINavigationController alloc] initWithRootViewController:_ketQua];
    navKetQua.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Kết quả" image:[UIImage imageNamed:@"96-book.png"] tag:3];
    navKetQua.tabBarItem.badgeValue = @"10";
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navDanhSachThiDau, navLichThiDau, navKetQua];
    
    
    self.window.rootViewController = tabBarController;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
