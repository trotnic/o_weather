//
//  WeatherCell.m
//  OWeather
//
//  Created by Vladislav on 5/31/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "WeatherCell.h"

@interface WeatherCell ()

@property (nonatomic, strong, readwrite) UILabel *dayLabel;
@property (nonatomic, strong, readwrite) UILabel *tempLabel;
@property (nonatomic, strong, readwrite) UIImageView *iconView;

@property (nonatomic, strong) UIStackView *stackView;

@end

@implementation WeatherCell


- (instancetype)init
{
    self = [super init];
    if (self) {
        _dayLabel = [UILabel new];
        _tempLabel = [UILabel new];
        _iconView = [UIImageView new];
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    self.dayLabel.textAlignment = NSTextAlignmentCenter;
    self.tempLabel.textAlignment = NSTextAlignmentCenter;
    
    UIColor *mainColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    
    self.dayLabel.textColor = mainColor;
    self.tempLabel.textColor = mainColor;
    self.iconView.tintColor = mainColor;
    
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.stackView];
    
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.stackView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        
    [self.stackView addArrangedSubview:self.dayLabel];
    [self.stackView addArrangedSubview:self.iconView];
    [self.stackView addArrangedSubview:self.tempLabel];
    
}

- (UIStackView *)stackView {
    if(!_stackView) {
        _stackView = [UIStackView new];
        _stackView.translatesAutoresizingMaskIntoConstraints = NO;
        _stackView.axis = UILayoutConstraintAxisVertical;
        _stackView.distribution = UIStackViewDistributionFillProportionally;
        _stackView.alignment = UIStackViewAlignmentFill;
    }
    return _stackView;
}

- (CGSize)intrinsicContentSize {
    CGSize iconSize = self.iconView.image.size;
    CGFloat height = iconSize.height * 4;
    CGFloat width = iconSize.width * 2;
    return CGSizeMake(width, height);
}


@end
