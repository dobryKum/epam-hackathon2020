//
//  Calendar.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _id = dictionary[@"id"];
        _typeId = dictionary[@"type"];
        _statusId = dictionary[@"status"];
        _teacher = dictionary[@"teacher"];
        _subject = dictionary[@"subject"];
        _date = dictionary[@"date"];
    }
    return self;
}

@end
