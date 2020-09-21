//
//  ForecastPresenter.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastData.h"
#import "OApi.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ForecastPresenterDelegate <NSObject>

- (void)updateWithData:(ForecastData *)data;
- (void)showError:(NSError *)error;

@end

@interface ForecastPresenter : NSObject <OApiDelegate>

@property (nonatomic, weak) id<ForecastPresenterDelegate> delegate;

- (instancetype)initWithService:(OApi *)service;

@end

NS_ASSUME_NONNULL_END
