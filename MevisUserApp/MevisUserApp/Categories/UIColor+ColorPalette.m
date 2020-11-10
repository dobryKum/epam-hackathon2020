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

+ (UIColor *) lightSky {
    return [UIColor convertColorWithHex: 0xcaebfc];
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

+ (UIColor *) lessonRed {
    return [UIColor convertColorWithHex: 0xF2DEDE];
}

+ (UIColor *)lessonRedText {
    return [UIColor convertColorWithHex: 0xeb5767];
}

+ (UIColor *)lessonGreen {
    return [UIColor convertColorWithHex: 0xdff0d9];
}

+ (UIColor *)lessonGreenText {
    return [UIColor convertColorWithHex: 0x28b294];
}

+ (UIColor *)lessonYellow {
    return [UIColor convertColorWithHex: 0xfcf8e4];
}

+ (UIColor *)lessonYellowText {
    return [UIColor convertColorWithHex: 0xfda428];
}

+ (UIColor *)lessonGray {
    return [UIColor convertColorWithHex: 0xf3f3f4];
}

+ (UIColor *)lessonGrayText {
    return [UIColor convertColorWithHex: 0x656565];
}


@end
