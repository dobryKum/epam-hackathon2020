//
//  GetUserOperation.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "GetUserOperation.h"
#import "JSONParser.h"

@interface GetUserOperation ()

@property (nonatomic, strong) JSONParser *parser;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *userPhoneNumber;

@end

@implementation GetUserOperation

- (instancetype)initWithToken:(NSString *)token andUserPhoneNumber:(NSString *)userPhoneNumber
{
    self = [super init];
    if (self) {
        _token = token;
        _userPhoneNumber = userPhoneNumber;
        _parser = [JSONParser new];
    }
    return self;
}

- (void)main {
    NSURL *url = [NSURL URLWithString:@"https://mevis.s20.online/v2api/2/customer/index"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request addValue:self.token forHTTPHeaderField:@"X-ALFACRM-TOKEN"];
    NSDictionary *httpBodyKeysValues = @{
        @"phone":self.userPhoneNumber
    };
    NSData *httpBody = [NSJSONSerialization dataWithJSONObject:httpBodyKeysValues options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = httpBody;
    
    NSURLSessionTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self.parser parseUsers:data completion:self.completion];
    }];
    [dataTask resume];
}

@end
