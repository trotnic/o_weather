//
//  Coordinate.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/24/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "LocalCoordinate.h"

@implementation LocalCoordinate

- (instancetype)initWithLat:(double)latitude lon:(double)longitude
{
    self = [super init];
    if (self) {
        _latitude = @(latitude);
        _longitude = @(longitude);
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeDouble:self.latitude.doubleValue forKey:@"latitude"];
    [coder encodeDouble:self.longitude.doubleValue forKey:@"longitude"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    double latitude = [coder decodeDoubleForKey:@"latitude"];
    double longitude = [coder decodeDoubleForKey:@"longitude"];
    return [self initWithLat:latitude lon:longitude];
}

@end
