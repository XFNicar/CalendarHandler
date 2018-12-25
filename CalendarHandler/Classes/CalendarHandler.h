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

@interface CalendarHandler : NSObject

// 年 / 月 / 日
@property (nonatomic, strong) NSMutableArray <NSMutableArray<DateModel *>*>* calendarSource;

- (instancetype)initWithCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier;

- (void)reSetCalendarIdentifier:(NSCalendarIdentifier)calendarIdentifier;

//- (NSArray<DateModel *>*)getDateModelsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

// 根据起止日期 加载日历数据
- (NSArray < NSArray<DateModel *>*>*)loadCalendarDataAtWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

// 根据在同一个月的两个日期加载日期数据
- (NSArray<DateModel *>*)loadDateModeInTheSameMonthWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate ;

// 从给定起始日期加载该月剩余日期数据
- (NSArray<DateModel *>*)loadDefaultMonthWithStartDate:(NSDate *)date;


@end

NS_ASSUME_NONNULL_END
