//
//  LocationService.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol LocationServiceDelegate;

@interface LocationService : NSObject

@property (nonatomic, weak) id<LocationServiceDelegate> delegate;

@end

@protocol LocationServiceDelegate <NSObject>

- (void)locationService:(LocationService *)service didReceiveLat:(double)lat lon:(double)lon;

@end

NS_ASSUME_NONNULL_END
