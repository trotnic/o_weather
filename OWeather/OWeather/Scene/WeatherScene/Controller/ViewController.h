//
//  ViewController.h
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastPresenter.h"

@interface ViewController : UIViewController <ForecastPresenterDelegate>

- (instancetype)initWithPresenter:(ForecastPresenter *)presenter;

@end

