//
//  DateModel.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/4.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateModel : NSObject

@property (nonatomic, assign) NSUInteger    day;
@property (nonatomic, assign) NSUInteger    year;
@property (nonatomic, assign) NSUInteger    month;
@property (nonatomic, assign) NSUInteger    weakDay;

@property (nonatomic, copy  ) NSString      *dateString;
@property (nonatomic, assign) NSUInteger    section;    // 在日历中当月的第几行



+ (DateModel *)dateWithDay:(NSUInteger )day
                     month:(NSUInteger)month
                      year:(NSUInteger)year
                   weekDay:(NSUInteger)weekDay
                   section:(NSUInteger)section;

@end

NS_ASSUME_NONNULL_END
