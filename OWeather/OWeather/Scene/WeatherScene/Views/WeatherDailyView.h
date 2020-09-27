//
//  WeatherDailyView.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/27/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherDailyView : UIView
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblDayTemperature;
@property (weak, nonatomic) IBOutlet UILabel *lblNightTemperature;

@end

NS_ASSUME_NONNULL_END
