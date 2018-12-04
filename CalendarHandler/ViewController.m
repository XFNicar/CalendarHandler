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
    // Do any additional setup after loading the view, typically from a nib.
    
    CalendarHandler *handler = [[CalendarHandler alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [handler setOneYearCalendarDate];
    for (NSInteger month = 1; month <= handler.calendarSource.count; month ++) {
        NSArray <DateModel*>*daysArr = handler.calendarSource[month -1];
        DateModel *firstDay = daysArr.firstObject;
        for (NSInteger i = 0; i < firstDay.weakDay; i ++) printf("\t ");
        for (NSInteger day = 1; day <= daysArr.count; day ++) {
            DateModel *dateModel = daysArr[day - 1];
            printf("\t %ld",dateModel.day);
            if (dateModel.weakDay == 6) {
                printf("\n");
            }
        }
        printf("\n\n");
    }
}


@end
