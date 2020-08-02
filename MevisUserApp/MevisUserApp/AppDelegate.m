//
//  AppDelegate.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "LessonsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

//- (void)rootViewController {
//
//    UIViewController *homeController = [HomeViewController new];
//    UIViewController *lessonsController = [LessonsViewController new];
//
//    homeController.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [UIImage imageNamed: @"home"] tag: 0];
//    lessonsController.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [UIImage imageNamed: @"list"] tag: 1];
//
//    UITabBarController *tabBarController = [UITabBarController new];
//    tabBarController.viewControllers = @[homeController, lessonsController];
//
//    tabBarController.tabBar.barTintColor = UIColor.whiteColor;
//    tabBarController.tabBar.tintColor = UIColor.blackColor;
//    [tabBarController setSelectedIndex:0];
//
//    self.window.rootViewController = tabBarController;
//}

@end
