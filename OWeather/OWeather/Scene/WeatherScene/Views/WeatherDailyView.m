//
//  WeatherDailyView.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/27/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "WeatherDailyView.h"

@interface WeatherDailyView ()
@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation WeatherDailyView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [[UINib nibWithNibName:@"WeatherDailyView" bundle:nil] instantiateWithOwner:self options:nil];
        _view.translatesAutoresizingMaskIntoConstraints = NO;
        _view.frame = self.bounds;
        [self addSubview:_view];
        [_view.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        [_view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [_view.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
        [_view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        
    }
    return self;
}



@end
