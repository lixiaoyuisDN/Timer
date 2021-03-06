//
//  AppDelegate.m
//  Timer
//
//  Created by bever on 16/2/19.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "baseNavigationController.h"

#import "FirstViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)loadViewController{
    
    //创建试图控制器
    NSArray *array = @[@"HomeViewController",@"DiscoverViewController",@"MtinfoViewController",@"PayTickViewController",@"StoreViewController"];
    
    NSMutableArray *mar = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    //创建二级控制器
    for (NSString *str in array) {
        UIViewController *viewcontroller = [[NSClassFromString(str) alloc]init];
        baseNavigationController *nav = [[baseNavigationController alloc] initWithRootViewController:viewcontroller];
        [mar addObject:nav];
        
    }
    
    BaseTabBarController *tabBar = [[BaseTabBarController alloc]init];
    tabBar.viewControllers = mar;
    self.window.rootViewController = tabBar;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    [self loadViewController];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    BOOL mark = [userDefault boolForKey:@"isFirst"];
    
    if (mark == NO) {
        
        self.window.rootViewController = [[FirstViewController alloc] init];
        [userDefault setBool:YES forKey:@"isFirst"];
        
        
    } else
    {
        self.window.rootViewController = [[MainViewController alloc] init];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
