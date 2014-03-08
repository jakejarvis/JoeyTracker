//
//  JTHelpViewController.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 3/5/14.
//  Copyright (c) 2014 Jake Jarvis. All rights reserved.
//

#import "JTHelpViewController.h"

@interface JTHelpViewController ()

@end

@implementation JTHelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)jakeButtonPressed:(id)sender
{
	NSString *urlString = @"http://jakejarvis.com/";
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
}

- (IBAction)emailButtonPressed:(id)sender
{
	NSString *urlString = @"mailto:hello@tuftsapps.com";
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
}

- (IBAction)tuftslifeButtonPressed:(id)sender
{
	NSString *urlString = @"http://www.tuftslife.com";
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
