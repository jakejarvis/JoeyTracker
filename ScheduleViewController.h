//
//  ScheduleViewController.h
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UIViewController {
	IBOutlet UIWebView *webSchedule;
    
    NSString *html;
}

@end
