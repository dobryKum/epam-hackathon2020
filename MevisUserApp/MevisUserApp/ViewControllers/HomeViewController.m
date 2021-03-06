//
//  HomeViewController.m
//  MevisUserApp
//
//  Created by Лера on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+ColorPalette.h"
#import "User.h"
#import "InfoCell.h"
#import "SceneDelegate.h"

@interface HomeViewController ()

@property(nonatomic, strong) UIImageView *backgroundImage;
@property(nonatomic, strong) UIView *gradientView2;
@property(nonatomic, strong) UIImageView *userView;
@property(nonatomic, strong) UIButton *logoutButton;
@property(nonatomic, strong) UIImageView *userImage;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *dobLabel;
@property(nonatomic, strong) UILabel *balanceNumberLabel;
@property(nonatomic, strong) UILabel *balanceDescLabel;
@property (nonatomic, strong) UITableView *infoTableView;

@end

@implementation HomeViewController

static NSString *cellId = @"InfoCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackgroundImage];
    [self setupGradientView];
    [self setupUserImage];
    [self setupLogoutButton];
    [self setupNameLabel];
    [self setupDobLabel];
    [self setupBalanceNumberLabel];
    [self setupBalanceDescLabel];
    [self setupTableView];
}


- (void)setupLogoutButton {
    self.logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [[UIImage imageNamed:@"logout"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.logoutButton setImage:image forState:UIControlStateNormal];
    self.logoutButton.tintColor = UIColor.orangeColor;
    [self.view addSubview:self.logoutButton];

    [self.logoutButton addTarget:self
                         action:@selector(logoutButtonTapped:)
               forControlEvents:UIControlEventTouchUpInside];

    self.logoutButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:50] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30] setActive:YES];

    [[NSLayoutConstraint constraintWithItem:self.logoutButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20] setActive:YES];
}

- (void)setupBackgroundImage {
    self.backgroundImage = [UIImageView new];
    [self.backgroundImage setContentMode:UIViewContentModeScaleAspectFit];
    [self.backgroundImage sizeToFit];
    self.backgroundImage.backgroundColor = [UIColor greenColor];
    self.backgroundImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.backgroundImage];

    [NSLayoutConstraint activateConstraints:@[
           [self.backgroundImage.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
           [self.backgroundImage.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
           [self.backgroundImage.topAnchor constraintEqualToAnchor:self.view.topAnchor],
           [self.backgroundImage.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:300]
       ]];

}
- (void)setupGradientView {
    UIView *gradientView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 400)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.colors = [NSArray arrayWithObjects: (id)UIColor.lightBlue.CGColor, (id)UIColor.mediumBlue.CGColor, nil];
    gradient.frame = gradientView.frame;
    [gradientView.layer insertSublayer:gradient atIndex:0];
    [self.backgroundImage addSubview:gradientView];
    [self.backgroundImage bringSubviewToFront: gradientView];

    UIView *gradientView2 = [[UIView alloc] initWithFrame: CGRectMake(0, 135, self.view.frame.size.width, 80)];

    gradientView2.backgroundColor = UIColor.clearColor;
    CAGradientLayer *gradient2 = [CAGradientLayer layer];
    gradient2.startPoint = CGPointMake(0.0, 0.5);
    gradient2.endPoint = CGPointMake(1.0, 0.5);
    gradient2.colors = [NSArray arrayWithObjects: (id)UIColor.lightBlue.CGColor, (id)UIColor.mediumBlue2.CGColor, nil];
    gradient2.frame = gradientView2.frame;
    [gradientView2.layer insertSublayer:gradient2 atIndex:0];
    [self.backgroundImage addSubview:gradientView2];
    [self.backgroundImage bringSubviewToFront:gradientView2];
    gradientView2.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setupUserImage {

    self.userView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"person"]];
    self.userView.image = [self.userView.image imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    [self.userView setTintColor: UIColor.orangeColor];
    self.userView.contentMode = UIViewContentModeCenter;
    self.userView.tintColor = UIColor.orangeColor;
    self.userView.backgroundColor = UIColor.lightSky;
    self.userView.layer.cornerRadius = 100/2;
    self.userView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.userView];
    [NSLayoutConstraint activateConstraints:@[
        [self.userView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:40],
        [self.userView.widthAnchor constraintEqualToConstant:100],
        [self.userView.heightAnchor constraintEqualToConstant:100],
        [self.userView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];

    UIImageView *borderView = [UIImageView new];
    borderView.layer.borderWidth = 2.0;
    borderView.layer.cornerRadius = 120/2;
    borderView.layer.borderColor = [[UIColor lightSky] CGColor];
    borderView.clipsToBounds = true;
    borderView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: borderView];
    [NSLayoutConstraint activateConstraints:@[
        [borderView.centerYAnchor constraintEqualToAnchor:self.userView.centerYAnchor],
        [borderView.widthAnchor constraintEqualToConstant:120],
        [borderView.heightAnchor constraintEqualToConstant:120],
        [borderView.centerXAnchor constraintEqualToAnchor:self.userView.centerXAnchor]
    ]];
}

