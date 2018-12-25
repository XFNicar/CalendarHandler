//
//  LunarDateModel.m
//  CalendarHandler
//
//  Created by YanYi on 2018/12/24.
//  Copyright © 2018 YanYi. All rights reserved.
//

#import "LunarDateModel.h"


const char *ShengXiao[] = {"鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪"};

const char *ChMonth[] = {"*","正月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","腊月"};

const char *ChDay[] =  {"*","初一","初二","初三","初四","初五",
                            "初六","初七","初八","初九","初十",
                            "十一","十二","十三","十四","十五",
                            "十六","十七","十八","十九","二十",
                            "廿一","廿二","廿三","廿四","廿五",
                            "廿六","廿七","廿八","廿九","三十"};

const char *TianGan[]   = {"甲","乙","丙","丁","戊","己","庚","辛","壬","癸"};

const char *DiZhi[]     = {"子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"};

const char *Number_CN[] = {"零","一","二","三","四","五","六","七","八","九"};

@implementation LunarDateModel


- (NSString *)lunarDay {
    if (self.lunarDate.day == 1) {
        return self.lunarMonth;
    } else {
        return [NSString stringWithUTF8String:ChDay[self.lunarDate.day]];
    }
}

- (NSString *)lunarMonth {
    if (self.lunarDate.isLeap) {
        return [NSString stringWithFormat:@"润%@",[NSString stringWithUTF8String: ChMonth[self.lunarDate.month]]];
    } else {
        return [NSString  stringWithUTF8String:ChMonth[self.lunarDate.month]];
    }
}

- (NSString *)lunarYear {
    return [NSString stringWithFormat:@"%@%@%@%@",
            [NSString stringWithUTF8String: Number_CN[(self.lunarDate.year / 1000) % 10]],
            [NSString stringWithUTF8String: Number_CN[(self.lunarDate.year / 100) % 10]],
            [NSString stringWithUTF8String: Number_CN[(self.lunarDate.year / 10) % 10]],
            [NSString stringWithUTF8String: Number_CN[(self.lunarDate.year / 1) % 10]]];
}

// 1901年是牛年
- (NSString *)ShengXiao {
    return [NSString stringWithFormat:@"%@",[NSString stringWithUTF8String:ShengXiao[((self.lunarDate.year - 1900)) % 12]]];
}

- (NSString *)solarDay {
    return [NSString stringWithFormat:@"%02ld",self.solarDate.day];
}

- (NSString *)solarMonth {
    return [NSString stringWithFormat:@"%02ld",self.solarDate.month];
}

- (NSString *)solarYear {
    return [NSString stringWithFormat:@"%04ld",self.solarDate.year];
}

- (NSString *)solarDateStr {
    return [NSString stringWithFormat:@"%@-%@-%@",self.solarYear,self.solarMonth,self.solarDay];
}

- (Lunar *)lunarDate {
    if (_lunarDate == nil) {
        _lunarDate = [Lunar new];
    }
    return _lunarDate;
}

- (Solar *)solarDate {
    if (_solarDate == nil) {
        _solarDate = [Solar new];
    }
    return _solarDate;
}

@end
