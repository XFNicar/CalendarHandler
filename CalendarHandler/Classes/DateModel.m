//
//  DateModel.m
//  CalendarHandler
//
//  Created by YanYi on 2018/12/4.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import "DateModel.h"

@implementation DateModel

+ (DateModel *)dateWithDay:(NSInteger)day
                     month:(NSInteger)month
                      year:(NSInteger)year
                   weekDay:(NSInteger)weekDay
                   section:(NSInteger)section {
    DateModel *model = [DateModel new];
    model.day = day;
    model.month = month;
    model.year = year;
    model.dateString = [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day];
    model.weakDay = weekDay;
    model.section = section;
    return model;
}

@end
