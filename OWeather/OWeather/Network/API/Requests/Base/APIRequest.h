//
//  APIRequest.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLRequestConvertible.h"


NS_ASSUME_NONNULL_BEGIN

@interface APIRequest : NSObject <URLRequestConvertible>


- (NSString *)scheme;
- (NSString *)host;
- (NSString *)version;
- (NSString *)endPoint;
- (NSString *)resource;
- (NSArray<NSURLQueryItem *> *)queryParameters;
- (NSString *)requestType;
- (NSString *)contentType;
- (NSURLRequest *)request;
- (NSData *)body;
- (NSArray<NSDictionary<NSString *, NSString *> *> *)headers;

@end

NS_ASSUME_NONNULL_END
