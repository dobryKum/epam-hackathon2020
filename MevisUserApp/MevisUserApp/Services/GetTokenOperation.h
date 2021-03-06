//
//  GetTokenOperation.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetTokenOperation : NSOperation

@property (nonatomic, copy) void(^completion)(NSString *);

@end

NS_ASSUME_NONNULL_END
