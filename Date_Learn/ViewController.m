//
//  ViewController.m
//  Date_Learn
//
//  Created by 綦 on 16/6/20.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import "ViewController.h"
#import "DHmPickerView.h"

@interface ViewController ()<DHmPickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self dateLearn];
//    [self dateFormatterLearn];
//    [self timeZoneLearn];
//    [self localeLearn];
    [self calendarLearn];
//    [self settingUi];
//    [self testDate];
}

#pragma mark - 自定义方法
- (void)settingUi
{
    DHmPickerView *view = [DHmPickerView dhmPickerView];
    view.date = [NSDate date];
    view.delegate = self;
    [self.view addSubview:view];
}
- (void)dateLearn
{
    //当前时间
    NSDate *nowDate = [NSDate date];
    //从当前时间推后X秒
    NSDate *dateFromNow = [NSDate dateWithTimeIntervalSinceNow:60];
    //从某个时间推后X秒
    NSDate *dateFromAnotherDate = [NSDate dateWithTimeInterval:60 sinceDate:dateFromNow];
    
    //日期格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    //设置地区
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    NSLog(@"\nnowDate:%@\ndateFromNow:%@\ndateFromAnotherDate:%@\n\n",[formatter stringFromDate:nowDate],[formatter stringFromDate:dateFromNow],[formatter stringFromDate:dateFromAnotherDate]);
    
    //计算两个时间相差的秒数，第一个时间减第二个时间
    NSTimeInterval timeInterval = [nowDate timeIntervalSinceDate:dateFromNow];
    NSTimeInterval timeInterval1 = [nowDate timeIntervalSinceNow];
    NSLog(@"\ntimeInterval:%f\ntimeInterval1:%f\n\n",timeInterval,timeInterval1);
    
    //一个遥远的过去时间
    NSDate *distantPast = [NSDate distantPast];
    //一个遥远的未来时间
    NSDate *distantFuture = [NSDate distantFuture];
    NSLog(@"\ndistantPast:%@\ndistantFuture:%@\n\n",[formatter stringFromDate:distantPast],[formatter stringFromDate:distantFuture]);
}
- (void)dateFormatterLearn
{
    {
//        a: AM/PM (上午/下午)
//            
//        A: 0~86399999 (一天的第A微秒)
//            
//        c/cc: 1~7 (一周的第一天, 周天为1)
//            
//        ccc: Sun/Mon/Tue/Wed/Thu/Fri/Sat (星期几简写)
//            
//        cccc: Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday (星期几全拼)
//            
//        d: 1~31 (月份的第几天, 带0)
//            
//        D: 1~366 (年份的第几天,带0)
//            
//        e: 1~7 (一周的第几天, 带0)
//            
//        E~EEE: Sun/Mon/Tue/Wed/Thu/Fri/Sat (星期几简写)
//            
//        EEEE: Sunday/Monday/Tuesday/Wednesday/Thursday/Friday/Saturday (星期几全拼)
//            
//        F: 1~5 (每月的第几周, 一周的第一天为周一)
//            
//        g: Julian Day Number (number of days since 4713 BC January 1) 未知
//            
//        G~GGG: BC/AD (Era Designator Abbreviated) 未知
//            
//        GGGG: Before Christ/Anno Domini 未知
//            
//        h: 1~12 (0 padded Hour (12hr)) 带0的时, 12小时制
//            
//        H: 0~23 (0 padded Hour (24hr))  带0的时, 24小时制
//            
//        k: 1~24 (0 padded Hour (24hr) 带0的时, 24小时制
//                 
//        K: 0~11 (0 padded Hour (12hr)) 带0的时, 12小时制
//                 
//        L/LL: 1~12 (0 padded Month)  第几月
//                 
//        LLL: Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec 月份简写
//                 
//        LLLL: January/February/March/April/May/June/July/August/September/October/November/December 月份全称
//                 
//        m: 0~59 (0 padded Minute) 分钟
//                 
//        M/MM: 1~12 (0 padded Month) 第几月
//                 
//        MMM: Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec
//                 
//        MMMM: January/February/March/April/May/June/July/August/September/October/November/December
//                 
//        q/qq: 1~4 (0 padded Quarter) 第几季度
//                 
//        qqq: Q1/Q2/Q3/Q4 季度简写
//                 
//        qqqq: 1st quarter/2nd quarter/3rd quarter/4th quarter 季度全拼
//                 
//        Q/QQ: 1~4 (0 padded Quarter) 同小写
//                 
//        QQQ: Q1/Q2/Q3/Q4 同小写
//                 
//        QQQQ: 1st quarter/2nd quarter/3rd quarter/4th quarter 同小写
//                 
//        s: 0~59 (0 padded Second) 秒数
//                 
//        S: (rounded Sub-Second) 未知
//                 
//        u: (0 padded Year) 未知
//                 
//        v~vvv: (General GMT Timezone Abbreviation) 常规GMT时区的编写
//                 
//        vvvv: (General GMT Timezone Name) 常规GMT时区的名称
//                 
//        w: 1~53 (0 padded Week of Year, 1st day of week = Sunday, NB: 1st week of year starts from the last Sunday of last year) 一年的第几周, 一周的开始为周日,第一周从去年的最后一个周日起算
//                 
//        W: 1~5 (0 padded Week of Month, 1st day of week = Sunday) 一个月的第几周
//                 
//        y/yyyy: (Full Year) 完整的年份
//                 
//        yy/yyy: (2 Digits Year)  2个数字的年份
//                 
//        Y/YYYY: (Full Year, starting from the Sunday of the 1st week of year) 这个年份未知干嘛用的
//                 
//        YY/YYY: (2 Digits Year, starting from the Sunday of the 1st week of year) 这个年份未知干嘛用的
//                 
//        z~zzz: (Specific GMT Timezone Abbreviation) 指定GMT时区的编写
//                 
//        zzzz: (Specific GMT Timezone Name) Z: +0000 (RFC 822 Timezone) 指定GMT时区的名称
    }
    {
//        yy: 年的后2位
//        yyyy: 完整年
//        MM: 月，显示为1-12
//        MMM: 月，显示为英文月份简写,如 Jan
//        MMMM: 月，显示为英文月份全称，如 Janualy
//        dd: 日，2位数表示，如02
//        d: 日，1-2位显示，如 2
//        EEE: 简写星期几，如Sun
//        EEEE: 全写星期几，如Sunday
//        aa: 上下午，AM/PM
//        H: 时，24小时制，0-23
//        K：时，12小时制，0-11
//        m: 分，1-2位
//        mm: 分，2位
//        s: 秒，1-2位
//        ss: 秒，2位
//        S: 毫秒
    }
    //创建日期对象
    NSDate *nowDate = [NSDate date];
    
    //日期格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置格式化字符串
    [formatter setDateFormat:@"zzzz：Gyyyy年MM月dd日 qqqq EEE ahh时mm分ss秒"];
    //设置地区
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    NSLog(@"\n%@\n\n",[formatter stringFromDate:nowDate]);
    
    //设置格式化字符串
    [formatter setDateFormat:@"公元：G,年份：u=yyyy=yy,季度：q=qqq=qqqq,月份：M=MMM=MMMM,本年的第w周,本月的第W周,本年的第D天,本月的第d天,星期：c=ccc=cccc,上下午：a,小时：h=hh=H=HH,分钟：m=mm,秒钟：s=ss,本天A毫秒,时区名称：zzzz=vvvv,时区编号：Z"];
    NSLog(@"\n%@\n\n",[formatter stringFromDate:nowDate]);
}
- (void)timeZoneLearn
{
    {
        //GMT 0:00 格林威治标准时间; UTC +00:00 校准的全球时间; CCD +08:00 中国标准时间。
        //任何时区都以GMT为基准，即，任何NSTimeZone对象所代表的时区都是相对于GMT的，这里的相对性是NSTimeZone中最重要的属性，我们称之为当前时区相对于GMT的偏移量。一旦知道了一个偏移量，便可以确定一个时区。在iOS中，偏移量是以"秒"为单位的。
        //iOS中的时区表示方法：GMT+0800 GMT-0800。(+：东区 -：西区 08：小时数 00：分钟数)。 GMT+0830就是指比GMT早8小时外加30分钟的时区。
    }
    
    //修改默认时区会影响时间的输出显示,只能够修改该程序的defaultTimeZone，不能修改系统的，更不能修改其他程序的。
    [NSTimeZone setDefaultTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0700"]];
    NSDate *nowDate = [NSDate date];
    
    //日期格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    
    NSLog(@"\n%@\n\n",[formatter stringFromDate:nowDate]);
    
    //也可直接修改NSDateFormatter的timeZone变量
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0900"];
    NSLog(@"\n%@\n\n",[formatter stringFromDate:nowDate]);
}
- (void)localeLearn
{
    {
        //需要保证用户修改当前语言环境时应用的显示不发生变化。而像NSDateFormatter这样的类，会根据设备的设置，自动返回不同语言的数据。为了保证返回数据的语言一致，我们需要设置NSLocale。 下面的代码就可以保证在任何语言环境下，只返回中文的数据
    }
    
    //设置日期格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd cccc HH:mm:ss"];
    
    //创建日期
    NSDate *nowDate = [NSDate date];
    NSLog(@"\n%@\n\n",[formatter stringFromDate:nowDate]);
    
    //设置地区
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    formatter.locale = locale;
    NSLog(@"\n%@\n\n",[formatter stringFromDate:nowDate]);
}
- (void)calendarLearn
{
    //创建一个日历对象
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//[NSCalendar currentCalendar];
    //获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitQuarter|NSCalendarUnitWeekday|NSCalendarUnitWeekOfYear|NSCalendarUnitWeekOfMonth|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:[NSDate date]];
    NSLog(@"year(年份): %i", components.year);
    NSLog(@"month(月份):%i", components.month);
    NSLog(@"day(日期):%i", components.day);
#warning 季度获取不正确，目前不知为啥?
    NSLog(@"quarter(季度):%i", components.quarter);
    NSLog(@"hour(小时):%i", components.hour);
    NSLog(@"minute(分钟):%i", components.minute);
    NSLog(@"second(秒):%i", components.second);
    
    //    Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Friday:5, Saturday:6
    NSLog(@"weekday(星期):%i", components.weekday);
    
    //    苹果官方不推荐使用week
    NSLog(@"weekOfYear(该年第几周):%i", components.weekOfYear);
    NSLog(@"weekOfMonth(该月第几周):%i", components.weekOfMonth);
    
    [components setMonth:7];
    [components setDay:21];
    NSDate *birthdayDate = [calendar dateFromComponents:components];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM月dd日"];
    NSLog(@"\nbirthday:%@\n\n",[formatter stringFromDate:birthdayDate]);
    
    NSDateComponents *spacingComponents = [[NSDateComponents alloc] init];
    [spacingComponents setDay:31];
    NSDate *afterDate = [calendar dateByAddingComponents:spacingComponents toDate:birthdayDate options:0];
    
    NSLog(@"\nafterDate:%@\n\n",[formatter stringFromDate:afterDate]);
}
- (void)testDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    NSDate *date = [formatter dateFromString:@"2016年5月31日"];
    NSLog(@"%@",[formatter stringFromDate:date]);
    NSLog(@"%@",[self lastMothWith:date]);
}
- (NSString *)lastMothWith:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    [components setDay:1];
    [components setDay:components.day - 1];
    NSDate *lastMoth = [calendar dateFromComponents:components];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [formatter setDateFormat:@"yyyy年MM月dd日"];//yyyy年MM月dd日 hh时mm分ss秒
    return [formatter stringFromDate:lastMoth];
}

#pragma mark - <DHmPickerViewDelegate>代理方法
- (void)dhmPickerViewDelegateAfterChangeValue:(DHmPickerView *)view
{
    NSLog(@"__________________________%@",view.currentStr);
}

@end
