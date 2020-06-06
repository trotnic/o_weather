//
//  WeatherCell.m
//  OWeather
//
//  Created by Vladislav on 5/31/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "WeatherCell.h"

@interface WeatherCell ()

@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSNumber *dt;
@property (nonatomic, strong) NSNumber *temp;

@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UILabel *tempLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation WeatherCell


- (instancetype)initWithIcon:(NSString *)icon day:(NSNumber *)dt temp:(NSNumber *)temp
{
    self = [super init];
    if (self) {
        _dayLabel = [UILabel new];
        _tempLabel = [UILabel new];
        _iconView = [UIImageView new];
        _icon = icon;
        _dt = dt;
        _temp = temp;
        [self setup];
    }
    return self;
}

- (void)setup {
    self.tempLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.dayLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.iconView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self addSubview:self.dayLabel];
    [self addSubview:self.tempLabel];
    [self addSubview:self.iconView];
    
    self.dayLabel.textAlignment = NSTextAlignmentCenter;
    self.tempLabel.textAlignment = NSTextAlignmentCenter;
    
    self.dayLabel.textColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    self.tempLabel.textColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    self.iconView.tintColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    
    self.iconView.image = [WeatherCell weatherIcon:self.icon];
    
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.dt.intValue];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"EE";
    NSString *formattedDate = [formatter stringFromDate:date];
    
    self.dayLabel.text = formattedDate;
    self.tempLabel.text = [NSString stringWithFormat:@"%d", self.temp.intValue - 273];
    
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self constraint];
}

- (void)constraint {
    [self.dayLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor].active = true;
    [self.dayLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor].active = true;
    [self.dayLabel.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor].active = true;
    [self.dayLabel.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.3].active = true;
    
    [self.iconView.topAnchor constraintEqualToAnchor:self.dayLabel.bottomAnchor].active = true;
    [self.iconView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
    [self.iconView.bottomAnchor constraintEqualToAnchor:self.tempLabel.topAnchor].active = true;
    [self.iconView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.7].active = true;
    
    [self.tempLabel.leadingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.leadingAnchor].active = true;
    [self.tempLabel.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor].active = true;
    [self.tempLabel.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor].active = true;
    [self.tempLabel.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:0.3].active = true;
}

+ (UIImage *)weatherIcon:(NSString *)descriptor {
    if ([descriptor isEqual:@"01d"] || [descriptor isEqual:@"01n"]) {
        return [UIImage systemImageNamed: @"sun.max"];
    } else if ([descriptor isEqual:@"02d"] || [descriptor isEqual:@"02n"]) {
        return [UIImage systemImageNamed:@"cloud.sun"];
    } else if ([descriptor isEqual:@"03d"] || [descriptor isEqual:@"04d"] || [descriptor isEqual:@"03n"] || [descriptor isEqual:@"04n"]) {
        return [UIImage systemImageNamed:@"cloud"];
    } else if ([descriptor isEqual:@"09d"] || [descriptor isEqual:@"09n"]) {
        return [UIImage systemImageNamed:@"cloud.rain"];
    } else if ([descriptor isEqual:@"10d"] || [descriptor isEqual:@"10n"]) {
        return [UIImage systemImageNamed:@"cloud.sun.rain"];
    } else if ([descriptor isEqual:@"11d"] || [descriptor isEqual:@"11n"]) {
        return [UIImage systemImageNamed:@"cloud.bolt"];
    } else if ([descriptor isEqual:@"13d"] || [descriptor isEqual:@"13n"]) {
        return [UIImage systemImageNamed:@"cloud.snow"];
    } else if ([descriptor isEqual:@"50d"] || [descriptor isEqual:@"50n"]) {
        return [UIImage systemImageNamed:@"cloud.fog"];
    } else {
        return [UIImage systemImageNamed:@"exclamationmark.icloud"];
    }
}

@end
