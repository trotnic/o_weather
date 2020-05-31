//
//  OApi.m
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "OApi.h"

@interface OApi ()

@end

@implementation OApi

+ (void)doThings {

//    NSURL *url = [[NSURL alloc] initWithString:@"https://api.openweathermap.org/data/2.5/weather?q=Minsk&appid=4deaf71fdaab5745a431410719d42d5f"];
    NSURL *url = [[NSURL alloc] initWithString:@"https://api.openweathermap.org/data/2.5/onecall?lat=53.89&lon=27.56&appid=4deaf71fdaab5745a431410719d42d5f&exclude=minutely,hourly"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
        
        
        NSNotification *notification = [NSNotification notificationWithName:@"weatherDidLoad" object:nil userInfo:[self dictionaredData:jsonArray]];
        
        [NSNotificationCenter.defaultCenter postNotification:notification];

    }] resume];
}

+ (NSDictionary *)dictionaredData:(NSArray *)jsonArray {    
    NSMutableDictionary *weatherData = [NSMutableDictionary new];
    
    NSMutableArray *dailyArray = [NSMutableArray new];
    
    [((NSMutableArray *) [jsonArray valueForKey:@"daily"]) enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dailyArray addObject:@{
            @"dt": [obj valueForKey:@"dt"],
            @"temp": [obj valueForKeyPath:@"temp.day"],
            @"icon": [[obj valueForKeyPath:@"weather.icon"] firstObject]
        }];
    }];
    [dailyArray removeObjectAtIndex:0];
    
    
    [weatherData setValue:[jsonArray valueForKey:@"timezone"] forKey:@"city"];
    [weatherData setValue:[[jsonArray valueForKeyPath:@"current.weather.main"] firstObject] forKey:@"cur_weather"];
    [weatherData setValue:[[jsonArray valueForKeyPath:@"current.weather.icon"] firstObject] forKey:@"icon"];
    [weatherData setValue:[jsonArray valueForKeyPath:@"current.temp"] forKey:@"cur_temp"];
    
    [weatherData setValue:dailyArray forKey:@"dailyArray"];

    
    return [weatherData copy];
    
}


@end
