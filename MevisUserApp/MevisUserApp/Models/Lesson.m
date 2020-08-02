//
//  Lesson.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "Lesson.h"

@implementation Lesson

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        NSDictionary *detail = dictionary[@"detail"];
        _id = dictionary[@"id"];
        _price = detail[@"commission"];
        _date = dictionary[@"date"];
        _statusId = dictionary[@"status"];
        _reasonId = detail[@"reason_id"];
        _typeId = dictionary[@"typeId"];
        _isAttend = detail[@"is_attend"];
    }
    return self;
}

@end
