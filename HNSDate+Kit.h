//
//  NSDate+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 16/2/17.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HNSDate_Kit)

/**
 *  判断是否是今天
 *
 *  @return BOOL
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 *
 *  @return BOOL
 */
- (BOOL)isYesterday;

/**
 *  是不是今年
 *
 *  @return BOOL
 */
- (BOOL)isThisYear;

/**
 *  时间格式化
 *
 *  @param format NSString
 *
 *  @return NSString
 */
- (NSString *)stringWithFormat:(NSString *)format;

/**
 *  获取星期字符串
 *
 *  @return NSString
 */
- (NSString *)stringWithWeek;

/**
 *  格式化构造
 *
 *  @param dateString NSString
 *  @param format     NSString
 *
 *  @return NSDate
 */
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

/**
 *  格式化构造
 *
 *  @param dateString NSString
 *  @param formats    NSArray<NSString *>
 *
 *  @return NSDate
 */
+ (NSDate *)dateWithString:(NSString *)dateString formats:(NSArray<NSString *> *)formats;

/**
 *  去除时分秒
 *
 *  @return NSDate
 */
- (NSDate *)dateWithYMD;

/**
 *  日期和当前日期的差的天数
 *
 *  @return NSDateComponents
 */
- (NSDateComponents *)deltaWithNow;

/**
 *  时间整理
 *  返回 “X分钟前”,"今天","昨天"等
 *
 *  @return NSString
 */
- (NSString *)stringFinishing;

@end
