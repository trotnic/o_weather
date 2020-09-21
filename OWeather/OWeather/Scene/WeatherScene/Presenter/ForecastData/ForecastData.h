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
- (void)currentDay:(void(^)(NSString *city, NSString *icon, NSString *date, NSString *temperature))completion;
- (void)enumerateOverDailyUsing:(void(^)(NSString *icon, NSString *date, NSString *temperature))completion;

@end

NS_ASSUME_NONNULL_END
