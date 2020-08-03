//
//  ViewController.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "ViewController.h"
#import "SceneDelegate.h"
#import "UserService.h"
#import "User.h"

@interface ViewController () 

@property(nonatomic, strong) UIImageView *backgroundView;
@property(nonatomic, strong) UIImageView *logoView;
@property(nonatomic, strong) UILabel *infoLabel;
@property(nonatomic, strong) UITextField *phoneTextField;
@property(nonatomic, strong) UITextField *mobileTextField;
@property(nonatomic, strong) UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    [self setupBackgroundView];
    [self setupLogoView];
    [self setupInfoLabel];
    [self setupTextField];
    [self setupButton];
}

- (void)setupBackgroundView {
    self.userService = [UserService new];
    self.backgroundView = [UIImageView new];
    self.backgroundView.image = [UIImage imageNamed:@"backgroundView"];
    [self.backgroundView setContentMode:UIViewContentModeScaleToFill];
    self.backgroundView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview: self.backgroundView];
    [NSLayoutConstraint activateConstraints:@[
           [self.backgroundView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
           [self.backgroundView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
           [self.backgroundView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
           [self.backgroundView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
       ]];
}

- (void)setupLogoView {
    self.logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo1"]];
    [self.logoView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview: self.logoView];

    self.logoView.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:100] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
}

- (void)setupInfoLabel {

    self.infoLabel = [UILabel new];
    self.infoLabel.text = @"Введите номер телефона";
    self.infoLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    self.infoLabel.textColor = UIColor.whiteColor;
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    self.infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: self.infoLabel];


        [[NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.logoView attribute:NSLayoutAttributeBottom multiplier:1 constant:50] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.infoLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];

}

- (void)setupTextField {
    self.phoneTextField = [UITextField new];

    self.phoneTextField.backgroundColor = UIColor.whiteColor;
    self.phoneTextField.placeholder = @"+375(_)";
    self.phoneTextField.textColor = UIColor.blackColor;
    self.phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.phoneTextField.delegate = self;
    self.phoneTextField.textContentType = UITextContentTypeTelephoneNumber;

    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    self.phoneTextField.borderStyle = UITextBorderStyleNone;
    [self.phoneTextField.layer setMasksToBounds:YES];
    self.phoneTextField.layer.cornerRadius = 20;
    self.phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;

    [self.view addSubview:self.phoneTextField];
    [self.phoneTextField becomeFirstResponder];

    self.phoneTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.infoLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:10] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.phoneTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)setupButton {
    self.loginButton = [UIButton new];
    self.loginButton.backgroundColor = UIColor.orangeColor;
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [self.loginButton setTitle:@"Вход" forState:UIControlStateNormal];
    [self.loginButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    self.loginButton.layer.cornerRadius = 20;
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
