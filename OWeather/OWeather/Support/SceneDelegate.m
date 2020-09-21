//
//  SceneDelegate.m
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    if (windowScene != nil) {
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        
        OApi *service = [OApi new];
        ForecastPresenter *presenter = [[ForecastPresenter alloc] initWithService:service];
        ViewController *controller = [[ViewController alloc] initWithPresenter:presenter];
        
        self.window.rootViewController = controller;
        [self.window makeKeyAndVisible];
    }
}

@end
