//
//  LunarCalendarHandar.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/18.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DateModel;
@interface LunarCalendarHandar : NSObject

- (NSArray<DateModel *>*)getLunarCalendarDataAtYear:(NSInteger)year;

@end

NS_ASSUME_NONNULL_END
