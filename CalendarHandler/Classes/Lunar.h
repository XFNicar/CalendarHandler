//
//  Lunar.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/17.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Lunar : NSObject

// 农历年月日
@property (nonatomic, assign) NSInteger     day;
@property (nonatomic, assign) NSInteger     year;
@property (nonatomic, assign) NSInteger     month;
@property (nonatomic, assign) BOOL          isLeap;
@property (nonatomic, copy  ) NSString     *dayStr;
@property (nonatomic, copy  ) NSString     *yearStr;
@property (nonatomic, copy  ) NSString     *monthStr;

// 干支 信息
@property (nonatomic, assign) NSInteger     GanZhi_day;
@property (nonatomic, assign) NSInteger     GanZhi_month;
@property (nonatomic, assign) NSInteger     GanZhi_year;

@property (nonatomic, copy  ) NSString     *GanZhi_dayStr;
@property (nonatomic, copy  ) NSString     *GanZhi_monthStr;
@property (nonatomic, copy  ) NSString     *GanZhi_yearStr;

// 24节气
@property (nonatomic, copy  ) NSString      *The24SolarTerms;
// 生肖
@property (nonatomic, copy  ) NSString      *ShengXiao;

// 是否为农历当月第一天
@property (nonatomic, assign) BOOL          lunarMonthFirstDay;
// 是否为公历当月第一天
@property (nonatomic, assign) BOOL          solarMonthFirstDay;

// 节日
@property (nonatomic, copy  ) NSString      *Festival;


@end


NS_ASSUME_NONNULL_END
