//
//  HomeViewController.m
//  MevisUserApp
//
//  Created by Лера on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property(nonatomic, strong) UIScrollView *homeScrollView;
@property(nonatomic, strong) UIImageView *backgroundImage;
@property(nonatomic, strong) UIButton *logoutButton;
@property(nonatomic, strong) UIImageView *userImage;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *dobLabel;
@property(nonatomic, strong) UILabel *generalBalanceNumberLabel;
@property(nonatomic, strong) UILabel *generalBalanceDescLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
    [self setupBackgroundImage];
    [self setupUserImage];
    [self setupLogoutButton];
    [self setupNameLabel];
    [self setupDobLabel];
}

- (void)setupScrollView {

    self.homeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.layer.frame.size.width, self.view.layer.frame.size.height)];
    [self.homeScrollView setShowsVerticalScrollIndicator:YES];
    self.homeScrollView.scrollEnabled = YES;
    self.homeScrollView.backgroundColor = [UIColor blueColor];
    self.homeScrollView.contentSize = self.view.bounds.size;
    self.homeScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.homeScrollView];

}

- (void)setupLogoutButton {
    self.logoutButton = [UIButton new];
    self.logoutButton.backgroundColor = UIColor.blueColor;
    self.logoutButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [self.logoutButton setTitle:@"Выход" forState:UIControlStateNormal];
    [self.logoutButton setTitleColor: UIColor.whiteColor forState:UIControlStateNormal];
    [self.view addSubview:self.logoutButton];


#pragma mark - Navigation

    [self.logoutButton addTarget:self
                         action:@selector(logoutButtonTapped:)
               forControlEvents:UIControlEventTouchUpInside];

    self.logoutButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:50] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20] setActive:YES];
}

- (void)setupBackgroundImage {
    self.backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.layer.frame.size.width, 300)];
//    self.backgroundImage.image = [UIImage imageNamed:@"backgroundView"];
    self.backgroundImage.backgroundColor = [UIColor greenColor];
    self.backgroundImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.backgroundImage];
}

- (void)setupUserImage {
    self.userImage = [UIImageView new];
    self.userImage.backgroundColor = [UIColor yellowColor];
//    self.userImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo1"]];
//    self.userImage.backgroundColor = UIColor.whiteColor;
//    [self.userImage setContentMode:UIViewContentModeScaleAspectFit];
//    [self.userImage sizeToFit];
    self.userImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.userImage];


    [[NSLayoutConstraint constraintWithItem:self.userImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:50] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.userImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.userImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.userImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];
}

- (void)setupNameLabel {

    self.nameLabel = [UILabel new];
    self.nameLabel.text = @"Some User Name";
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: self.nameLabel];


        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.userImage attribute:NSLayoutAttributeBottom multiplier:1 constant:10] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.homeScrollView.frame.size.width] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];

}

- (void)setupDobLabel {

    self.dobLabel = [UILabel new];
    self.dobLabel.text = @"26.04.1959";
    self.dobLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: self.dobLabel];


        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.nameLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.homeScrollView.frame.size.width] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];

}

- (void)logoutButtonTapped: (UIButton *)sender {
    NSLog(@"logoutButtonTapped");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Auth.didLogout" object:self];
}
@end
