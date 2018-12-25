//
//  LunarDateModel.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/24.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Lunar.h"
#import "Solar.h"

NS_ASSUME_NONNULL_BEGIN

@interface LunarDateModel : NSObject

@property (nonatomic, readonly  ) NSString      *lunarDay;      // 农历日
@property (nonatomic, readonly  ) NSString      *lunarMonth;    // 农历月
@property (nonatomic, readonly  ) NSString      *lunarYear;     // 农历年

@property (nonatomic, readonly  ) NSString      *Ganzhi_Day;    // 干支-日
@property (nonatomic, readonly  ) NSString      *Ganzhi_Month;  // 干支-月
@property (nonatomic, readonly  ) NSString      *Ganzhi_Year;   // 干支-年

@property (nonatomic, readonly  ) NSString      *ShengXiao;     // 生肖
@property (nonatomic, readonly  ) NSString      *The24JieQi;    // 24节气

@property (nonatomic, readonly  ) NSString      *solarDay;      // 公历日
@property (nonatomic, readonly  ) NSString      *solarMonth;    // 公历月
@property (nonatomic, readonly  ) NSString      *solarYear;     // 公历年
@property (nonatomic, readonly  ) NSString      *solarWeek;     // 公历星期
@property (nonatomic, readonly  ) NSString      *solarDateStr;  // 公历日期 yyyy-MM-dd



@property (nonatomic, strong) Lunar     *lunarDate;
@property (nonatomic, strong) Solar     *solarDate;

@end

NS_ASSUME_NONNULL_END
