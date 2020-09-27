//
//  LocationPickController.m
//  OWeather
//
//  Created by Uladzislau Volchyk on 9/21/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

#import "LocationPickController.h"
#import <MapKit/MapKit.h>

@interface LocationPickController () <LocationPickPresenterDelegate>
@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) LocationPickPresenter *presenter;
@end

@implementation LocationPickController


- (instancetype)initWithPresenter:(LocationPickPresenter *)presenter
{
    self = [super init];
    if (self) {
        _presenter = presenter;
        _presenter.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupNavigationButtons];
    [self setupMapView];
}

- (void)setupNavigationButtons
{
    UIButton *closeButton = [UIButton new];
    [closeButton setImage:[UIImage systemImageNamed:@"xmark"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(handleCancelButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    
    UIButton *confirmButton = [UIButton new];
    [confirmButton setImage:[UIImage systemImageNamed:@"checkmark"] forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(handleConfirmButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:confirmButton];
}

- (void)handleCancelButtonTap:(UIButton *)sender
{
    __weak typeof(self)weakSelf = self;
    [self.presenter cancelButtonTap:^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)handleConfirmButtonTap:(UIButton *)sender
{
    __weak typeof(self)weakSelf = self;
    [self.presenter confirmButtonTap:^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)setupMapView
{
    [self.view addSubview:self.mapView];
    [self.mapView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.mapView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.mapView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.mapView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    UITapGestureRecognizer *recognizer = [UITapGestureRecognizer new];
    [recognizer addTarget:self action:@selector(processTap:)];
    [self.mapView addGestureRecognizer:recognizer];
}

- (void)processTap:(UITapGestureRecognizer *)sender
{
    CLLocationCoordinate2D coordinates = [self.mapView convertPoint:[sender locationInView:self.mapView] toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] initWithCoordinate:coordinates];
    [self.presenter observePoint:point];
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotation:point];
}

- (MKMapView *)mapView
{
    if(!_mapView) {
        _mapView = [MKMapView new];
        _mapView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _mapView;
}

@end
