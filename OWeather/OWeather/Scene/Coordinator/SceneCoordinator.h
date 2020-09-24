//
//  SceneCoordinator.h
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/24/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SceneCoordinator : NSObject

- (instancetype)initWithWindow:(UIWindow *)window;
- (void)start;

- (void)showLocationPickScene;

@end

NS_ASSUME_NONNULL_END
