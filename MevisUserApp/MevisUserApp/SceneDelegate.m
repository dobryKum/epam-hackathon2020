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
#import "UserService.h"
#import "User.h"

@interface SceneDelegate ()

@property (nonatomic, strong) UserService *userService;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) ViewController *viewController;

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.window = [[UIWindow alloc] initWithWindowScene:[[UIWindowScene alloc] initWithSession:session connectionOptions:connectionOptions]];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin:) name:@"Auth.didLogin" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogout:) name:@"Auth.didLogout" object:nil];

    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"userLoginPhoneNumber"]) {
        self.userService = [UserService new];
        [self.userService getUserItemWithPhoneNumber:[[NSUserDefaults standardUserDefaults] stringForKey:@"userLoginPhoneNumber"]
                                          completion:^(User *user) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.user = user;
                [[NSNotificationCenter defaultCenter] postNotificationName:@"Auth.didLogin" object:self];
            });
        }];
    } else {
        self.viewController = [ViewController new];
        [self.window setRootViewController: self.viewController];
    }
    [self.window makeKeyAndVisible];
}

- (void)userDidLogout: (NSNotification *) notification {
    [self.window setRootViewController:[ViewController new]];
}

- (void)userDidLogin:(NSNotification *) notification {
    [self setupNewVC];
}

- (void)setupNewVC {
    HomeViewController *homeController = [HomeViewController new];
    LessonsViewController *lessonsController = [LessonsViewController new];

    if (self.viewController.user) {
        homeController.user = self.viewController.user;
        lessonsController.user = self.viewController.user;
    } else {
        homeController.user = self.user;
        lessonsController.user = self.user;
    }

//    homeController.user = self.user;

    homeController.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [UIImage imageNamed: @"person"] tag: 0];

    lessonsController.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [UIImage imageNamed:@"calendar"] tag: 1];


    UITabBarController *tabBarController = [UITabBarController new];
    tabBarController.viewControllers = @[homeController, lessonsController];

    tabBarController.tabBar.barTintColor = UIColor.whiteColor;
    tabBarController.tabBar.tintColor = UIColor.orangeColor;
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
