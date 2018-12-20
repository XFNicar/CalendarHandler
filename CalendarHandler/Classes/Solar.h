//
//  Solar.h
//  CalendarHandler
//
//  Created by YanYi on 2018/12/17.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Solar : NSObject

@property (nonatomic, assign) NSInteger     day;
@property (nonatomic, assign) NSInteger     year;
@property (nonatomic, assign) NSInteger     month;

@property (nonatomic, copy  ) NSString      *Constellation; // 星座
@property (nonatomic, copy  ) NSString      *Festival;      // 节日

@end

NS_ASSUME_NONNULL_END
