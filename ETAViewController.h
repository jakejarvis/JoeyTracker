//
//  ETAViewController.h
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBXML.h"
#import "TBXML+HTTP.h"
#import <QuartzCore/QuartzCore.h>

@interface ETAViewController : UIViewController {
    TBXML * tbxml;
    
    IBOutlet UILabel *davis, *ccFront, *ccRear, *olin, *carm;
    IBOutlet UILabel *round1, *round2, *round3, *round4, *round5;
    IBOutlet UILabel *lastRefreshed;
    IBOutlet UILabel *leftbg, *davisbg, *ccfrontbg, *carmbg, *olinbg, *ccrearbg;
    IBOutlet UILabel *bground1, *bground2, *bground3, *bground4;
    
    IBOutlet UINavigationBar *navbar;
    IBOutlet UIBarButtonItem *navbarrefresh;
    
    NSTimer *timer;
    
    NSString *daviseta, *ccFronteta, *ccReareta, *olineta, *carmeta;
    
 //   NSNumber *timeLastUpdated;
    
    int offlineError; // 0: Not ever shown, 1: Needs to be shown, 2: Shown
}

@property (strong, nonatomic) UILabel *davis, *ccFront, *ccRear, *olin, *carm;
@property (strong, nonatomic) UILabel *round1, *round2, *round3, *round4, *round5;
@property (strong, nonatomic) UILabel *lastRefreshed;
@property (strong, nonatomic) UILabel *leftbg, *davisbg, *ccfrontbg, *carmbg, *olinbg, *ccrearbg;
@property (strong, nonatomic) UILabel *bground1, *bground2, *bground3, *bground4;

@property (strong, nonatomic) UINavigationBar *navbar;
@property (strong, nonatomic) UIBarButtonItem *navbarrefresh;



- (void)loadETAs;

- (IBAction)doRefresh;

@end
