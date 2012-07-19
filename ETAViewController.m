//
//  ETAViewController.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import "ETAViewController.h"

@implementation ETAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	if (self) {
		self.title = NSLocalizedString(@"ETAs", @"ETAs");
		self.tabBarItem.image = [UIImage imageNamed:@"ETA"];
	}
	
	offlineError = 0;
	
	return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
	
	leftbg.layer.cornerRadius = 8;
	davisbg.layer.cornerRadius = 8;
	ccfrontbg.layer.cornerRadius = 8;
	carmbg.layer.cornerRadius = 8;
	olinbg.layer.cornerRadius = 8;
	ccrearbg.layer.cornerRadius = 8;
	
	round1.layer.cornerRadius = 8;
	round2.layer.cornerRadius = 8;
	round3.layer.cornerRadius = 8;
	round4.layer.cornerRadius = 8;
	round5.layer.cornerRadius = 8;
	
	[self loadETAs];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:45 target:self selector:@selector(loadETAs) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	[timer invalidate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)loadETAs
{
	finished = NO;
	
	
	/*****************************
	 *	 UPDATE IN PROGRESS	*
	 *****************************/
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[refreshButton setEnabled:NO];
	[lastRefreshed setText:@"Updating..."];
	
	
	dispatch_async(dispatch_queue_create("com.jakejarvis.joeytracker.ETA",NULL),^{
		
		// xml success
		TBXMLSuccessBlock successBlock = ^(TBXML *tbxmlDocument) {
			
			TBXMLElement * element = tbxml.rootXMLElement;
			element = element->firstChild;
			
			do {
				int stop_id = [[TBXML textForElement:[TBXML childElementNamed:@"stop_id" parentElement:element]] intValue];
				int seconds = [[TBXML textForElement:[TBXML childElementNamed:@"seconds" parentElement:element]] intValue];
				
				NSString *eta;
				
				if(seconds >= 60) {
					eta = [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:ceil((seconds / 60)+1)]];
				} else if (seconds < 60 && seconds > 0) {
					eta = @"1";
				} else if(seconds == -3) {
					eta = @"--";
					if(offlineError == 0) offlineError = 1;
				} else if(seconds == -2) {
					eta = @"0";
				} else if(seconds < 60 || seconds == -1) {
					eta = @"AT";
				}
				
				if(stop_id == 1) daviseta = [NSString stringWithString:eta];
				else if(stop_id == 2) ccReareta = [NSString stringWithString:eta];
				else if(stop_id == 3) carmeta = [NSString stringWithString:eta];
				else if(stop_id == 4) olineta = [NSString stringWithString:eta];
				else if(stop_id == 5) ccFronteta = [NSString stringWithString:eta];
			} while ((element = element->nextSibling)); 
			
			NSDate *today = [NSDate date];
			NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
			[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
			NSString *currentTime = [dateFormatter stringFromDate:today];
			
			lastUpdatedText = [NSString stringWithFormat:@"Last updated at %@.", currentTime];
			
			finished = YES;
		};
		
		// xml failure
		TBXMLFailureBlock failureBlock = ^(TBXML *tbxmlDocument, NSError * error) {
			NSLog(@"Error! %@ %@", [error localizedDescription], [error userInfo]);
			lastUpdatedText = @"Update failed.";
			finished = YES;
		};
		
		tbxml = [[TBXML alloc] initWithURL:[NSURL URLWithString:@"http://www.joeytracker.com/joey_eta.xml"] 
								   success:successBlock 
								   failure:failureBlock];
		
		
		dispatch_sync(dispatch_get_main_queue(),^{

			while(finished == NO) {
				[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
			}
			
			
			/*****************************
			 *	 CHANGE ETA LABELS	 *
			 *****************************/
			
			[davis setText:daviseta];
			[ccFront setText:ccFronteta];
			[carm setText:carmeta];
			[olin setText:olineta];
			[ccRear setText:ccReareta];
			
			
			/*****************************
			 *	 LAST UPDATED TIME	 *
			 *****************************/
			
			[lastRefreshed setText:lastUpdatedText];
			
			
			/*****************************
			 *   DONE UPDATING VISUALS   *
			 *****************************/
			
			[refreshButton setEnabled:YES];
			[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
			
			
			/*****************************
			 *	  NO JOEYS FOUND?	  *
			 *****************************/
			
			if(offlineError == 1) {
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" 
																message:@"All of the Joeys appear to be offline right now. Check the schedule below to make sure they're running right now, or nicely remind your driver to turn his or her GPS on!"
															   delegate:nil 
													  cancelButtonTitle:@"OK" 
													  otherButtonTitles: nil];
				[alert show];
				
				offlineError = 2;
			}
			
		});
	});
}

- (IBAction)pressRefresh:(id)sender
{
	offlineError = 0;
	[self loadETAs];	
}

@end
