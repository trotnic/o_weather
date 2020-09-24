//
//  SceneDelegate.m
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "SceneDelegate.h"
#import "SceneCoordinator.h"

@interface SceneDelegate ()

@property (nonatomic, strong) SceneCoordinator *coordinator;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    if (windowScene != nil) {
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        self.coordinator = [[SceneCoordinator alloc] initWithWindow:self.window];
        [self.coordinator start];
    }
}

@end
