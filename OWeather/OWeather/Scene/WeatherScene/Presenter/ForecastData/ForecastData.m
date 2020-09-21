//
//  ForecastData.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "ForecastData.h"

@interface ForecastData ()

@property (nonatomic, strong) WeatherForecast *weather;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation ForecastData

- (instancetype)initWithWeather:(WeatherForecast *)weather
{
    self = [super init];
    if (self) {
        _weather = weather;
    }
    return self;
}

- (void)currentDay:(void(^)(NSString *city, NSString *icon, NSString *date, NSString *temperature))completion {
    DayForecast *currentDay = self.weather.current;
    NSString *dayTemperature = [NSString stringWithFormat:@"%uo", currentDay.tempDay.intValue - 273];
    if(completion) {
        completion(self.weather.timezone, currentDay.icon, [self.formatter stringFromDate:currentDay.date], dayTemperature);
    }
}

- (void)enumerateOverDailyUsing:(void(^)(NSString *icon, NSString *date, NSString *temperature))completion {
    
    [self.weather.daily enumerateObjectsUsingBlock:^(DayForecast *obj, NSUInteger idx, BOOL *stop) {
        NSString *resultTemperature = [NSString stringWithFormat:@"%d", obj.tempDay.intValue - 273];
        NSString *resultDate = [self.formatter stringFromDate:obj.date];
        completion(obj.icon, resultDate, resultTemperature);
    }];
}

- (NSDateFormatter *)formatter {
    if(!_formatter) {
        _formatter = [NSDateFormatter new];
        _formatter.dateFormat = @"EE";
    }
    return _formatter;
}

@end
