//
//  OApi.h
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherForecast.h"
#import "URLRequestConvertible.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OApiDelegate;


@interface OApi : NSObject

@property(nonatomic, weak) id <OApiDelegate> delegate;

- (instancetype)initWithSession:(NSURLSession *)session;
- (void)fetchDataOnRequest:(id<URLRequestConvertible>)request;

@end


@protocol OApiDelegate <NSObject>
- (void)net:(OApi *)api didReceiveForecast:(WeatherForecast *)forecast;
- (void)net:(OApi *)api didEndWithError:(NSError *)error;
@end


NS_ASSUME_NONNULL_END
