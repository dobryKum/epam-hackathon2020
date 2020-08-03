//
//  Calendar.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

<<<<<<< HEAD
=======
@class Lesson;

>>>>>>> 62a7817c0fc6a6b9c624e1ac6e44aa8b9d549cdb
@interface Calendar : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *statusId;
@property (nonatomic, copy) NSString *teacher;
@property (nonatomic, copy) NSString *subject;
<<<<<<< HEAD
@property (nonatomic, copy) NSString *date;
=======
@property (nonatomic, copy) NSDate *date;
>>>>>>> 62a7817c0fc6a6b9c624e1ac6e44aa8b9d549cdb

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
