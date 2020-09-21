//
//  ViewController.m
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "ViewController.h"
#import "WeatherCell.h"
#import "UIImage+WeatherIcon.h"
#import "LocationPickController.h"
#import "LocationPickPresenter.h"


@interface ViewController ()

@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *dayLabel;
@property (nonatomic, strong) UIImageView *weatherIcon;
@property (nonatomic, strong) UIStackView *dailyStack;

@property (nonatomic, strong) UIStackView *currentDayStack;
@property (nonatomic, strong) UIStackView *innerHCurrentDayStack;
@property (nonatomic, strong) UIStackView *innerVCurrentDayStack;

@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@property (nonatomic, strong) UIButton *locationButton;

@property (nonatomic, strong) ForecastPresenter *presenter;

@end

@implementation ViewController

- (instancetype)initWithPresenter:(ForecastPresenter *)presenter
{
    self = [super init];
    if (self) {
        _presenter = presenter;
        presenter.delegate = self;
        
        _cityLabel = [UILabel new];
        _temperatureLabel = [UILabel new];
        _dayLabel = [UILabel new];
        _weatherIcon = [UIImageView new];
        _dailyStack = [UIStackView new];
        _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        
        _currentDayStack = [UIStackView new];
        _innerHCurrentDayStack = [UIStackView new];
        _innerVCurrentDayStack = [UIStackView new];
        
        _locationButton = [UIButton new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self.view addSubview:self.dailyStack];    
    [self.view addSubview:self.currentDayStack];
    [self.view addSubview:self.spinner];
    
    [self setupConstraints];
    [self setupViews];
    self.view.backgroundColor = [UIColor colorWithRed:48.0/255.0f green:54.0/255.0f blue:68.0/255.0f alpha:1.0f];
    
    [self.spinner startAnimating];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        self.currentDayStack.axis = UILayoutConstraintAxisVertical;
        self.innerVCurrentDayStack.axis = UILayoutConstraintAxisVertical;
    } else {
        self.currentDayStack.axis = UILayoutConstraintAxisHorizontal;
        self.innerVCurrentDayStack.axis = UILayoutConstraintAxisHorizontal;
    }
}

