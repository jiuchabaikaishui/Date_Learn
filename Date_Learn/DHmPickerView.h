//
//  DHmPickerView.h
//  Date_Learn
//
//  Created by 綦 on 16/6/20.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, DHmPickerViewType){
//    DHmPickerViewTypeDefault = 0,//以起始数据显示
//    DHmPickerViewTypeEnd = 1//以结束数据显示
//};

@class DHmPickerView;
@protocol DHmPickerViewDelegate <NSObject>

- (void)dhmPickerViewDelegateAfterChangeValue:(DHmPickerView *)view;

@end

@interface DHmPickerView : UIView

@property (strong, nonatomic) NSDate *date;
//@property (assign, nonatomic) DHmPickerViewType type;
@property (copy, nonatomic, readonly) NSString *currentStr;
@property (weak, nonatomic) id<DHmPickerViewDelegate> delegate;

+ (instancetype)dhmPickerView;
//- (instancetype)initWithDHmPickerViewType:(DHmPickerViewType)type;

@end
