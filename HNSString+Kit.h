//
//  NSString+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (HNSString_Kit)

/**
 *  空及空串判断
 *  包含 NULl null NSNull nil @"" spase tab enter 及非法对象等
 *  @return BOOL
 */
+ (BOOL)isEmpty:(NSString *)str;

/**
 *  空判断
 *  包含 NULL null NSNull nil 等
 *  @return BOOL
 */
+ (BOOL)isNUll:(id)str;

/**
 *  去空格
 *
 *  @return NSString
 */
- (NSString *)trim;

/**
 *  所占空间大小
 *
 *  @param width 宽度
 *  @param font 字体
 *  @return 大小信息
 */
- (CGSize)size:(CGSize)size font:(UIFont *)font;

/**
 *  将字符串形式的十六进制颜色转换为UIColor
 *
 *  @param stringToConvert NSString #FFFFFF
 *
 *  @return UIColor
 */
+ (UIColor *) hexStringToColor: (NSString *) stringToConvert;

/**
 *  将字符串形式的十六进制颜色转换为UIColor
 *
 *  NSString #FFFFFF
 *
 *  @return UIColor
 */
- (UIColor *)toColor;

/**
 *  时间格式化
 *
 *  @param date         NSDate
 *  @param formatString NSString
 *
 *  @return NSString
 */
+ (NSString *)stringForDate:(NSDate *)date FormatString:(NSString *)formatString;

/**
 *  时间戳格式化
 *
 *  @param dateTime     int
 *  @param formatString NSString
 *
 *  @return NSString
 */
+ (NSString *)stringForDateTime:(long)dateTime FormatString:(NSString *)formatString;

/**
 *  随机生成bitNum位字符串
 *
 *  @return NSString
 */
+ (NSString *)retStringWithBitNum:(NSUInteger)bitNum;

@end
