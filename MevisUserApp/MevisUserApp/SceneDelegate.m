//
//  SceneDelegate.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "LessonsViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithWindowScene:[[UIWindowScene alloc] initWithSession:session connectionOptions:connectionOptions]];
    [self.window setRootViewController:[ViewController new]];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin:) name:@"Auth.didLogin" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogout:) name:@"Auth.didLogout" object:nil];
    [self.window makeKeyAndVisible];
}

- (void)userDidLogout: (NSNotification *) notification {
    [self.window setRootViewController:[ViewController new]];
}

- (void)userDidLogin: (NSNotification *) notification {

    UIViewController *homeController = [HomeViewController new];
    UIViewController *lessonsController = [LessonsViewController new];

    homeController.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [UIImage imageNamed: @"home"] tag: 0];
    lessonsController.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [UIImage imageNamed: @"list"] tag: 1];

    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[homeController, lessonsController];

    tabBarController.tabBar.barTintColor = UIColor.whiteColor;
    tabBarController.tabBar.tintColor = UIColor.blackColor;
    [tabBarController setSelectedIndex:0];

    self.window.rootViewController = tabBarController;
}

- (void)sceneDidDisconnect:(UIScene *)scene {
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
}

- (void)sceneWillResignActive:(UIScene *)scene {
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
}

@end
