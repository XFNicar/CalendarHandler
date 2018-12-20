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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self printDateForStartDate:@"2016-11-01" endDate:@"2018-03-01"];
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
            printf("\t %ld",dateModel.day);
        }
        
        printf("\n\n");
    }
    
}

@end
