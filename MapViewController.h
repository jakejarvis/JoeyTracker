//
//  MapViewController.h
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController : UIViewController <MKMapViewDelegate> {
	IBOutlet MKMapView *_mapView;
    
    NSTimer *timer;
    BOOL timerRunning;
}

- (void)plotJoey;

@end
