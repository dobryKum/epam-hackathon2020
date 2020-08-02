//
//  GetTokenOperation.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "GetTokenOperation.h"

@interface GetTokenOperation ()

@property (nonatomic, copy) NSString *token;

@end


@implementation GetTokenOperation

- (void)main {
    NSURL *url = [NSURL URLWithString:@"https://mevis.s20.online/v2api/auth/login"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSDictionary *httpBodyKeysValues = @{
        @"email":@"luba200296.lv@gmail.com",
        @"api_key":@"02bb1557-d34d-11ea-a443-ac1f6b478310"
    };
    NSData *httpBody = [NSJSONSerialization dataWithJSONObject:httpBodyKeysValues options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = httpBody;
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error has been occured");
        } else {
            NSString *token = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil][@"token"];
            self.completion(token);
        }
    }];
    
    [task resume];
}

@end
