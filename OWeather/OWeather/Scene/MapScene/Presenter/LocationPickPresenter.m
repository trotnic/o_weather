//
//  LocationPickPresenter.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "LocationPickPresenter.h"

@interface LocationPickPresenter ()

@property (nonatomic, strong) LocationService *service;
@property (nonatomic, strong) MKPointAnnotation *currentPoint;

@end

@implementation LocationPickPresenter

- (instancetype)initWithLocation:(LocationService *)service
{
    self = [super init];
    if (self) {
        _service = service;
    }
    return self;
}

- (void)observePoint:(MKPointAnnotation *)point
{
    self.currentPoint = point;
}

- (void)cancelButtonTap:(void (^)(void))completion
{
    
    if (completion) {
        completion();
    }
}

- (void)confirmButtonTap:(void (^)(void))completion
{
    [self.service updateLocationWithCoordinate:self.currentPoint.coordinate];
    if(completion) {
        completion();
    }
}
@end
