//
//  LunarCalendarHandler.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/24.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LunarDateModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LunarCalendarHandler : NSObject


/**
 生成农历一整年的数据 该API获取数据将以农历日历排布方式给出，即 不使用星期 的方式排列

 该API 仅提供 1901 - 2099 年农历数据

 @param year 农历年份 yyyy
 @return 农历一整年数据
 */
- (NSArray<LunarDateModel *>*)getLunarCalendarDataAtYear:(NSInteger)year;

@end

NS_ASSUME_NONNULL_END
