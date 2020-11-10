//
//  GetUserOperation.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetUserOperation : NSOperation

@property (nonatomic, copy) void(^completion)(User *);

- (instancetype)initWithToken:(NSString *)token andUserPhoneNumber:(NSString *)userPhoneNumber;

@end

NS_ASSUME_NONNULL_END
