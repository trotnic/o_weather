//
//  ForecastData.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForecastData : NSObject

- (instancetype)initWithWeather:(WeatherForecast *)weather;
- (void)enumerateOverDailyUsing:(void(^)(NSString *icon, NSString *day, NSString *dayTemperature, NSString *nightTemperature))completion;

- (NSString *)currentLocation;
- (NSString *)currentIcon;
- (NSString *)currentDay;
- (NSString *)currentTemperature;
- (NSString *)currentSunrise;
- (NSString *)currentSunset;
- (NSString *)currentHumidity;
- (NSString *)currentWindSpeed;

@end

NS_ASSUME_NONNULL_END
