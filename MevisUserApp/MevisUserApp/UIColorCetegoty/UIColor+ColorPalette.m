//
//  UIColor+ColorPalette.m
//  MevisUserApp
//
//  Created by Лера on 8/2/20.
//  Copyright © 2020 Timofey Zykov. All rights reserved.
//

#import "UIColor+ColorPalette.h"

@implementation UIColor (ColorPalette)

+ (UIColor *) convertColorWithHex: (int) hexValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
    green:((float)((hexValue & 0xFF00) >> 8))/255.0
     blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0];
}

+ (UIColor *) customOrange {
    return [UIColor convertColorWithHex: 0xE76A27];
}

+ (UIColor *) lightBlue {
    return [UIColor convertColorWithHex: 0x63C9FF];
}

+ (UIColor *) mediumBlue {
    return [UIColor convertColorWithHex: 0x007ac1];
}

+ (UIColor *) mediumBlue2 {
    return [UIColor convertColorWithHex: 0x006aa8];
}

+ (UIColor *) darkBlue {
    return [UIColor convertColorWithHex: 0x2F7092];
}

@end
