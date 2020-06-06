//
//  OApi.h
//  OWeather
//
//  Created by Vladislav on 5/30/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OApiDelegate;


@interface OApi : NSObject

- (void)doThings;
@property(nonatomic, weak) id <OApiDelegate> delegate;

@end


@protocol OApiDelegate <NSObject>

- (void)net:(OApi *)api didReceiveData:(NSDictionary *)data;

@end


NS_ASSUME_NONNULL_END
