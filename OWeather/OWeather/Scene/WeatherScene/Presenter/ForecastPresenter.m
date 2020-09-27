//
//  ForecastPresenter.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "ForecastPresenter.h"
#import "OOneCallRequest.h"

@interface ForecastPresenter () <LocationServiceDelegate>

@property (nonatomic, strong) OApi *apiService;
@property (nonatomic, strong) LocationService *locationService;
@property (nonatomic, strong) SceneCoordinator *coordinator;

@end

@implementation ForecastPresenter

- (instancetype)initWithApi:(OApi *)apiService
                   location:(LocationService *)locationService
                coordinator:(SceneCoordinator *)coordinator
{
    self = [super init];
    if (self) {
        _apiService = apiService;
        _apiService.delegate = self;
        _locationService = locationService;
        _locationService.delegate = self;
        _coordinator = coordinator;
    }
    return self;
}

// MARK: View Controller

- (void)fetchData
{
    [self.locationService fetchCurrentLocation];
}

- (void)locationButtonTap
{
    [self.coordinator showLocationPickScene];
}

// MARK: Api delegate

- (void)net:(OApi *)api didReceiveForecast:(WeatherForecast *)forecast
{
    ForecastData *data = [[ForecastData alloc] initWithWeather:forecast];
    [self.delegate updateWithData:data];
}

- (void)net:(OApi *)api didEndWithError:(NSError *)error
{
    [self.delegate showError:error];
}

// MARK: Location delegate

- (void)locationService:(LocationService *)service didReceiveLat:(double)lat lon:(double)lon
{
    [self.apiService fetchDataOnRequest:[OOneCallRequest requestWithLat:lat lon:lon]];
}

- (void)locationServiceDidReceiveError:(NSError *)error
{
    [self.delegate showError:error];
}

@end
