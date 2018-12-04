//
//  CalendarHeadler.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/4.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DateModel;

@interface CalendarHeadler : NSObject

// 年 / 月 / 日
@property (nonatomic, strong) NSMutableArray <NSMutableArray<DateModel *>*>* calendarSource;

- (instancetype)initWithCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier;

- (void)reSetCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier;

- (NSArray<DateModel *>*)getDateModelsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

- (void)setOneYearCalendarDate;


@end

NS_ASSUME_NONNULL_END
