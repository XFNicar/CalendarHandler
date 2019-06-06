//
//  CalendarHandler.m
//  CalendarHandler
//
//  Created by YanYi on 2018/12/4.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import "CalendarHandler.h"

#import "NSCalendar+Extension.h"
#import "DateModel.h"

@interface CalendarHandler ()

@property (nonatomic ,strong) NSCalendar            *calendar;
@property (nonatomic, copy  ) NSString              *calendarIdentifier;
@property (nonatomic, strong) NSCalendar            *lunarCalendar;

@end

@implementation CalendarHandler


- (instancetype)initWithCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier {
    if (self = [super init]) {
        if ([calendarIdentifier isEqualToString:NSCalendarIdentifierGregorian]) { // 公历
            self.calendar = [[NSCalendar alloc]initWithCalendarIdentifier:calendarIdentifier];
        }
//        if ([calendarIdentifier isEqualToString:NSCalendarIdentifierChinese]) { // 农历
//            self.calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
//        }
    }
    return self;
}

- (void)reSetCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier {
    _calendar = [[NSCalendar alloc]initWithCalendarIdentifier:calendarIdentifier];
}

- (NSArray<DateModel *>*)getDateModelsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    return  nil;
}


// 根据起止日期 加载日历数据
- (NSArray < NSArray<DateModel *>*>*)loadCalendarDataAtWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    NSInteger startYear  = [self.calendar convertDateToYear:startDate];
    NSInteger startDay   = [self.calendar convertDateToDay:startDate];
    NSInteger startMonth = [self.calendar convertDateToMonth:startDate];
    NSInteger endYear    = [self.calendar convertDateToYear:endDate];
    NSInteger endMonth   = [self.calendar convertDateToMonth:endDate];
    NSInteger endDay     = [self.calendar convertDateToDay:endDate];
    NSMutableArray <NSArray <DateModel *>*>* monthArr = [NSMutableArray new];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = self.calendar;
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    if (startYear == endYear) { // 起始年和最后一年是同一年
        for (NSInteger month = startMonth; month <= endMonth; month ++) {
            NSString *dateString = nil;
            NSString *endDateString = nil;
            if (startMonth == endMonth) { // 两个日期在同一月份
                dateString = [NSString stringWithFormat:@"%4ld-%02ld-%02ld",startYear,month,startDay];
                endDateString = [NSString stringWithFormat:@"%4ld-%02ld-%02ld",startYear,month,endDay];
                NSDate *startDate = [dateFormatter dateFromString:dateString];
                NSDate *endDate = [dateFormatter dateFromString:endDateString];
                NSArray <DateModel *>*dateArr = [self loadDateModeInTheSameMonthWithStartDate:startDate endDate:endDate];
                [monthArr addObject:dateArr];
            } else { // 两个日期不在同一个月份
                if (month == startMonth) { // 起始月份
                    dateString = [NSString stringWithFormat:@"%4ld-%02ld-%02ld",startYear,month,startDay];
                    NSDate *startDate = [dateFormatter dateFromString:dateString];
                    NSArray <DateModel *>*dateArr = [self loadDefaultMonthWithStartDate:startDate];
                    [monthArr addObject:dateArr];
                } else if (month > startMonth && month <endMonth) { // 中间月份
                    dateString = [NSString stringWithFormat:@"%4ld-%02ld-01",startYear,month];
                    NSDate *startDate = [dateFormatter dateFromString:dateString];
                    NSArray <DateModel *>*dateArr = [self loadDefaultMonthWithStartDate:startDate];
                    [monthArr addObject:dateArr];
                } else if (month == endMonth) { // 最后月份
                    dateString = [NSString stringWithFormat:@"%4ld-%02ld-01",startYear,month];
                    endDateString = [NSString stringWithFormat:@"%4ld-%02ld-%02ld",startYear,month,endDay];
                    NSDate *startDate = [dateFormatter dateFromString:dateString];
                    NSDate *endDate = [dateFormatter dateFromString:endDateString];
                    NSArray <DateModel *>*dateArr = [self loadDateModeInTheSameMonthWithStartDate:startDate endDate:endDate];
                    [monthArr addObject:dateArr];
                }
            }
        }
    } else { // 起始年和最后一年不是同一年
        for (NSInteger year = startYear; year <= endYear; year ++) {
            if (year == startYear) { // 和起始年同一年份
                for (NSInteger month = startMonth; month <= 12; month ++) {
                    NSString *dateString = nil;
                    if (month == startMonth) { // 起始月
                        dateString = [NSString stringWithFormat:@"%04ld-%02ld-%02ld",year,month,startDay];
                    } else { // 其他月份
                        dateString = [NSString stringWithFormat:@"%4ld-%02ld-01",year,month];
                    }
                    NSDate *date = [dateFormatter dateFromString:dateString];
                    NSArray <DateModel *>*dateArr = [self loadDefaultMonthWithStartDate:date];
                    [monthArr addObject:dateArr];
                }
            } else if (year < endYear && year != startYear) { // 中间年份
                for (NSInteger month = 1; month <= 12; month ++) {
                    NSString * dateString = [NSString stringWithFormat:@"%4ld-%02ld-01",year,month];
                    NSDate *date = [dateFormatter dateFromString:dateString];
                    NSArray <DateModel *>*dateArr = [self loadDefaultMonthWithStartDate:date];
                    [monthArr addObject:dateArr];
                }
            } else if (year == endYear) { // 和最后一年同一年份
                for (NSInteger month = 1; month <= endMonth; month ++) {
                    NSString *dateString = nil;
                    if (month == endMonth) { // 两个日期在同一月份
                        dateString = [NSString stringWithFormat:@"%4ld-%02ld-01",year,month];
                        NSString * endDateString = [NSString stringWithFormat:@"%4ld-%02ld-%02ld",year,month,endDay];
                        NSDate *startDate = [dateFormatter dateFromString:dateString];
                        NSDate *endDate = [dateFormatter dateFromString:endDateString];
                        NSArray <DateModel *>*dateArr = [self loadDateModeInTheSameMonthWithStartDate:startDate endDate:endDate];
                        [monthArr addObject:dateArr];
                    } else { // 两个日期不在同一个月份
                        dateString = [NSString stringWithFormat:@"%4ld-%02ld-01",year,month];
                        NSDate *date = [dateFormatter dateFromString:dateString];
                        NSArray <DateModel *>*dateArr = [self loadDefaultMonthWithStartDate:date];
                        [monthArr addObject:dateArr];
                    }
                }
            }
        }
    }
    return monthArr;
}

