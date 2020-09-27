//
//  CurrentDayForecast.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/26/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "CurrentDayForecast.h"

@interface CurrentDayForecast ()

@property (nonatomic, strong, readwrite) NSDate *date;
@property (nonatomic, strong, readwrite) NSDate *sunrise;
@property (nonatomic, strong, readwrite) NSDate *sunset;
@property (nonatomic, strong, readwrite) NSNumber *temp;
@property (nonatomic, strong, readwrite) NSNumber *feelsLikeTemp;
@property (nonatomic, strong, readwrite) NSNumber *pressure;
@property (nonatomic, strong, readwrite) NSNumber *humidity;
@property (nonatomic, strong, readwrite) NSNumber *clouds;
@property (nonatomic, strong, readwrite) NSNumber *windSpeed;
@property (nonatomic, copy, readwrite) NSString *weatherMain;
@property (nonatomic, copy, readwrite) NSString *icon;

@end

@implementation CurrentDayForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _date = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"dt"] intValue]];
        _sunrise = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"sunrise"] intValue]];
        _sunset = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"sunset"] intValue]];
        _temp = @([dictionary[@"temp"] doubleValue] - 273);
        _feelsLikeTemp = @([dictionary[@"feels_like"] doubleValue]);
        _pressure = @([dictionary[@"pressure"] doubleValue]);
        _humidity = @([dictionary[@"humidity"] doubleValue]);
        _clouds = @([dictionary[@"clouds"] doubleValue]);
        _windSpeed = @([dictionary[@"wind_speed"] doubleValue]);
        NSDictionary *weather = [dictionary[@"weather"] firstObject];
        _weatherMain = weather[@"main"];
        _icon = weather[@"icon"];
    }
    return self;
}

@end
