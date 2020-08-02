//
//  GetCalendarOperation.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "GetCalendarOperation.h"
#import "JSONParser.h"

@interface GetCalendarOperation ()

@property (nonatomic, copy) NSString *token;
@property (nonatomic, strong) JSONParser *parser;
@property (nonatomic, strong) User *user;

@end

@implementation GetCalendarOperation

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
    NSURL *url = [NSURL URLWithString:@"https://mevis.s20.online/v2api/2/calendar/customer"];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    NSDate *currentDate = [NSDate date];
    NSString *firstDate = [dateFormatter stringFromDate:[currentDate dateByAddingTimeInterval:-2592000]];
    NSString *secondDate = [dateFormatter stringFromDate:[currentDate dateByAddingTimeInterval:2592000]];
    NSArray<NSURLQueryItem *> *query = @[
        [NSURLQueryItem queryItemWithName:@"id" value:[NSString stringWithFormat:@"%ld", self.user.userId]],
        [NSURLQueryItem queryItemWithName:@"date1" value:firstDate],
        [NSURLQueryItem queryItemWithName:@"date2" value:secondDate],
    ];
    [urlComponents setQueryItems:query];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlComponents.URL];
    request.HTTPMethod = @"POST";
    [request addValue:self.token forHTTPHeaderField:@"X-ALFACRM-TOKEN"];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self.parser parseCalendar:data completion:self.completion];
    }];
    [task resume];
}

@end
