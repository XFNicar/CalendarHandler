//
//  DateModel.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/4.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Solar.h"
#import "Lunar.h"

NS_ASSUME_NONNULL_BEGIN

@interface DateModel : NSObject

@property (nonatomic, assign) NSInteger    day;
@property (nonatomic, assign) NSInteger    year;
@property (nonatomic, assign) NSInteger    month;
@property (nonatomic, assign) NSInteger    weakDay;

@property (nonatomic, copy  ) NSString     *dateString;
@property (nonatomic, assign) NSInteger    section;    // 在日历中当月的第几行



+ (DateModel *)dateWithDay:(NSInteger)day
                     month:(NSInteger)month
                      year:(NSInteger)year
                   weekDay:(NSInteger)weekDay
                   section:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