- (void)setupConstraints
{
    UILayoutGuide *safeGuide = self.view.safeAreaLayoutGuide;
    
    self.currentDayStack.distribution = UIStackViewDistributionEqualSpacing;
    self.currentDayStack.alignment = UIStackViewAlignmentCenter;
    self.currentDayStack.axis = UILayoutConstraintAxisVertical;
    self.currentDayStack.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.currentDayStack.leadingAnchor constraintEqualToAnchor:safeGuide.leadingAnchor constant:30].active = YES;
    [self.currentDayStack.topAnchor constraintEqualToAnchor:safeGuide.topAnchor constant:30].active = YES;
    [self.currentDayStack.trailingAnchor constraintEqualToAnchor:safeGuide.trailingAnchor constant:-30].active = YES;
    [self.currentDayStack.bottomAnchor constraintEqualToAnchor:safeGuide.centerYAnchor].active = YES;
    
    self.innerHCurrentDayStack.distribution = UIStackViewDistributionFillProportionally;
    self.innerHCurrentDayStack.axis = UILayoutConstraintAxisHorizontal;
    self.innerHCurrentDayStack.alignment = UIStackViewAlignmentCenter;
    
    [self.innerHCurrentDayStack addArrangedSubview:self.cityLabel];
    [self.innerHCurrentDayStack addArrangedSubview:self.locationButton];
    
    [self.locationButton.heightAnchor constraintEqualToConstant:30].active = YES;
    [self.locationButton.widthAnchor constraintEqualToConstant:30].active = YES;
    
    [self.currentDayStack addArrangedSubview:self.innerHCurrentDayStack];
    
    
    self.innerVCurrentDayStack.distribution = UIStackViewDistributionEqualSpacing;
    self.innerVCurrentDayStack.alignment = UIStackViewAlignmentCenter;
    self.innerVCurrentDayStack.axis = UILayoutConstraintAxisVertical;
    self.innerVCurrentDayStack.spacing = 20.0f;
    
    [self.innerVCurrentDayStack addArrangedSubview:self.dayLabel];
    [self.innerVCurrentDayStack addArrangedSubview:self.weatherIcon];
    [self.innerVCurrentDayStack addArrangedSubview:self.temperatureLabel];
    
    [self.currentDayStack addArrangedSubview:self.innerVCurrentDayStack];
    
    
    [self.weatherIcon.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.weatherIcon.heightAnchor constraintEqualToConstant:50].active = YES;
    
    [self.dailyStack.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-100].active = true;
    [self.dailyStack.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20].active = true;
    [self.dailyStack.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20].active = true;
    
    [self.spinner.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [self.spinner.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
}

- (void)setupViews
{
    
    UIColor *mainColor = [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f];
    
    self.cityLabel.font = [UIFont systemFontOfSize:40 weight:UIFontWeightRegular];
    self.cityLabel.textColor = mainColor;
    self.cityLabel.textAlignment = NSTextAlignmentCenter;
    
    self.temperatureLabel.font = [UIFont systemFontOfSize:70 weight:UIFontWeightBold];
    self.temperatureLabel.textColor = mainColor;
    
    self.dayLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    self.dayLabel.textColor = mainColor;
    
    self.weatherIcon.contentMode = UIViewContentModeScaleAspectFit;
    self.weatherIcon.tintColor = mainColor;
    
    self.dailyStack.translatesAutoresizingMaskIntoConstraints = false;
    self.dailyStack.axis = UILayoutConstraintAxisHorizontal;
    self.dailyStack.distribution = UIStackViewDistributionFillEqually;
    
    self.spinner.translatesAutoresizingMaskIntoConstraints = false;
    self.spinner.color = UIColor.whiteColor;
    
    [self.locationButton setImage:[UIImage systemImageNamed:@"location"] forState:UIControlStateNormal];
    self.locationButton.tintColor = mainColor;
    self.locationButton.hidden = YES;
    
    [self.locationButton addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleClick:(UIButton *)sender {
    // TODO: Implement location picker
    NSLog(@"In development...");
}

- (void)setupAttributesIn:(NSMutableAttributedString *)string
{
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    UIFont *font = [UIFont systemFontOfSize:40 weight:UIFontWeightSemibold];
    
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:@30 forKey:NSBaselineOffsetAttributeName];
    
    [string setAttributes:@{
        NSForegroundColorAttributeName: [UIColor colorWithRed:230.0/255.0f green:235.0/255.0f blue:241.0/255.0f alpha:1.0f]
    } range:NSMakeRange(0, string.length)];
    [string setAttributes:attributes range:NSMakeRange(string.length - 1, 1)];
}

// MARK: Presenter delegate

- (void)updateWithData:(ForecastData *)data
{
    [data currentDay:^(NSString *city, NSString *icon, NSString *date, NSString *temperature) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:temperature];
        [self setupAttributesIn:string];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cityLabel.text = city;
            self.temperatureLabel.attributedText = string;
            self.dayLabel.text = date;
            self.weatherIcon.image = [UIImage weatherIcon:icon];
            [self.spinner stopAnimating];
            
            self.locationButton.hidden = NO;
            for (UIView *view in self.dailyStack.arrangedSubviews) {
                [view removeFromSuperview];
            }
        });
    }];
    
    [data enumerateOverDailyUsing:^(NSString *icon, NSString *date, NSString *temperature) {
        dispatch_async(dispatch_get_main_queue(), ^{
            WeatherCell *cell = [WeatherCell new];
            cell.dayLabel.text = date;
            cell.iconView.image = [UIImage weatherIcon:icon];
            cell.tempLabel.text = temperature;
            [self.dailyStack addArrangedSubview:cell];
        });
    }];
}

- (void)showError:(NSError *)error
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.description preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.spinner stopAnimating];
        [self presentViewController:alert animated:true completion:nil];
    });
}

@end
