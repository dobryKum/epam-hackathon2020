//
//  Calendar.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calendar : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *statusId;
@property (nonatomic, copy) NSString *teacher;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *date;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