- (void)setupNameLabel {

    self.nameLabel = [UILabel new];
    self.nameLabel.text = self.user.name;
    self.nameLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightLight];
    self.nameLabel.numberOfLines = 0;
    [self.nameLabel sizeToFit];
    CGRect titleLabelBounds = self.nameLabel.bounds;
    titleLabelBounds.size.height = CGFLOAT_MAX;

    CGRect minimumTextRect = [self.nameLabel textRectForBounds:titleLabelBounds limitedToNumberOfLines:2];
    CGFloat titleLabelHeightDelta = minimumTextRect.size.height - self.nameLabel.frame.size.height;
    CGRect titleFrame = self.nameLabel.frame;
    titleFrame.size.height += titleLabelHeightDelta;
    self.nameLabel.frame = titleFrame;

    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: self.nameLabel];


        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.userView attribute:NSLayoutAttributeBottom multiplier:1 constant:20] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];

}

- (void)setupDobLabel {

    self.dobLabel = [UILabel new];
    self.dobLabel.text = [NSString stringWithFormat: @"%@", self.user.dob];
    self.dobLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightSemibold];
    self.dobLabel.textColor = UIColor.darkBlue;
    self.dobLabel.textAlignment = NSTextAlignmentCenter;
    self.dobLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: self.dobLabel];


        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.nameLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:3] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.dobLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];

}

- (void)setupBalanceNumberLabel {

    self.balanceNumberLabel = [UILabel new];
    self.balanceNumberLabel.text = [NSString stringWithFormat:@"%ld", (long)self.user.paidLessonCount];
    self.balanceNumberLabel.font = [UIFont systemFontOfSize:34 weight:UIFontWeightLight];
    self.balanceNumberLabel.textColor = [UIColor whiteColor];
    self.balanceNumberLabel.textAlignment = NSTextAlignmentCenter;
    self.balanceNumberLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: self.balanceNumberLabel];


        [[NSLayoutConstraint constraintWithItem:self.balanceNumberLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.dobLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:15] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.balanceNumberLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.balanceNumberLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.balanceNumberLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];

}

- (void)setupBalanceDescLabel {

    self.balanceDescLabel = [UILabel new];
    self.balanceDescLabel.text = @"ОБЩИЙ БАЛАНС ЗАНЯТИЙ";
    self.balanceDescLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightLight];
    self.balanceDescLabel.textColor = [UIColor whiteColor];
    self.balanceDescLabel.textAlignment = NSTextAlignmentCenter;
    self.balanceDescLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: self.balanceDescLabel];


        [[NSLayoutConstraint constraintWithItem:self.balanceDescLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.balanceNumberLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:5] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.balanceDescLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.balanceDescLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width] setActive:YES];

        [[NSLayoutConstraint constraintWithItem:self.balanceDescLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0] setActive:YES];

}

- (void)setupTableView {
    self.infoTableView = [UITableView new];
    self.infoTableView.tableFooterView = [[UIView alloc] initWithFrame: CGRectZero];
    self.infoTableView.delegate = self;
    self.infoTableView.dataSource = self;
    self.infoTableView.backgroundColor = UIColor.whiteColor;
    [self.infoTableView setRowHeight:80];
    [self.view addSubview:self.infoTableView];
    self.infoTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.infoTableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
        [self.infoTableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
        [self.infoTableView.topAnchor constraintEqualToAnchor:self.backgroundImage.bottomAnchor],
        [self.infoTableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
    ]];

    [self.infoTableView registerNib:[UINib nibWithNibName:@"InfoCell" bundle: nil] forCellReuseIdentifier: cellId];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    InfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.backgroundColor = UIColor.whiteColor;
    [cell configure];


    if (indexPath.row == 0) {
        cell.titleLabel.text = @"Телефон";
        cell.infoLabel.text = self.user.phone;
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = @"E-mail";
        cell.infoLabel.text = self.user.email;
    } else if (indexPath.row == 2) {
        cell.titleLabel.text = @"Баланс";
        cell.infoLabel.text = [NSString stringWithFormat:@"%.02f", self.user.balance];
    }
    return cell;
}

- (void)logoutButtonTapped: (UIButton *)sender {
    NSLog(@"logoutButtonTapped");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Auth.didLogout" object:self];
}

@end
