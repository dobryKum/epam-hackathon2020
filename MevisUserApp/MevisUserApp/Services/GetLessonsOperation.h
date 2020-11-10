//
//  GetLessonsOperation.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class User, Lesson;

@interface GetLessonsOperation : NSOperation

@property (nonatomic, copy) void(^completion)(NSArray <Lesson *> *);

- (instancetype)initWithToken:(NSString *)token andUser:(User *)user;

@end

NS_ASSUME_NONNULL_END
