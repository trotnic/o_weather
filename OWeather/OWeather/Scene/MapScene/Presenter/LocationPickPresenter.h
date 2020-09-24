//
//  LocationPickPresenter.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "LocationService.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LocationPickPresenterDelegate;

@interface LocationPickPresenter : NSObject

@property (nonatomic, weak) id<LocationPickPresenterDelegate> delegate;

- (void)cancelButtonTap:(void(^)(void))completion;
- (void)confirmButtonTap:(void(^)(void))completion;
- (void)observePoint:(MKPointAnnotation *)point;

- (instancetype)initWithLocation:(LocationService *)service;

@end

// MARK: Delegate protocol

@protocol LocationPickPresenterDelegate <NSObject>

@end

NS_ASSUME_NONNULL_END
