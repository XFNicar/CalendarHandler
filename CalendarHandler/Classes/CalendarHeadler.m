//
//  CalendarHeadler.m
//  CalendarHandler
//
//  Created by YanYi on 2018/12/4.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import "CalendarHeadler.h"
#import "NSCalendar+Extension.h"
#import "DateModel.h"

@interface CalendarHeadler ()

@property (nonatomic , strong) NSCalendar           *calendar;


@end

@implementation CalendarHeadler


- (instancetype)initWithCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier {
    if (self = [super init]) {
        self.calendar = [[NSCalendar alloc]initWithCalendarIdentifier:calendarIdentifier];
    }
    return self;
}

- (void)reSetCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier {
    _calendar = [[NSCalendar alloc]initWithCalendarIdentifier:calendarIdentifier];
}

- (NSArray<DateModel *>*)getDateModelsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate {
    return  nil;
}

- (void)setOneYearCalendarDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    for (NSInteger month = 1; month <= 12; month++) {
        NSString *string = [NSString stringWithFormat:@"2018-%02d-01",month];
        NSDate *date = [dateFormatter dateFromString:string];
        [self loadOneYearCalendarDataWithDate:date];
    }
}
- (void)loadOneYearCalendarDataWithDate:(NSDate *)date {
    NSInteger year  = [self.calendar convertDateToYear:date];
    NSInteger month = [self.calendar convertDateToMonth:date];
    NSInteger firstWeekDay  = [self.calendar convertDateToFirstWeekDay:date];
    NSInteger totalDays     = [self.calendar convertDateToMonthTotalDays:date];
    NSMutableArray <DateModel *>*monthArr = [NSMutableArray new];
    NSInteger column = 7;
    
    NSInteger day = 1;    //超过总天数后为下月
    NSInteger nextMonthDay = 1; //下月天数开始计数
//    NSDate *lastMonthDate = [self.calendar getDateFrom:date offsetMonths:-1];    //上月月数
//    NSInteger lastMonthTotalDays = [self.calendar convertDateToMonthTotalDays:lastMonthDate]; //上月天数计数
    BOOL endDay = NO;
    for (int line = 0; endDay == NO ; line++) {
        for (int weekDay = 0; weekDay < column; weekDay++) {
            
            if (day > totalDays) { // 当月最后一个星期 section 中所包含的下个月的天
                nextMonthDay++;
                continue;
            } else if (day == totalDays) {
                endDay = YES;
            }
            
            if (line == 0 && weekDay < firstWeekDay) { // 当月第一星期 section 中所包含的上个月的天
//                NSInteger lastMonthDay = lastMonthTotalDays - firstWeekDay + weekDay + 1;
            } else {
                DateModel *dateModel = [DateModel dateWithDay:day month:month year:year weekDay:weekDay section:line];
                [monthArr addObject:dateModel];
                day++;
            }
        }
    }
    [self.calendarSource addObject:monthArr];

}

- (NSCalendar *)calendar {
    if (_calendar == nil) {
        _calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return _calendar;
}

- (NSMutableArray<NSMutableArray<DateModel *> *> *)calendarSource {
    if (_calendarSource == nil) {
        _calendarSource = [NSMutableArray new];
    }
    return _calendarSource;
}


@end
