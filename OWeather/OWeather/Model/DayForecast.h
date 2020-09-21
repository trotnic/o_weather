//
//  DayForecast.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DayForecast : NSObject

@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSDate *sunrise;
@property (nonatomic, strong, readonly) NSDate *sunset;
@property (nonatomic, strong, readonly) NSNumber *tempMorn;
@property (nonatomic, strong, readonly) NSNumber *tempDay;
@property (nonatomic, strong, readonly) NSNumber *tempEve;
@property (nonatomic, strong, readonly) NSNumber *tempNight;
@property (nonatomic, strong, readonly) NSNumber *tempMin;
@property (nonatomic, strong, readonly) NSNumber *tempMax;
@property (nonatomic, copy, readonly) NSString *weatherMain;
@property (nonatomic, copy, readonly) NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
