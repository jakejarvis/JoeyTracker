//
//  MapViewController.h
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
//    IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property (strong, nonatomic) UIWebView *webView;
//@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

@end
