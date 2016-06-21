//
//  DHmPickerView.m
//  Date_Learn
//
//  Created by 綦 on 16/6/20.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import "DHmPickerView.h"

//屏幕宽
#define Screen_Width                [UIScreen mainScreen].bounds.size.width
//屏幕高
#define Screen_Height               [UIScreen mainScreen].bounds.size.height
@interface DHmPickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) NSMutableArray *dataMarr;
@property (strong, nonatomic) NSMutableArray *currentStrMarr;

@end

@implementation DHmPickerView

#pragma mark - 属性方法
- (NSMutableArray *)dataMarr
{
    if (_dataMarr == nil) {
        _dataMarr = [NSMutableArray arrayWithCapacity:1];
    }
    
    return _dataMarr;
}
- (NSMutableArray *)currentStrMarr
{
    if (_currentStrMarr == nil) {
        _currentStrMarr = [NSMutableArray arrayWithCapacity:1];
    }
    
    return _currentStrMarr;
}
- (NSString *)currentStr
{
    NSMutableString *mStr = [NSMutableString stringWithString:@""];
    for (NSString *str in self.currentStrMarr) {
        [mStr appendFormat:@"%@",str];
    }
    
    return mStr;
}
- (void)setDate:(NSDate *)date
{
    if (date) {
        _date = date;
        NSMutableArray *dayMarr = [NSMutableArray arrayWithCapacity:1];
        NSMutableArray *hourMarr = [NSMutableArray arrayWithCapacity:1];
        NSMutableArray *minuteMarr = [NSMutableArray arrayWithCapacity:1];
        for (int index = 0; index < [self numberOfDaysInMonth:date]; index++) {
            [dayMarr addObject:[NSString stringWithFormat:@"%02i日",index + 1]];
        }
        for (int index = 0; index < 24; index++) {
            [hourMarr addObject:[NSString stringWithFormat:@"%02i时",index]];
        }
        for (int index = 0; index < 60; index++) {
            [minuteMarr addObject:[NSString stringWithFormat:@"%02i分",index]];
        }
        [self.dataMarr addObject:dayMarr];
        [self.dataMarr addObject:hourMarr];
        [self.dataMarr addObject:minuteMarr];
        [self.pickerView reloadAllComponents];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        NSDateComponents *components = [calendar components:NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date];
        NSInteger day = components.day;
        NSInteger hour = components.hour;
        NSInteger minute = components.minute;
        [self.pickerView selectRow:day inComponent:0 animated:NO];
        [self.pickerView selectRow:hour inComponent:1 animated:NO];
        [self.pickerView selectRow:minute inComponent:2 animated:NO];
        [self.currentStrMarr removeAllObjects];
        [self.currentStrMarr addObject:self.dataMarr[0][day]];
        [self.currentStrMarr addObject:self.dataMarr[1][hour]];
        [self.currentStrMarr addObject:self.dataMarr[2][minute]];
    }
}

/**
 *  获取时间的当月天数
 */
- (NSInteger)numberOfDaysInMonth:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}


+ (instancetype)dhmPickerView
{
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIPickerView *pickerView = [[UIPickerView alloc] init];
        [self addSubview:pickerView];
        self.pickerView = pickerView;
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        self.frame = CGRectMake(0, 0, Screen_Width, pickerView.bounds.size.height);
    }
    
    return self;
}

#pragma mark - <UIPickerViewDelegate, UIPickerViewDataSource>代理方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *arr = self.dataMarr[component];
    return arr.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.dataMarr[component][row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.currentStrMarr.count > component) {
        self.currentStrMarr[component] = [self.dataMarr[component] objectAtIndex:row];
    }
    if ([self.delegate respondsToSelector:@selector(dhmPickerViewDelegateAfterChangeValue:)]) {
        [self.delegate dhmPickerViewDelegateAfterChangeValue:self];
    }
}

@end
