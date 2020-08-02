//
//  GetCalendarOperation.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Calendar.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetCalendarOperation : NSOperation

@property (nonatomic, copy) void(^completion)(NSArray <Calendar *> *);

- (instancetype)initWithToken:(NSString *)token andUser:(User *)user;

@end

NS_ASSUME_NONNULL_END
