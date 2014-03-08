//
//  JTMapViewController.h
//  JoeyTracker
//
//  Created by Jake Jarvis on 3/5/14.
//  Copyright (c) 2014 Jake Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface JTMapViewController : UIViewController <MKMapViewDelegate> {
	IBOutlet MKMapView *_mapView;
    
    NSTimer *timer;
    BOOL timerRunning;
}

- (void)plotJoey;


@end
