//
//  LunarCalendarHandler.m
//  CalendarHandler
//
//  Created by YanYi on 2018/12/24.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import "LunarCalendarHandler.h"

unsigned int LunarCalendarTable[199] = {
    0x04AE53,0x0A5748,0x5526BD,0x0D2650,0x0D9544,0x46AAB9,0x056A4D,0x09AD42,0x24AEB6,0x04AE4A,/*1901-1910*/
    0x6A4DBE,0x0A4D52,0x0D2546,0x5D52BA,0x0B544E,0x0D6A43,0x296D37,0x095B4B,0x749BC1,0x049754,/*1911-1920*/
    0x0A4B48,0x5B25BC,0x06A550,0x06D445,0x4ADAB8,0x02B64D,0x095742,0x2497B7,0x04974A,0x664B3E,/*1921-1930*/
    0x0D4A51,0x0EA546,0x56D4BA,0x05AD4E,0x02B644,0x393738,0x092E4B,0x7C96BF,0x0C9553,0x0D4A48,/*1931-1940*/
    0x6DA53B,0x0B554F,0x056A45,0x4AADB9,0x025D4D,0x092D42,0x2C95B6,0x0A954A,0x7B4ABD,0x06CA51,/*1941-1950*/
    0x0B5546,0x555ABB,0x04DA4E,0x0A5B43,0x352BB8,0x052B4C,0x8A953F,0x0E9552,0x06AA48,0x6AD53C,/*1951-1960*/
    0x0AB54F,0x04B645,0x4A5739,0x0A574D,0x052642,0x3E9335,0x0D9549,0x75AABE,0x056A51,0x096D46,/*1961-1970*/
    0x54AEBB,0x04AD4F,0x0A4D43,0x4D26B7,0x0D254B,0x8D52BF,0x0B5452,0x0B6A47,0x696D3C,0x095B50,/*1971-1980*/
    0x049B45,0x4A4BB9,0x0A4B4D,0xAB25C2,0x06A554,0x06D449,0x6ADA3D,0x0AB651,0x093746,0x5497BB,/*1981-1990*/
    0x04974F,0x064B44,0x36A537,0x0EA54A,0x86B2BF,0x05AC53,0x0AB647,0x5936BC,0x092E50,0x0C9645,/*1991-2000*/
    0x4D4AB8,0x0D4A4C,0x0DA541,0x25AAB6,0x056A49,0x7AADBD,0x025D52,0x092D47,0x5C95BA,0x0A954E,/*2001-2010*/
    0x0B4A43,0x4B5537,0x0AD54A,0x955ABF,0x04BA53,0x0A5B48,0x652BBC,0x052B50,0x0A9345,0x474AB9,/*2011-2020*/
    0x06AA4C,0x0AD541,0x24DAB6,0x04B64A,0x69573D,0x0A4E51,0x0D2646,0x5E933A,0x0D534D,0x05AA43,/*2021-2030*/
    0x36B537,0x096D4B,0xB4AEBF,0x04AD53,0x0A4D48,0x6D25BC,0x0D254F,0x0D5244,0x5DAA38,0x0B5A4C,/*2031-2040*/
    0x056D41,0x24ADB6,0x049B4A,0x7A4BBE,0x0A4B51,0x0AA546,0x5B52BA,0x06D24E,0x0ADA42,0x355B37,/*2041-2050*/
    0x09374B,0x8497C1,0x049753,0x064B48,0x66A53C,0x0EA54F,0x06B244,0x4AB638,0x0AAE4C,0x092E42,/*2051-2060*/
    0x3C9735,0x0C9649,0x7D4ABD,0x0D4A51,0x0DA545,0x55AABA,0x056A4E,0x0A6D43,0x452EB7,0x052D4B,/*2061-2070*/
    0x8A95BF,0x0A9553,0x0B4A47,0x6B553B,0x0AD54F,0x055A45,0x4A5D38,0x0A5B4C,0x052B42,0x3A93B6,/*2071-2080*/
    0x069349,0x7729BD,0x06AA51,0x0AD546,0x54DABA,0x04B64E,0x0A5743,0x452738,0x0D264A,0x8E933E,/*2081-2090*/
    0x0D5252,0x0DAA47,0x66B53B,0x056D4F,0x04AE45,0x4A4EB9,0x0A4D4C,0x0D1541,0x2D92B5          /*2091-2099*/
    
};

// 阳历平年月份天数
int solarNonleapYearMonth[13]   = {0,31,28,31,30,31,30,31,31,30,31,30,31};


@interface LunarCalendarHandler () {
    NSInteger _solarYear;
    NSInteger _solarMonth;
    NSInteger _solarDay;
    BOOL      _leapYear;
    
    NSInteger _yearData;
    NSInteger _leapMonth;
    NSInteger _totalMonth;
    NSInteger _lunarMonth;
    
    NSInteger _solarDayFlag;
}



@end


@implementation LunarCalendarHandler

- (NSArray<LunarDateModel *> *)getLunarCalendarDataAtYear:(NSInteger)year {
    if (year <= 1900) {
        NSLog(@"抱歉，暂不提供1990年及之前的农历数据！");
        return nil;
    } else if (year >= 2100) {
        NSLog(@"抱歉，暂不提供2100年及之后的农历数据！");
        return nil;
    } else {
        return [self getLunarCalendarDataAtYearData:year];
    }
}


/**
 获取当年农历数据
 
 @param year 年份 yyyy
 @return 农历数据
 */
