//
//  ViewController.m
//  CalendarHandler
//
//  Created by YanYi on 2018/12/4.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import "ViewController.h"
#import "CalendarHandler.h"
#import "DateModel.h"
#import "LunarCalendarHandler.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self printDateForStartDate:@"2016-11-01" endDate:@"2018-03-01"];
//    LunarCalendarHandler *lunarCalendarHandler = [LunarCalendarHandler new];
//    NSArray <LunarDateModel *>* lunarCalendar = [lunarCalendarHandler getLunarCalendarDataAtYear:1903];
//    [self printLunarCalendar:lunarCalendar];
    [self printDateForStartDate:@"2018-01-01" endDate:@"2020-01-01"];
//    [self printSolarCalendar:lunarCalendar];
}

- (void)printSolarCalendar:(NSArray<LunarDateModel *>*)lunarCalendar {
    for (LunarDateModel *date in lunarCalendar) {
        if (date.solarDate.day == 1) {
            if (date.solarDate.month == 1) {
                printf("\n%s年\n",[date.solarYear UTF8String]);
            }
            printf("\n");
            printf("\n%s\n",[date.solarMonth UTF8String]);
        }
        printf("\t%s",[date.solarDay UTF8String]);
        
    }
}

- (void)printLunarCalendar:(NSArray<LunarDateModel *>*)lunarCalendar {
    for (LunarDateModel *date in lunarCalendar) {
        if (date.lunarDate.day == 1) {
            if (date.lunarDate.month == 1) {
                printf("\n%s %s 年\n",[date.lunarYear UTF8String],[date.ShengXiao UTF8String]);
            }
            printf("\n");
            printf("\n%s\n",[date.lunarMonth UTF8String]);
        }
        printf("\t%s %s",[date.lunarDay UTF8String],[date.solarDay UTF8String]);
        
    }
}

- (void)printDateForStartDate:(NSString *)startDateString endDate:(NSString *)endDateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [dateFormatter dateFromString:startDateString];
    NSDate *endDate = [dateFormatter dateFromString:endDateString];
    CalendarHandler *handler = [[CalendarHandler alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSArray <NSArray<DateModel *>*>* daysArr = [handler loadCalendarDataAtWithStartDate:startDate endDate:endDate];
    [self printDateWithArr:daysArr];
}


- (void)printDateWithArr:(NSArray<NSArray<DateModel *>*>*)monthArr {
    
    for (NSArray <DateModel*>*daysArr in monthArr) {
        DateModel *firstDate = daysArr.firstObject;
        printf("%4ld-%02ld\n",firstDate.year,firstDate.month);
//        DateModel *firstDay = daysArr.firstObject;
//        for (NSInteger i = 0; i < firstDay.weakDay; i ++) printf("\t ");
//        for (NSInteger day = 1; day <= daysArr.count; day ++) {
//            DateModel *dateModel = daysArr[day - 1];
//            printf("\t %ld",dateModel.day);
//            if (dateModel.weakDay == 6) {
//                printf("\n");
//            }
//        }
        
        for (DateModel *dateModel in daysArr) {
            printf("\t %ld-%ld",dateModel.day,dateModel.weakDay);
            if (dateModel.weakDay == 6) {
                printf("\n");
            }
        }
        
        printf("\n\n");
    }
    
}

@end
