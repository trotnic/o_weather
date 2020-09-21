//
//  UIImage+WeatherIcon.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "UIImage+WeatherIcon.h"

@implementation UIImage (WeatherIcon)

+ (UIImage *)weatherIcon:(NSString *)descriptor {
    if ([descriptor isEqual:@"01d"] || [descriptor isEqual:@"01n"]) {
        return [UIImage systemImageNamed: @"sun.max"];
    } else if ([descriptor isEqual:@"02d"] || [descriptor isEqual:@"02n"]) {
        return [UIImage systemImageNamed:@"cloud.sun"];
    } else if ([descriptor isEqual:@"03d"] || [descriptor isEqual:@"04d"] || [descriptor isEqual:@"03n"] || [descriptor isEqual:@"04n"]) {
        return [UIImage systemImageNamed:@"cloud"];
    } else if ([descriptor isEqual:@"09d"] || [descriptor isEqual:@"09n"]) {
        return [UIImage systemImageNamed:@"cloud.rain"];
    } else if ([descriptor isEqual:@"10d"] || [descriptor isEqual:@"10n"]) {
        return [UIImage systemImageNamed:@"cloud.sun.rain"];
    } else if ([descriptor isEqual:@"11d"] || [descriptor isEqual:@"11n"]) {
        return [UIImage systemImageNamed:@"cloud.bolt"];
    } else if ([descriptor isEqual:@"13d"] || [descriptor isEqual:@"13n"]) {
        return [UIImage systemImageNamed:@"cloud.snow"];
    } else if ([descriptor isEqual:@"50d"] || [descriptor isEqual:@"50n"]) {
        return [UIImage systemImageNamed:@"cloud.fog"];
    } else {
        return [UIImage systemImageNamed:@"exclamationmark.icloud"];
    }
}

@end
