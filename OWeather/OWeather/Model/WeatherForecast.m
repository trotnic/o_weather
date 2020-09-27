//
//  WeatherForecast.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "WeatherForecast.h"

@interface WeatherForecast ()

@property (nonatomic, copy, readwrite) NSString *timezone;
@property (nonatomic, strong, readwrite) CurrentDayForecast *current;
@property (nonatomic, strong, readwrite) NSArray<DayForecast *> *daily;

@end

@implementation WeatherForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _timezone = dictionary[@"timezone"];
        NSMutableArray<DayForecast *> *tmpDaily = [NSMutableArray new];
        _current = [[CurrentDayForecast alloc] initWithDictionary:dictionary[@"current"]];
        for (NSDictionary *day in dictionary[@"daily"]) {
            [tmpDaily addObject:[[DayForecast alloc] initWithDictionary:day]];
        }
        _daily = [tmpDaily copy];
    }
    return self;
}

@end
