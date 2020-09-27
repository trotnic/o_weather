//
//  WeatherViewController.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/26/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherDailyView.h"
#import "UIImage+WeatherIcon.h"

@interface WeatherViewController () <ForecastPresenterDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTemperature;
@property (weak, nonatomic) IBOutlet UILabel *lblSunrise;
@property (weak, nonatomic) IBOutlet UILabel *lblSunset;
@property (weak, nonatomic) IBOutlet UILabel *lblHumidity;
@property (weak, nonatomic) IBOutlet UILabel *lblWindSpeed;
@property (weak, nonatomic) IBOutlet UIStackView *stkDaily;
@property (weak, nonatomic) IBOutlet UIStackView *stkCurrent;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) ForecastPresenter *presenter;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stkDaily.alpha = 0;
    self.stkCurrent.alpha = 0;
    [self.activityIndicator startAnimating];
}

- (void)bindPresenter:(ForecastPresenter *)presenter {
    self.presenter = presenter;
    self.presenter.delegate = self;
    [self.presenter fetchData];
}

- (void)updateWithData:(ForecastData *)data {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.lblLocation.text = data.currentLocation;
        self.lblDay.text = data.currentDay;
        self.imgIcon.image = [UIImage weatherIcon:data.currentIcon];
        self.lblTemperature.text = data.currentTemperature;
        self.lblHumidity.text = data.currentHumidity;
        self.lblWindSpeed.text = data.currentWindSpeed;
        self.lblSunrise.text = data.currentSunrise;
        self.lblSunset.text = data.currentSunset;
        
        [self.activityIndicator stopAnimating];
        for (UIView *view in self.stkDaily.arrangedSubviews) {
            [view removeFromSuperview];
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            self.stkCurrent.alpha = 1;
            self.stkDaily.alpha = 1;
        }];
    });
    
    [data enumerateOverDailyUsing:^(NSString *icon, NSString *day, NSString *dayTemperature, NSString *nightTemperature) {
        dispatch_async(dispatch_get_main_queue(), ^{
            WeatherDailyView *cell = [WeatherDailyView new];
            cell.imgIcon.image = [UIImage weatherIcon:icon];
            cell.lblDay.text = day;
            cell.lblDayTemperature.text = dayTemperature;
            cell.lblNightTemperature.text = nightTemperature;
            [self.stkDaily addArrangedSubview:cell];
        });
    }];
}

- (void)showError:(NSError *)error
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.activityIndicator stopAnimating];
        [self presentViewController:alert animated:true completion:nil];
    });
}

- (IBAction)locationButtonTap:(UIButton *)sender {    
    [self.presenter locationButtonTap];
}

- (IBAction)refreshButtonTap:(UIButton *)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2 animations:^{
            self.stkCurrent.alpha = 0;
            self.stkDaily.alpha = 0;
        }];
        [self.activityIndicator startAnimating];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
                [self.presenter fetchData];
            });
        });
    });
}

@end
