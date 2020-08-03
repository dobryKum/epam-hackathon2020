//
//  ViewController.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User, UserService;

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) UserService *userService;

@end

