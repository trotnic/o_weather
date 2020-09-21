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

@property (nonatomic, strong, readonly) UILabel *dayLabel;
@property (nonatomic, strong, readonly) UILabel *tempLabel;
@property (nonatomic, strong, readonly) UIImageView *iconView;


@end

NS_ASSUME_NONNULL_END
