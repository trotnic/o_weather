//
//  LocationService.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "LocationService.h"
#import <MapKit/MapKit.h>

@interface LocationService () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation LocationService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [CLLocationManager new];
        _locationManager.delegate = self;
        [_locationManager requestAlwaysAuthorization];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusDenied:
            NSLog(@"CL Authorization Denied");
            return;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"CL Authorization Restricted");
            return;
//        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationManager requestLocation];
//            [self.locationManager startUpdatingLocation];
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (locations.count > 0) {
        CLLocation *location = locations.firstObject;
        [self.delegate locationService:self didReceiveLat:location.coordinate.latitude lon:location.coordinate.longitude];
    }
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    // TODO: Implement error handling
}

@end