- (NSArray <LunarDateModel *>*)getLunarCalendarDataAtYearData:(NSInteger)year {
    _yearData = LunarCalendarTable[year - 1901];
    NSMutableArray <LunarDateModel *>* lunarCalendarData = [NSMutableArray new];
    _leapMonth = [self getLunarCalendarLeapMonthWithYearData:_yearData];
    _totalMonth = _leapMonth == 0 ? 12 : 13;
    _lunarMonth = 1;
    _solarYear  = year;
    _solarMonth = [self getLunarCalendarTheChineseNewYearMonthWithYearData:_yearData];
    _solarDay   = [self getLunarCalendarTheChineseNewYearDayWithYearData:_yearData];
    _leapYear   = [self solarYearIsLeapYear:year];
    
    for (NSInteger index = 1; index <= _totalMonth; index ++) {
        NSInteger lunarMonthDays = [self getLunarCalendarNomalMonthDaysWithYearData:_yearData month:index];
        if (index == _leapMonth) {
            for (NSInteger lunarDay = 1; lunarDay <= lunarMonthDays ; lunarDay ++ ) {
                LunarDateModel * lunarDate = [LunarDateModel new];
                lunarDate.solarDate = [self getSolarDate];
                lunarDate.lunarDate = [self getLunarDay:lunarDay month:_lunarMonth year:year isLeapMonth:NO];
                [lunarCalendarData addObject:lunarDate];
            }
        } else if ((index == _leapMonth + 1) && (_leapMonth > 0)) {
            for (NSInteger lunarDay = 1; lunarDay <= lunarMonthDays ; lunarDay ++ ) {
                LunarDateModel * lunarDate = [LunarDateModel new];
                lunarDate.solarDate = [self getSolarDate];
                lunarDate.lunarDate = [self getLunarDay:lunarDay month:_lunarMonth year:year isLeapMonth:YES];
                [lunarCalendarData addObject:lunarDate];
            }
            _lunarMonth ++;
        } else {
            for (NSInteger lunarDay = 1; lunarDay <= lunarMonthDays ; lunarDay ++ ) {
                LunarDateModel * lunarDate = [LunarDateModel new];
                lunarDate.solarDate = [self getSolarDate];
                lunarDate.lunarDate = [self getLunarDay:lunarDay month:_lunarMonth year:year isLeapMonth:NO];
                [lunarCalendarData addObject:lunarDate];
            }
            _lunarMonth ++;
        }
    }
    return lunarCalendarData;
}

- (Solar *)getSolarDate {
    Solar *solar = [Solar new];
    solar.day   = _solarDay;
    solar.year  = _solarYear;
    solar.month = _solarMonth;
    if (_solarMonth == 2 && _leapYear) { // 二月份特殊处理
        if (_solarDay == 29) { // 判断是否跨月份
            _solarDay = 1;
            _solarMonth ++;
        } else {
            _solarDay ++;
        }
    } else {
        if (_solarDay == solarNonleapYearMonth[_solarMonth]) {    // 判断是否跨月份
            _solarDay = 1;
            if (_solarMonth == 12) { // 判断是否跨年
                _solarMonth = 1;
                _solarYear ++;
            } else {
                _solarMonth ++;
            }
        } else {
            _solarDay ++;
        }
    }
    _solarDayFlag ++;
    return solar;
}


/**
 判断该公历年是否为闰年

 @param solarYear 公历年份
 @return 是否闰年
 */
- (BOOL)solarYearIsLeapYear:(NSInteger)solarYear {
    if (solarYear % 4) {            // 不能被4整除，是平年
        return NO;
    } else if (solarYear % 100) {   // 不能被100 整除，是润年
        return YES;
    } else if (solarYear % 400) {   // 不能被400 整除，是平年
        return NO;
    } else {                        // 能被400 整除，是闰年
        return YES;
    }
}

/**
 生成农历数据模型

 @param day 农历日
 @param month 农历月份
 @param year 农历年份
 @param isLeapMonth 是否闰月
 @return 农历数据模型
 */
- (Lunar *)getLunarDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year isLeapMonth:(BOOL)isLeapMonth {
    Lunar *dayModel = [Lunar new];
    dayModel.day    = day;
    dayModel.month  = month;
    dayModel.year   = year;
    dayModel.isLeap = isLeapMonth;
    return dayModel;
}

// 获取春节所在公历月份的日期
- (NSInteger)getLunarCalendarTheChineseNewYearDayWithYearData:(NSInteger)yearData {
    return yearData & 0x1F;
}

// 获取春节所在公历年份的月份
- (NSInteger)getLunarCalendarTheChineseNewYearMonthWithYearData:(NSInteger)yearData {
    return ((yearData & 0x30)>>4) + 1;
}

// 获取农历闰月月份 // 如无 则返回0
- (NSInteger)getLunarCalendarLeapMonthWithYearData:(NSInteger)yearData {
    return (yearData & 0xF00000) >> 20;
}

// 获取农历闰月天数
- (NSInteger)getLunarCalendarLeapMonthDaysWithYearData:(NSInteger)yearData {
    NSInteger leapMonth = [self getLunarCalendarLeapMonthWithYearData:yearData];
    if (yearData >> (20 - leapMonth)) {
        return 30;
    } else {
        return 29;
    }
}
// 获取农历当月天数
- (NSInteger)getLunarCalendarNomalMonthDaysWithYearData:(NSInteger)yearData month:(NSInteger)month {
    if ((yearData >> (20 - month)) & 0x1) {
        return 30;
    } else {
        return 29;
    }
}


@end
