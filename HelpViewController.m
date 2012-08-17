//
//  HelpViewController.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import "HelpViewController.h"

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	if (self) {
		self.title = NSLocalizedString(@"Help", @"Help");
		self.tabBarItem.image = [UIImage imageNamed:@"help.png"];
	}
	
	return self;
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];

}

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
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

@end
