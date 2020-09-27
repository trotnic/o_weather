//
//  LocationService.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol LocationServiceDelegate;

@interface LocationService : NSObject

@property (nonatomic, weak) id<LocationServiceDelegate> delegate;

- (void)updateLocationWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)fetchCurrentLocation;

@end

@protocol LocationServiceDelegate <NSObject>

- (void)locationService:(LocationService *)service didReceiveLat:(double)lat lon:(double)lon;
- (void)locationServiceDidReceiveError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
