//
//  JTScheduleViewController.h
//  JoeyTracker
//
//  Created by Jake Jarvis on 3/5/14.
//  Copyright (c) 2014 Jake Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTScheduleViewController : UIViewController {
	IBOutlet UIWebView *webSchedule;
    
    NSString *html;
}

@end
