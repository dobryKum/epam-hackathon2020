//
//  ViewController.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "ViewController.h"
#import "UserService.h"
#import "SceneDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) UserService *userService;
@property(nonatomic, strong)UITextField *phoneTextField;
@property(nonatomic, strong)UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    self.userService = [[UserService alloc] init];
    [self setupTextField];
    [self setupButton];
}

- (void)setupTextField {
    self.phoneTextField = [UITextField new];
    self.phoneTextField.backgroundColor = UIColor.whiteColor;
    self.phoneTextField.placeholder = @"Enter phone number";
    self.phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.phoneTextField.keyboardType = UIKeyboardTypeDefault;
    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.phoneTextField.delegate = self;
    [self.view addSubview:self.phoneTextField];

    self.phoneTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:80] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
}

- (void)setupButton {
    self.loginButton = [UIButton new];
    self.loginButton.backgroundColor = UIColor.blueColor;
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    [self.view addSubview:self.loginButton];

    [self.loginButton addTarget:self
                         action:@selector(loginButtonTapped:)
               forControlEvents:UIControlEventTouchUpInside];

    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.phoneTextField attribute:NSLayoutAttributeTop multiplier:1 constant:50] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.loginButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
}

- (void)loginButtonTapped: (UIButton *)sender {
    NSLog(@"loginButtonTapped");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Auth.didLogin" object:self];
}



@end
