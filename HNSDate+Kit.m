//
//  NSDate+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 16/2/17.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <HBasisKit/HNSDate+Kit.h>

@implementation NSDate (HNSDate_Kit)

/**
 *  格式化构造
 *
 *  @param dateString NSString
 *  @param format     NSString
 *
 *  @return NSDate
 */
+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format {
    if (!dateString || [dateString isEqualToString:@""] || !format || [format isEqualToString:@""])return nil;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

/**
 *  格式化构造
 *
 *  @param dateString NSString
 *  @param formats    NSArray<NSString *>
 *
 *  @return NSDate
 */
+ (NSDate *)dateWithString:(NSString *)dateString formats:(NSArray<NSString *> *)formats {
    if (!dateString || [dateString isEqualToString:@""] || !formats || formats.count == 0)return nil;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate *date;
    for (NSString *format in formats){
        [dateFormatter setDateFormat:format];
        date = [dateFormatter dateFromString:dateString];
        if (date) break;
    }
    return date;
}

- (BOOL)isToday {
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    // 1. 获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate :[NSDate date]];
    // 2. 获得 self 的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps. year == nowCmps. year ) &&
    (selfCmps. month == nowCmps. month ) &&
    (selfCmps. day == nowCmps. day );
}

/**
 *  是否为昨天
 *
 *  @return BOOL
 */
- (BOOL)isYesterday{
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    // 1. 获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2. 获得 self 的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return
    (selfCmps.year == nowCmps.year ) &&
    (selfCmps.month == nowCmps.month ) &&
    (selfCmps.day == nowCmps.day-1 );
}

//去除时分秒
- (NSDate *)dateWithYMD {
    NSDateFormatter *fmt = [[ NSDateFormatter alloc ] init];
    fmt.dateFormat = @"yyyy-MM-dd" ;
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString :selfStr];
}

//判断是不是今年
- (BOOL)isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    //获取当前的年月日
    NSDateComponents  *nowCmps = [calendar  components:unit fromDate:[NSDate  date]];
    //获得self的年月日
    NSDateComponents *selfCmps = [calendar components :unit fromDate : self ];
    return nowCmps. year == selfCmps. year ;
}
                                  
//计算日期差
- (NSDateComponents *)deltaWithNow {
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
    return [calendar components :unit fromDate : self toDate :[ NSDate date ] options : 0 ];
}

//获取星期字符串
- (NSString *)stringWithWeek {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSArray *weekdayAry = [NSArray arrayWithObjects:@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    [dateFormat  setShortWeekdaySymbols:weekdayAry];
    [dateFormat setDateFormat:@"eee"];
    NSString *srting = [dateFormat stringFromDate:self];
    return srting;
}

/**
 *  时间格式化
 *
 *  @param format NSString
 *
 *  @return NSString
 */
- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

/**
 *  时间整理
 *  返回 “X分钟前”,"今天 hh:mm","昨天 hh:mm"等
 *
 *  @return NSString
 */
- (NSString *)stringFinishing{
    NSString *finishing;
    
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear | kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond;
    // 1. 获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate :[NSDate date]];
    // 2. 获得 self 的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    if(selfCmps.year != nowCmps.year || selfCmps.month != nowCmps.month){
        finishing = [self stringWithFormat:@"yyyy-MM-dd"];
    }else if(nowCmps.day - selfCmps.day == 2){
        finishing = [NSString stringWithFormat:@"前天 %@",[self stringWithFormat:@"hh:mm"]];
    }else if(nowCmps.day - selfCmps.day == 1){
        finishing = [NSString stringWithFormat:@"昨天 %@",[self stringWithFormat:@"hh:mm"]];
    }else if(nowCmps.day == selfCmps.day && selfCmps.hour == nowCmps.hour && selfCmps.minute == nowCmps.minute){
        finishing = [NSString stringWithFormat:@"刚刚 %d秒前",nowCmps.second-selfCmps.second];
    }else if(nowCmps.day == selfCmps.day && selfCmps.hour == nowCmps.hour){
        finishing = [NSString stringWithFormat:@"%d分钟前",nowCmps.minute-selfCmps.minute];
    }else if(nowCmps.day == selfCmps.day){
        finishing = [NSString stringWithFormat:@"今天 %@",[self stringWithFormat:@"hh:mm"]];
    }else{
        finishing = [self stringWithFormat:@"yyyy-MM-dd hh:mm"];
    }

    return finishing;
}

@end
