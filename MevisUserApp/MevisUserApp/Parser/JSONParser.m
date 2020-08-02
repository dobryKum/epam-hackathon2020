//
//  JSONParser.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

- (void)parseUsers:(NSData *)data completion:(void (^)(User *))completion {
    NSError *error;
    if (error) {
        completion(nil);
        return;
    }
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error][@"items"][0];
    User *user = [[User alloc] initWithDictionary:dictionary];
    completion(user);
}

- (void)parseLessons:(NSData *)data forUser:(User *)user completion:(void (^)(NSArray<Lesson *> *))completion {
    NSError *error;
    if (error) {
        completion(nil);
        return;
    }
    NSMutableArray<Lesson *> *lessonsArray = [NSMutableArray new];
    NSArray<NSDictionary *> *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error][@"items"];
    for (NSDictionary *element in array) {
        for (NSDictionary *detail in element[@"details"]) {
            if ([detail[@"customer_id"] longValue]  == user.userId) {
                NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:element];
                [dictionary setObject:detail forKey:@"detail"];
                [lessonsArray addObject:[[Lesson alloc] initWithDictionary:dictionary]];
            }
        }
    }
    completion(lessonsArray);
}

- (void)parseCalendar:(NSData *)data completion:(void (^)(NSArray<Calendar *> *))completion {
    NSError *error;
    if (error) {
        completion(nil);
        return;
    }
    NSMutableArray<Calendar *> *calendarArray = [NSMutableArray new];
    NSArray<NSDictionary *> *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    for (NSDictionary *element in array) {
        [calendarArray addObject:[[Calendar alloc] initWithDictionary:element]];
    }
    completion(calendarArray);
}

@end
