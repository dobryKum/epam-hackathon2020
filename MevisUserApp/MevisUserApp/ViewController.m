//
//  ViewController.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "ViewController.h"
#import "UserService.h"

@interface ViewController ()

@property (nonatomic, strong) UserService *userService;
@property (nonatomic, copy) NSString *userPhoneNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    self.userService = [[UserService alloc] init];
    self.userPhoneNumber = @"+53-4-634-6546";
    [self.userService getUserItemWithPhoneNumber:self.userPhoneNumber completion:^(User *user) {
        
    }];
}




@end
