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
@property (nonatomic, strong) NSDateFormatter *dayFormatter;
@property (nonatomic, strong) NSDateFormatter *timeFormatter;

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

- (NSString *)currentLocation {
    return  self.weather.timezone;
}

- (NSString *)currentIcon {
    return self.weather.current.icon;
}

- (NSString *)currentDay {
    return [self.dayFormatter stringFromDate:self.weather.current.date];
}

- (NSString *)currentTemperature {
    return [NSString stringWithFormat:@"%u°", self.weather.current.temp.intValue];
}

- (NSString *)currentSunrise {
    return [self.timeFormatter stringFromDate:self.weather.current.sunrise];
}

- (NSString *)currentSunset {
    return [self.timeFormatter stringFromDate:self.weather.current.sunset];
}

- (NSString *)currentHumidity {
    return [NSString stringWithFormat:@"%u %%", self.weather.current.humidity.intValue];
}

- (NSString *)currentWindSpeed {
    return [NSString stringWithFormat:@"%u m/s", self.weather.current.windSpeed.intValue];
}

- (void)enumerateOverDailyUsing:(void(^)(NSString *icon, NSString *day, NSString *dayTemperature, NSString *nightTemperature))completion {
    
    [self.weather.daily enumerateObjectsUsingBlock:^(DayForecast *obj, NSUInteger idx, BOOL *stop) {
        NSString *resultDayTemp = [NSString stringWithFormat:@"%u°", obj.tempDay.intValue];
        NSString *resultNightTemp = [NSString stringWithFormat:@"%u°", obj.tempNight.intValue];
        NSString *resultDay = [self.dayFormatter stringFromDate:obj.date];
        completion(obj.icon, resultDay, resultDayTemp, resultNightTemp);
    }];
}

- (NSDateFormatter *)timeFormatter {
    if(!_timeFormatter) {
        _timeFormatter = [NSDateFormatter new];
        _timeFormatter.dateFormat = @"HH:MM";
    }
    return _timeFormatter;
}

- (NSDateFormatter *)dayFormatter {
    if(!_dayFormatter) {
        _dayFormatter = [NSDateFormatter new];
        _dayFormatter.dateFormat = @"EE";
    }
    return _dayFormatter;
}

@end
