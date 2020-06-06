//
//  ViewController.m
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "ViewController.h"
#import "OApi.h"
#import "WeatherCell.h"




@interface ViewController () <OApiDelegate>

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSMutableAttributedString *temp;

@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UIImageView *weatherIcon;
@property (nonatomic, strong) UIStackView *dailyStack;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@property (nonatomic, strong) OApi *net;

@end

@implementation ViewController


- (void)loadView {
    self.view = [UIView new];
    self.cityLabel = [UILabel new];
    self.temperatureLabel = [UILabel new];
    self.dayLabel = [UILabel new];
    self.weatherIcon = [UIImageView new];
    self.dailyStack = [UIStackView new];
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    
    [self.view addSubview:self.temperatureLabel];
    [self.view addSubview:self.cityLabel];
    [self.view addSubview:self.dayLabel];
    [self.view addSubview:self.weatherIcon];
    [self.view addSubview:self.dailyStack];
    [self.view addSubview:self.spinner];
    
    self.net = [OApi new];
    
    self.net.delegate = self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.net doThings];
    [self constraints];
    [self setupViews];
    self.view.backgroundColor = [UIColor colorWithRed:48.0/255.0f green:54.0/255.0f blue:68.0/255.0f alpha:1.0f];
    [self.spinner startAnimating];
}


- (void)constraints {
    [self.cityLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    [self.cityLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:50].active = true;
    [self.cityLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [self.cityLabel.heightAnchor constraintEqualToConstant:70].active = true;
    
    [self.temperatureLabel.topAnchor constraintEqualToAnchor:self.dayLabel.bottomAnchor constant:150].active = true;
    [self.temperatureLabel.heightAnchor constraintEqualToConstant:70].active = true;
    [self.temperatureLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = true;
    [self.temperatureLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = true;
    
    [self.dayLabel.topAnchor constraintEqualToAnchor:self.cityLabel.bottomAnchor constant:5].active = true;
    [self.dayLabel.leadingAnchor constraintEqualToAnchor:self.cityLabel.leadingAnchor].active = true;
    [self.dayLabel.trailingAnchor constraintEqualToAnchor:self.cityLabel.trailingAnchor].active = true;
    [self.dayLabel.heightAnchor constraintEqualToConstant:30.0f].active = true;
    
    [self.weatherIcon.topAnchor constraintEqualToAnchor:self.dayLabel.bottomAnchor constant:30].active = true;
    [self.weatherIcon.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [self.weatherIcon.heightAnchor constraintEqualToConstant:50].active = true;
    [self.weatherIcon.widthAnchor constraintEqualToConstant:60].active = true;
    
    [self.dailyStack.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-100].active = true;
    [self.dailyStack.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20].active = true;
    [self.dailyStack.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20].active = true;
    [self.dailyStack.heightAnchor constraintEqualToConstant:150].active = true;
    
    [self.spinner.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [self.spinner.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
}


- (void)setupViews {
    self.cityLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.cityLabel.textAlignment = NSTextAlignmentCenter;
    self.cityLabel.font = [UIFont systemFontOfSize:40 weight:UIFontWeightRegular];
    self.cityLabel.textColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    
    self.temperatureLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.temperatureLabel.textAlignment = NSTextAlignmentCenter;
    self.temperatureLabel.font = [UIFont systemFontOfSize:70 weight:UIFontWeightBold];
    self.temperatureLabel.textColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    
    self.dayLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.dayLabel.textAlignment = NSTextAlignmentCenter;
    self.dayLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    self.dayLabel.textColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    
    self.weatherIcon.translatesAutoresizingMaskIntoConstraints = false;
    self.weatherIcon.contentMode = UIViewContentModeScaleAspectFit;
    self.weatherIcon.tintColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    
    self.dailyStack.translatesAutoresizingMaskIntoConstraints = false;
    self.dailyStack.axis = UILayoutConstraintAxisHorizontal;
    self.dailyStack.distribution = UIStackViewDistributionFillEqually;
    
    self.spinner.translatesAutoresizingMaskIntoConstraints = false;
    self.spinner.color = UIColor.whiteColor;
}


- (void)setupAttributes {
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    UIFont *font = [UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:@30 forKey:NSBaselineOffsetAttributeName];
    
    [self.temp setAttributes:@{
        NSForegroundColorAttributeName: [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f]
    } range:NSMakeRange(0, self.temp.length)];
    [self.temp setAttributes:attributes range:NSMakeRange(self.temp.length - 1, 1)];
}


- (void)net:(OApi *)api didReceiveData:(NSDictionary *)data {
    
    self.city = [data valueForKey:@"city"];
    
    NSString *tmp = [NSString stringWithFormat:@"%uo", [[data valueForKey:@"cur_temp"] intValue] - 273];
    self.temp = [[NSMutableAttributedString alloc] initWithString:tmp];
    [self setupAttributes];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            for (NSDictionary *day in [data valueForKey:@"dailyArray"]) {
                WeatherCell *view = [[WeatherCell alloc]
                                initWithIcon:[day valueForKey:@"icon"]
                                day:[day valueForKey:@"dt"]
                                temp:[day valueForKey:@"temp"]];
                [self.dailyStack addArrangedSubview:view];
            };
            
            self.cityLabel.text = self.city;
            self.temperatureLabel.attributedText = self.temp;
            self.weatherIcon.image = [WeatherCell weatherIcon:[data valueForKey:@"icon"]];
            self.dayLabel.text = @"Today";
    });
}


@end
