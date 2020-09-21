//
//  URLRequestConvertible.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol URLRequestConvertible <NSObject>

- (NSURLRequest *)request;

@end

NS_ASSUME_NONNULL_END
