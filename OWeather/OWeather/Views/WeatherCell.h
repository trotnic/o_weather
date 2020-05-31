//
//  WeatherCell.h
//  OWeather
//
//  Created by Vladislav on 5/31/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherCell : UIView

- (instancetype)initWithIcon:(NSString *)icon day:(NSNumber *)dt temp:(NSNumber *)temp;
+ (UIImage *)weatherIcon:(NSString *)descriptor;
@end

NS_ASSUME_NONNULL_END
