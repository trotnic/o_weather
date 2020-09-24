//
//  Coordinate.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/24/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Coordinate : NSObject <NSSecureCoding>

@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

- (instancetype)initWithLat:(double)latitude lon:(double)longitude;

@end

NS_ASSUME_NONNULL_END
