//
//  JSONParser.h
//  MevisUserApp
//
//  Created by Tsimafei Zykau on 8/1/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSONParser : NSObject

- (void)parseUsers:(NSData *)data completion:(void (^)(User *))completion;

@end

NS_ASSUME_NONNULL_END
