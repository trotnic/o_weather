//
//  CurrentDayForecast.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/26/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrentDayForecast : NSObject

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSDate *sunrise;
@property (nonatomic, strong, readonly) NSDate *sunset;
@property (nonatomic, strong, readonly) NSNumber *temp;
@property (nonatomic, strong, readonly) NSNumber *feelsLikeTemp;
@property (nonatomic, strong, readonly) NSNumber *pressure;
@property (nonatomic, strong, readonly) NSNumber *humidity;
@property (nonatomic, strong, readonly) NSNumber *clouds;
@property (nonatomic, strong, readonly) NSNumber *windSpeed;
@property (nonatomic, copy, readonly) NSString *weatherMain;
@property (nonatomic, copy, readonly) NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
