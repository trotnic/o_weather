//
//  OApi.m
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "OApi.h"

@interface OApi ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation OApi

- (instancetype)init {
    return [self initWithSession:NSURLSession.sharedSession];
}

- (instancetype)initWithSession:(NSURLSession *)session {
    self = [super init];
    if (self) {
        _session = session;
    }
    return self;
}

- (void)fetchDataOnRequest:(id<URLRequestConvertible>)request {
    
    [[self.session dataTaskWithRequest:request.request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            [self.delegate net:self didEndWithError:error];
            return;
        }
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
        [self.delegate net:self didReceiveForecast:[[WeatherForecast alloc] initWithDictionary:dictionary]];
    }] resume];
}

@end
