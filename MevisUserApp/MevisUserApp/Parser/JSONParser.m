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
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error][@"items"][0];
    if (error) {
        completion(nil);
        return;
    }
    User *user = [[User alloc] initWithDictionary:dictionary];
    
    completion(user);
}

@end
