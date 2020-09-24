//
//  SceneCoordinator.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/24/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "SceneCoordinator.h"
#import "OApi.h"
#import "LocationService.h"
#import "ViewController.h"
#import "LocationPickController.h"

@interface SceneCoordinator ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) LocationService *locationService;

@end

@implementation SceneCoordinator

- (instancetype)initWithWindow:(UIWindow *)window
{
    self = [super init];
    if (self) {
        _window = window;
    }
    return self;
}

- (void)start {
    OApi *apiService = [OApi new];
    self.locationService = [LocationService new];
    ForecastPresenter *presenter = [[ForecastPresenter alloc] initWithApi:apiService location:self.locationService coordinator:self];
    ViewController *controller = [[ViewController alloc] initWithPresenter:presenter];
    
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
}

- (void)showLocationPickScene {
    LocationPickPresenter *presenter = [[LocationPickPresenter alloc] initWithLocation:self.locationService];
    LocationPickController *controller = [[LocationPickController alloc] initWithPresenter: presenter];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    navigationController.modalPresentationStyle = UIModalPresentationAutomatic;
    [self.window.rootViewController presentViewController:navigationController animated:YES completion:nil];
}

@end
