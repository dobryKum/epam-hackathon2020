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
//
//- (void)getToken:(void (^)(NSString *))completion {
//    GetTokenOperation *operation = [GetTokenOperation new];
//    operation.completion = ^(NSString *token) {
//        completion(token);
//    };
//    [self.queue addOperation:operation];
//}

- (void)getUserItemWithPhoneNumber:(NSString *)userPhoneNumber completion:(void (^)(User *))completion {
    GetTokenOperation *getTokenOperation = [GetTokenOperation new];
    getTokenOperation.completion = ^(NSString *token) {
        GetUserOperation *getUserOperation = [[GetUserOperation alloc] initWithToken:token andUserPhoneNumber:userPhoneNumber];
        getUserOperation.completion = ^(User *user) {
            completion(user);
        };
        [self.queue addOperation:getUserOperation];
    };
    [self.queue addOperation:getTokenOperation];
}

@end
