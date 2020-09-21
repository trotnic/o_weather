//
//  OOneCallRequest.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "APIRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface OOneCallRequest : APIRequest

+ (instancetype)requestWithLat:(double)lat lon:(double)lon;
- (instancetype)initWithLat:(double)lat lon:(double)lon;


@end

NS_ASSUME_NONNULL_END
