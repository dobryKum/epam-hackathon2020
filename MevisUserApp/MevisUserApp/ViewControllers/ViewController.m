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

@property(nonatomic, strong) UIImageView *backgroundView;
@property(nonatomic, strong) UIImageView *logoView;
@property(nonatomic, strong) UILabel *infoLabel;
@property(nonatomic, strong) UITextField *phoneTextField;
@property(nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UserService *userService;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackgroundView];
    [self setupLogoView];
    self.userService = [[UserService alloc] init];
    [self setupTextField];
    [self setupButton];
}

- (void)setupBackgroundView {
    self.backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.layer.frame.size.width, self.view.layer.frame.size.height)];
    self.backgroundView.image = [UIImage imageNamed:@"backgroundView"];
    self.backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.backgroundView];
}

- (void)setupLogoView {
    self.logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo1"]];
//    self.logoView.backgroundColor = UIColor.whiteColor;
    [self.logoView setContentMode:UIViewContentModeScaleAspectFit];
    [self.logoView sizeToFit];
    [self.view addSubview: self.logoView];

    self.logoView.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
}

- (void)setupTextField {
    self.phoneTextField = [UITextField new];
    self.phoneTextField.backgroundColor = UIColor.whiteColor;
    self.phoneTextField.placeholder = @"+375(_)";
    self.phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
//    self.phoneTextField.keyboardType = UIKeyboardTypeDefault;
    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    self.phoneTextField.delegate = self;
    [self.view addSubview:self.phoneTextField];

    self.phoneTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.logoView attribute:NSLayoutAttributeBottom multiplier:1 constant:40] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
}

- (void)setupButton {
    self.loginButton = [UIButton new];
    self.loginButton.backgroundColor = UIColor.blueColor;
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [self.loginButton setTitle:@"Вход" forState:UIControlStateNormal];
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
    [self.userService getUserItemWithPhoneNumber:@"+375(33)333-33-33" completion:^(User *user) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.user = user;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Auth.didLogin" object:self];
        });
    }];
}



@end
