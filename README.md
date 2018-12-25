# CalendarHandler


## 项目简介

* 该工具库可以方便的生成日历数据，目前暂时提生成供阳历和农历数据的API，后期相关的接口可能会稍作调整，尽可能保证原有接口功能不发生改变。


## 使用说明

**cocoapods集成**

	pod 'CalendarHandler', '~> 0.0.5'

## API说明

* **CalendarHandler 提供公历数据**

		/**
		根据起止日期 加载公历日历数据

		@param startDate 起始日期
		@param endDate 终止日期
		@return 按月分组的公历数据
 		*/
		- (NSArray < NSArray<DateModel *>*>*)loadCalendarDataAtWithStartDate:(NSDate *)startDate  endDate:(NSDate *)endDate;


	
* **LunarCalendarHandler 提供 1901 - 2099 年农历与公历数据**

		/**
 		生成农历一整年的数据 该API获取数据将以农历日历排布方式给出，即 不使用星期 的方式排列

 		该API 仅提供 1901 - 2099 年农历数据

 		@param year 农历年份 yyyy
 		@return 农历一整年数据
 		*/
		- (NSArray<LunarDateModel *>*)getLunarCalendarDataAtYear:(NSInteger)year;

* **LunarDateModel 农历数据 Model**

	当前还有 **天干地支尚未提供、二十四节气没有提供**

		@interface LunarDateModel : NSObject

		@property (nonatomic, readonly  ) NSString      *lunarDay;      // 农历日
		@property (nonatomic, readonly  ) NSString      *lunarMonth;    // 农历月
		@property (nonatomic, readonly  ) NSString      *lunarYear;     // 农历年

		@property (nonatomic, readonly  ) NSString      *Ganzhi_Day;    // 干支-日
		@property (nonatomic, readonly  ) NSString      *Ganzhi_Month;  // 干支-月
		@property (nonatomic, readonly  ) NSString      *Ganzhi_Year;   // 干支-年

		@property (nonatomic, readonly  ) NSString      *ShengXiao;     // 生肖
		@property (nonatomic, readonly  ) NSString      *The24JieQi;    // 二十四节气

		@property (nonatomic, readonly  ) NSString      *solarDay;      // 公历日
		@property (nonatomic, readonly  ) NSString      *solarMonth;    // 公历月
		@property (nonatomic, readonly  ) NSString      *solarYear;     // 公历年
		@property (nonatomic, readonly  ) NSString      *solarWeek;     // 公历星期
		@property (nonatomic, readonly  ) NSString      *solarDateStr;  // 公历日期 yyyy-MM-dd

		@property (nonatomic, strong) Lunar     *lunarDate;
		@property (nonatomic, strong) Solar     *solarDate;

		@end
	
		
## 后续工作

* 未来将会逐步把天干地支和二十四节气加入到农历数据当中，毕竟农历最重要的二十四节气缺失是没有道理的。