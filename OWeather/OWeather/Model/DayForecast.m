//
//  DayForecast.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "DayForecast.h"

@interface DayForecast ()

@property (nonatomic, strong, readwrite) NSDate *date;
@property (nonatomic, strong, readwrite) NSDate *sunrise;
@property (nonatomic, strong, readwrite) NSDate *sunset;
@property (nonatomic, strong, readwrite) NSNumber *tempMorn;
@property (nonatomic, strong, readwrite) NSNumber *tempDay;
@property (nonatomic, strong, readwrite) NSNumber *tempEve;
@property (nonatomic, strong, readwrite) NSNumber *tempNight;
@property (nonatomic, strong, readwrite) NSNumber *tempMin;
@property (nonatomic, strong, readwrite) NSNumber *tempMax;
@property (nonatomic, copy, readwrite) NSString *weatherMain;
@property (nonatomic, copy, readwrite) NSString *icon;

@end

@implementation DayForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _date = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"dt"] intValue]];
        _sunrise = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"sunrise"] intValue]];
        _sunset = [NSDate dateWithTimeIntervalSince1970:[dictionary[@"sunset"] intValue]];
        _tempMorn = @([[dictionary valueForKeyPath:@"temp.morn"] doubleValue]);
        _tempDay = @([[dictionary valueForKeyPath:@"temp.day"] doubleValue]);
        _tempEve = @([[dictionary valueForKeyPath:@"temp.eve"] doubleValue]);
        _tempNight = @([[dictionary valueForKeyPath:@"temp.night"] doubleValue]);
        _tempMin = @([[dictionary valueForKeyPath:@"temp.min"] doubleValue]);
        _tempMax = @([[dictionary valueForKeyPath:@"temp.max"] doubleValue]);
        NSDictionary *weather = [dictionary[@"weather"] firstObject];
        _weatherMain = weather[@"main"];
        _icon = weather[@"icon"];
    }
    return self;
}

@end
