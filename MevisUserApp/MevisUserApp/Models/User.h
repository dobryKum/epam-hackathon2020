//
//  User.h
//  MevisUserApp
//
//  Created by Лера on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Lesson.h"

@class Calendar;

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSDate *dob;
@property (nonatomic, assign) float balance;
@property (nonatomic, assign) NSInteger paidLessonCount;
@property (nonatomic, copy) NSDate *paidTillDate;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, assign) UIImage *avatar;
@property (nonatomic, copy) NSArray<Calendar *> *calendar;
@property (nonatomic, copy) NSArray<Lesson *> *lessons;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
