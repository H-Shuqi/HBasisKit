//
//  NSString+Kit.m
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <HBasisKit/HNSString+Kit.h>

@implementation NSString (HNSString_Kit)

/**
 *  空及空串判断
 *  包含 NULl null NSNull nil @"" 及非法对象等
 *  @return BOOL
 */
+ (BOOL)isEmpty:(NSString *)str{
    if(str == NULL || str == nil || [str isKindOfClass:[NSNull class]] || ![str isKindOfClass:[NSString class]]
       || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0
       || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        return YES;
    }else{
        return NO;
    }
}

/**
 *  空判断
 *  包含 NULL null NSNull nil 等
 *  @return BOOL
 */
+ (BOOL)isNUll:(id)str{
    if(str == NULL || str == nil || [str isKindOfClass:[NSNull class]]){
        return YES;
    }
    return NO;
}

/**
 *  去空格
 *
 *  @return NSString
 */
- (NSString *)trim{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 *  所占空间大小
 *
 *  @param size 限定大小
 *  @param font 字体
 *  @return 大小信息
 */
- (CGSize)size:(CGSize)size font:(UIFont *)font{
    NSMutableAttributedString* atrString = [[NSMutableAttributedString alloc] initWithString:self];
    [atrString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [atrString length])];
    return [atrString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

/**
 *  将字符串形式的十六进制颜色转换为UIColor
 *
 *  @param stringToConvert NSString #FFFFFF
 *
 *  @return UIColor
 */
+ (UIColor *) hexStringToColor: (NSString *) stringToConvert {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1];
}

/**
 *  将字符串形式的十六进制颜色转换为UIColor
 *
 *  NSString #FFFFFF
 *
 *  @return UIColor
 */
- (UIColor *)toColor {
    NSString *cString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1];
}

+ (NSString *)stringForDate:(NSDate *)date FormatString:(NSString *)formatString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSString *)stringForDateTime:(long)dateTime FormatString:(NSString *)formatString{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:dateTime];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *dateString = [dateFormatter stringFromDate:confromTimesp];
    return dateString;
}

/**
 *  随机生成bitNum位字符串
 *
 *  @return NSString
 */
+ (NSString *)retStringWithBitNum:(NSUInteger)bitNum {
    if(bitNum == 0)return nil;
    char data[bitNum];
    for (int x=0;x<bitNum;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:bitNum encoding:NSUTF8StringEncoding];
}

@end
