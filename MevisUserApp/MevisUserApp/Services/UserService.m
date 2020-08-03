//
//  UserService.m
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "UserService.h"
#import "JSONParser.h"
#import "GetTokenOperation.h"
#import "GetUserOperation.h"
#import "GetLessonsOperation.h"
#import "GetCalendarOperation.h"

@interface UserService ()

@property (nonatomic, copy) NSString *token;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) JSONParser *parser;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSOperationQueue *anotherQueue;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<NSOperation *> *> *operations;

@end


@implementation UserService

- (instancetype)init {
    self = [super init];
    if (self) {
        _token = [NSString new];
        _parser = [JSONParser new];
        _queue = [NSOperationQueue new];
        _anotherQueue = [NSOperationQueue new];
        _operations = [NSMutableDictionary new];
    }
    return self;
}

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return _session;
}

- (void)getUserItemWithPhoneNumber:(NSString *)userPhoneNumber completion:(void (^)(User *))completion {
    GetTokenOperation *getTokenOperation = [GetTokenOperation new];
    getTokenOperation.completion = ^(NSString *token) {
        [[NSUserDefaults standardUserDefaults] setObject:userPhoneNumber forKey:@"userLoginPhoneNumber"];
        self.token = token;
        GetUserOperation *getUserOperation = [[GetUserOperation alloc] initWithToken:self.token andUserPhoneNumber:userPhoneNumber];
        getUserOperation.completion = ^(User *user) {
            GetLessonsOperation *getLessonsOperation = [[GetLessonsOperation alloc] initWithToken:self.token andUser:user];
            getLessonsOperation.completion = ^(NSArray<Lesson *> *lessons) {
                GetCalendarOperation *getCalendarOperation = [[GetCalendarOperation alloc] initWithToken:self.token andUser:user];
                getCalendarOperation.completion = ^(NSArray<Calendar *> *calendar) {
                    user.lessons = [[lessons reverseObjectEnumerator] allObjects];
                    user.calendar = calendar;
                    completion(user);
                };
                [self.queue addOperation:getCalendarOperation];
            };
            [self.queue addOperation:getLessonsOperation];
        };
        [self.queue addOperation:getUserOperation];
    };
    [self.queue addOperation:getTokenOperation];
}

@end
