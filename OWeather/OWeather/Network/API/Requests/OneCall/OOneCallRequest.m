//
//  OOneCallRequest.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "OOneCallRequest.h"

@interface OOneCallRequest ()

@property (nonatomic, strong) NSNumber *lat;
@property (nonatomic, strong) NSNumber *lon;

@end

@implementation OOneCallRequest

+ (instancetype)requestWithLat:(double)lat lon:(double)lon {
    OOneCallRequest *request = [[OOneCallRequest alloc] initWithLat:lat lon:lon];
    return request;
}

- (instancetype)initWithLat:(double)lat lon:(double)lon {
    self = [super init];
    if (self) {
        _lat = [NSNumber numberWithDouble:lat];
        _lon = [NSNumber numberWithDouble:lon];
    }
    return self;
}

- (NSString *)resource {
    return @"/onecall";
}

- (NSArray<NSURLQueryItem *> *)queryParameters {
    return @[
        [NSURLQueryItem queryItemWithName:@"lat" value:[NSString stringWithFormat:@"%f", self.lat.doubleValue]],
        [NSURLQueryItem queryItemWithName:@"lon" value:[NSString stringWithFormat:@"%f", self.lon.doubleValue]],
        [NSURLQueryItem queryItemWithName:@"appid" value:@"4deaf71fdaab5745a431410719d42d5f"],
        [NSURLQueryItem queryItemWithName:@"exclude" value:@"minutely,hourly"]
    ];
}

@end
