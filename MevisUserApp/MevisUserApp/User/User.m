//
//  User.m
//  MevisUserApp
//
//  Created by Лера on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _userId = dictionary[@"id"];
        _name = dictionary[@"name"];
        _dob = dictionary[@"dob"];
        _balance = dictionary[@"balance"];
        NSDictionary *phoneArray = dictionary[@"phone"];
        _phone = phoneArray.firstObject;
        NSDictionary *emailArray = dictionary[@"email"];
        _email = emailArray.firstObject;
    }
    return self;
}
@end
