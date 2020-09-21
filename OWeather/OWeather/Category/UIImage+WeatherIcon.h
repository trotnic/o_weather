//
//  UIImage+WeatherIcon.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WeatherIcon)

+ (UIImage *)weatherIcon:(NSString *)descriptor;

@end

NS_ASSUME_NONNULL_END
