//
//  UIColor+ColorPalette.h
//  MevisUserApp
//
//  Created by Лера on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorPalette)

+ (UIColor *) convertColorWithHex: (int) hexValue;
+ (UIColor *) customOrange;
+ (UIColor *) lightBlue;
+ (UIColor *) mediumBlue;
+ (UIColor *) mediumBlue2;
+ (UIColor *) darkBlue;

@end

NS_ASSUME_NONNULL_END
