//
//  AppDelegate.m
//  TextureDemo
//
//  Created by lanfeng on 2017/7/31.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YYFPSLabel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
#ifdef DEBUG
    [[[UIApplication sharedApplication] keyWindow].rootViewController.view addSubview:[[YYFPSLabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width - 100, 20, 50, 20)]];
#else
    
#endif
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = [[UINavigationController alloc] init];
//    
//    [self pushNewViewControllerAnimated:NO];
//    
//    [self.window makeKeyAndVisible];
    return YES;
}

- (void)pushNewViewControllerAnimated:(BOOL)animated
{
    UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
    
    UIViewController *viewController = [[ViewController alloc] init];
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Push Another Copy" style:UIBarButtonItemStylePlain target:self action:@selector(pushNewViewController)];
    
    [navController pushViewController:viewController animated:animated];
}

- (void)pushNewViewController
{
    [self pushNewViewControllerAnimated:YES];
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


@end
