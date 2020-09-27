//
//  LocationService.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "LocationService.h"
#import <MapKit/MapKit.h>
#import "Coordinate.h"

static NSString * const coordinateKey = @"currentCoordinate";

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

- (void)fetchCurrentLocation {
    NSData *currentLocation = [NSUserDefaults.standardUserDefaults dataForKey:coordinateKey];
    if (currentLocation) {
        NSError *error = nil;
        
        Coordinate *coordinate = [NSKeyedUnarchiver unarchivedObjectOfClass:Coordinate.self fromData:currentLocation error:&error];
        
        if (error) {
            [self.delegate locationServiceDidReceiveError:error];
            return;
        }
        
        [self.delegate locationService:self didReceiveLat:coordinate.latitude.doubleValue lon:coordinate.longitude.doubleValue];
        return;
    }
    [self.locationManager requestLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted: {
            NSString *domain = @"com.uvolchyk.OWeather.ErrorDomain";
            NSString *desc = @"Unable to get location, try allow this app to interact with your location in the settings";
            NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };
            NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];
            [self.delegate locationServiceDidReceiveError:error];
        }
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (locations.count > 0) {
        CLLocation *location = locations.firstObject;
        [self saveCoordinate:location.coordinate.latitude lon:location.coordinate.longitude];
        [self.delegate locationService:self didReceiveLat:location.coordinate.latitude lon:location.coordinate.longitude];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.delegate locationServiceDidReceiveError:error];
}

- (void)updateLocationWithCoordinate:(CLLocationCoordinate2D)coordinate {
    [self saveCoordinate:coordinate.latitude lon:coordinate.longitude];
    [self.delegate locationService:self didReceiveLat:coordinate.latitude lon:coordinate.longitude];
}

- (void)saveCoordinate:(double)lat lon:(double)lon {
    Coordinate *coordinateToStore = [[Coordinate alloc] initWithLat:lat lon:lon];
    NSError *error = nil;
    NSData *rawCoordinate = [NSKeyedArchiver archivedDataWithRootObject:coordinateToStore requiringSecureCoding:NO error:&error];
    
    if (error) {
        [self.delegate locationServiceDidReceiveError:error];
        return;
    }
    
    [NSUserDefaults.standardUserDefaults setValue:rawCoordinate forKey:coordinateKey];
}

@end
