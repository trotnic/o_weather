//
//  ForecastPresenter.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "ForecastPresenter.h"
#import "OOneCallRequest.h"
#import "LocationService.h"

@interface ForecastPresenter () <LocationServiceDelegate>

@property (nonatomic, strong) OApi *service;
@property (nonatomic, strong) LocationService *locationService;

@end

@implementation ForecastPresenter

- (instancetype)initWithService:(OApi *)service {
    self = [super init];
    if (self) {
        _service = service;
        service.delegate = self;
        _locationService = [LocationService new];
        _locationService.delegate = self;
    }
    return self;
}

- (void)net:(OApi *)api didReceiveForecast:(WeatherForecast *)forecast {
    ForecastData *data = [[ForecastData alloc] initWithWeather:forecast];
    [self.delegate updateWithData:data];
}

- (void)net:(OApi *)api didEndWithError:(NSError *)error {
    [self.delegate showError:error];
}

- (void)locationService:(LocationService *)service didReceiveLat:(double)lat lon:(double)lon {
    [self.service fetchDataOnRequest:[OOneCallRequest requestWithLat:lat lon:lon]];
}

@end