// 根据在同一个月的两个日期加载日期数据
- (NSArray<DateModel *>*)loadDateModeInTheSameMonthWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    NSInteger year  = [self.calendar convertDateToYear:startDate];
    NSInteger day   = [self.calendar convertDateToDay:startDate];
    NSInteger month = [self.calendar convertDateToMonth:startDate];
    NSInteger firstWeekDay  = [self.calendar convertDateToWeekDay:startDate];
    NSInteger endDay     = [self.calendar convertDateToDay:endDate];
    NSMutableArray <DateModel *>*dateArr = [NSMutableArray new];
    for (NSInteger weekDay = firstWeekDay; day <= endDay; day ++ ,weekDay ++) {
        NSInteger section = weekDay % 7 > 0 ? weekDay / 7 + 1: weekDay / 7;
        DateModel *dateModel = [DateModel dateWithDay:day month:month year:year weekDay:weekDay % 7 section:section];
        [dateArr addObject:dateModel];
    }
    return dateArr;
}

// 从给定起始日期加载该月剩余日期数据
- (NSArray<DateModel *>*)loadDefaultMonthWithStartDate:(NSDate *)date {
    NSInteger year  = [self.calendar convertDateToYear:date];
    NSInteger day   = [self.calendar convertDateToDay:date];
    NSInteger month = [self.calendar convertDateToMonth:date];
    NSInteger firstWeekDay  = [self.calendar convertDateToWeekDay:date];
    NSInteger totalDays     = [self.calendar convertDateToMonthTotalDays:date];
    NSMutableArray <DateModel *>*dateArr = [NSMutableArray new];
    
    for (NSInteger weekDay = firstWeekDay; day <= totalDays; day ++ ,weekDay ++) {
        NSInteger section = weekDay % 7 > 0 ? weekDay / 7 + 1: weekDay / 7;
        DateModel *dateModel = [DateModel dateWithDay:day month:month year:year weekDay:weekDay % 7 section:section];
        [dateArr addObject:dateModel];
    }
    return  dateArr;
}


- (NSCalendar *)calendar {
    if (_calendar == nil) {
        _calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return _calendar;
}

- (NSCalendar *)lunarCalendar {
    if (_lunarCalendar == nil) {
        _lunarCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    }
    return _lunarCalendar;
}

- (NSMutableArray<NSMutableArray<DateModel *> *> *)calendarSource {
    if (_calendarSource == nil) {
        _calendarSource = [NSMutableArray new];
    }
    return _calendarSource;
}


@end
