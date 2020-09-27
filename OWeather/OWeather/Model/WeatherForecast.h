//
//  WeatherForecast.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DayForecast.h"
#import "CurrentDayForecast.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherForecast : NSObject

@property (nonatomic, copy, readonly) NSString *timezone;
@property (nonatomic, strong, readonly) CurrentDayForecast *current;
@property (nonatomic, strong, readonly) NSArray<DayForecast *> *daily;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
