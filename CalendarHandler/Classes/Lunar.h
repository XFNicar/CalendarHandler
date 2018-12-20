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

@property (nonatomic, assign) NSInteger     day;
@property (nonatomic, assign) NSInteger     year;
@property (nonatomic, assign) NSInteger     month;

@property (nonatomic, copy  ) NSString      *The24SolarTerms;   // 24节气
@property (nonatomic, copy  ) NSString      *Ganzhi;            // 干支
@property (nonatomic, copy  ) NSString      *Festival;          // 节日
@property (nonatomic, copy  ) NSString      *TheChineseZodiac;  // 生肖


@end


NS_ASSUME_NONNULL_END
