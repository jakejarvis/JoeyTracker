//
//  ETAViewController.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import "ETAViewController.h"
#import "AFNetworking.h"
#import "AFNetworking.h"
#import "DDXML.h"

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
	
	timer = [NSTimer scheduledTimerWithTimeInterval:45
                                             target:self
                                           selector:@selector(loadETAs)
                                           userInfo:nil
                                            repeats:YES];
    
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
    
	/*****************************
	 *	 UPDATE IN PROGRESS	*
	 *****************************/
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[refreshButton setEnabled:NO];
	[lastRefreshed setText:@"Updating..."];
	
    
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.joeytracker.com/joey_eta.xml"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFKissXMLRequestOperation *operation = [AFKissXMLRequestOperation XMLDocumentRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, DDXMLDocument *XMLDocument) {
        
        NSLog(@"XML download successful");
        
        NSError *error = nil;
        NSArray *etas = [XMLDocument nodesForXPath:@"etas/eta" error:&error];
        
//        NSLog(@"%@", XMLDocument);
        
        NSString *daviseta, *ccFronteta, *ccReareta, *olineta, *carmeta;
        
        for(DDXMLElement *eta in etas) {
            
            NSLog(@"-----------");
            
            //NSLog(@"eta: %@", eta);
            
            int stop_id = [[[[eta elementsForName:@"stop_id"] objectAtIndex:0] stringValue] intValue];
            int seconds = [[[[eta elementsForName:@"seconds"] objectAtIndex:0] stringValue] intValue];
            
            NSLog(@"stop_id: %i", stop_id);
            NSLog(@"seconds: %i", seconds);
            
            NSString *etaText;
			
			if(seconds >= 60) {
				etaText = [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:ceil((seconds / 60)+1)]];
			} else if (seconds < 60 && seconds > 0) {
				etaText = @"1";
			} else if(seconds == -3) {
				etaText = @"--";
				if(offlineError == 0) offlineError = 1;
			} else if(seconds == -2) {
				etaText = @"0";
			} else if(seconds < 60 || seconds == -1) {
				etaText = @"AT";
            }
			
            
            if(stop_id == 1) daviseta = [NSString stringWithString:etaText];
			else if(stop_id == 2) ccReareta = [NSString stringWithString:etaText];
			else if(stop_id == 3) carmeta = [NSString stringWithString:etaText];
			else if(stop_id == 4) olineta = [NSString stringWithString:etaText];
			else if(stop_id == 5) ccFronteta = [NSString stringWithString:etaText];
            
            
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
		
        NSDate *today = [NSDate date];
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
		NSString *currentTime = [dateFormatter stringFromDate:today];
        
		[lastRefreshed setText:[NSString stringWithFormat:@"Last updated at %@.", currentTime]];
        
        
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
        
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, DDXMLDocument *XMLDocument) {
        
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
        
        [lastRefreshed setText:@"Update failed."];
        
        /*****************************
		 *   DONE UPDATING VISUALS   *
		 *****************************/
		
		[refreshButton setEnabled:YES];
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }];
    
    [operation start];
    
 
	
    /*****************************
     *       RESTART TIMER       *
     *****************************/
    
	timer = [NSTimer scheduledTimerWithTimeInterval:45
                                             target:self
                                           selector:@selector(loadETAs)
                                           userInfo:nil
                                            repeats:YES];
    
}

- (IBAction)pressRefresh:(id)sender
{
	offlineError = 0;
	[self loadETAs];	
}

@end
