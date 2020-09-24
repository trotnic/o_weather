//
//  LocationPickController.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationPickPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationPickController : UIViewController

- (instancetype)initWithPresenter:(LocationPickPresenter *)presenter;

@end

NS_ASSUME_NONNULL_END
