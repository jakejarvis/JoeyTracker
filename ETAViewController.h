//
//  ETAViewController.h
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ETAViewController : UIViewController {
	IBOutlet UILabel *davis, *ccFront, *ccRear, *olin, *carm;
	IBOutlet UILabel *round1, *round2, *round3, *round4, *round5;
	IBOutlet UILabel *lastRefreshed;
	IBOutlet UILabel *leftbg, *davisbg, *ccfrontbg, *carmbg, *olinbg, *ccrearbg;
	
	IBOutlet UIBarButtonItem *refreshButton;
	
	NSTimer *timer;
    BOOL timerRunning;
	
    BOOL offline;
	BOOL offlineErrorShown; // 0: Not ever shown, 1: Needs to be shown, 2: Shown
}


- (void)loadETAs;

- (IBAction)pressRefresh:(id)sender;

@end
