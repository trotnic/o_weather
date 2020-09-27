//
//  APIRequest.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "APIRequest.h"

@implementation APIRequest

- (NSString *)scheme {
    return @"HTTP";
}

- (NSString *)host {
    return @"api.openweathermap.org";
}

- (NSString *)version {
    return @"/data/2.5";
}

- (NSString *)endPoint {
    return @"";
}

- (NSString *)resource {
    return @"";
}

- (NSArray<NSURLQueryItem *> *)queryParameters {
    return @[];
}

- (NSString *)requestType {
    return @"GET";
}

- (NSString *)contentType {
    return @"";
}

- (NSArray<NSDictionary<NSString *,NSString *> *> *)headers {
    return @[];
}

- (NSData *)body {
    return nil;
}

- (NSURLRequest *)request {
    NSURLComponents *components = [NSURLComponents new];
    components.scheme = self.scheme;
    components.host = self.host;
    components.queryItems = self.queryParameters;
    components.path = [NSString stringWithFormat:@"%@%@%@", self.version, self.endPoint, self.resource];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:components.URL];
    
    for (NSDictionary<NSString *, NSString *> *header in [self headers]) {
        [request addValue:header.allValues.firstObject forHTTPHeaderField:header.allKeys.firstObject];
    }
    
    request.HTTPMethod = self.requestType;
    request.HTTPBody = [self body];
    return request;
}

@end
