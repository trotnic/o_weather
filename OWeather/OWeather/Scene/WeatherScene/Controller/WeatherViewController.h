//
//  WeatherViewController.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/26/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherViewController : UIViewController

- (void)bindPresenter:(ForecastPresenter *)presenter;

@end

NS_ASSUME_NONNULL_END
