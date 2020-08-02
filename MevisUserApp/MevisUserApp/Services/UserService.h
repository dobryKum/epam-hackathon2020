//
//  UserService.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class User;

@interface UserService : NSObject

//- (void)getToken:(void (^)(NSString *))completion;
- (void)getUserItemWithPhoneNumber:(NSString *)userPhoneNumber completion:(void (^)(User *))completion;

@end

NS_ASSUME_NONNULL_END
