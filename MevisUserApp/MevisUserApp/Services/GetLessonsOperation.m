//
//  GetLessonsOperation.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "GetLessonsOperation.h"
#import "JSONParser.h"

@interface GetLessonsOperation ()

@property (nonatomic, copy) NSString *token;
@property (nonatomic, strong) JSONParser *parser;
@property (nonatomic, strong) User *user;

@end


@implementation GetLessonsOperation

- (instancetype)initWithToken:(NSString *)token andUser:(User *)user
{
    self = [super init];
    if (self) {
        _token = token;
        _parser = [JSONParser new];
        _user = user;
    }
    return self;
}

- (void)main {
    NSURL *url = [NSURL URLWithString:@"https://mevis.s20.online/v2api/2/lesson/index"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    [request addValue:self.token forHTTPHeaderField:@"X-ALFACRM-TOKEN"];
    NSURLSessionTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self.parser parseLessons:data forUser:self.user completion:self.completion];
    }];
    [dataTask resume];
}

@end
