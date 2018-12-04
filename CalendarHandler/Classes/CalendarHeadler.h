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

- (NSArray<DateModel *>*)getDateModelsWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;



@end

NS_ASSUME_NONNULL_END
