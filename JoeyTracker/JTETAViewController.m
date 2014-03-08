//
//  JTETAViewController.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 3/5/14.
//  Copyright (c) 2014 Jake Jarvis. All rights reserved.
//

#import "JTETAViewController.h"
#import "AFNetworking.h"
#import "DDXML.h"

@interface JTETAViewController ()

@end

@implementation JTETAViewController

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
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
    {
        [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:(96/255.0) green:(96/255.0) blue:(96/255.0) alpha:1]];
    }
    
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
	
    offline = NO;
	offlineErrorShown = NO;
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	[self stopTimer];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
    [self loadETAs];
    [self startTimer];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self stopTimer];
}

- (void)startTimer {
    
    if(timerRunning == NO) {
        timer = [NSTimer scheduledTimerWithTimeInterval:30
                                                 target:self
                                               selector:@selector(loadETAs)
                                               userInfo:nil
                                                repeats:YES];
        timerRunning = YES;
    } else {
        [self stopTimer];
        [self startTimer];
    }
    
}

- (void)stopTimer {
    
    if(timerRunning == YES) {
        [timer invalidate];
        timerRunning = NO;
    }
    
}

- (void)loadETAs
{
    
    offline = NO;
    
	/*****************************
	 *	 UPDATE IN PROGRESS	*
	 *****************************/
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[refreshButton setEnabled:NO];
	[lastRefreshed setText:@"Updating..."];
	
    
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.joeytracker.com/joey_eta.xml"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFKissXMLRequestOperation *operation = [AFKissXMLRequestOperation XMLDocumentRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, DDXMLDocument *XMLDocument) {
        
        NSError *error = nil;
        NSArray *etas = [XMLDocument nodesForXPath:@"etas/eta" error:&error];
        
        NSString *daviseta, *ccFronteta, *ccReareta, *olineta, *carmeta;
        
        for(DDXMLElement *eta in etas) {
            
            int stop_id = [[[[eta elementsForName:@"stop_id"] objectAtIndex:0] stringValue] intValue];
            int seconds = [[[[eta elementsForName:@"seconds"] objectAtIndex:0] stringValue] intValue];
            
            NSString *etaText;
			
			if(seconds >= 60) {
				etaText = [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:ceil((seconds / 60)+1)]];
			} else if (seconds < 60 && seconds > 0) {
				etaText = @"1";
			} else if(seconds == -3) {
				etaText = @"--";
				offline = YES;
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
		 *      NO JOEYS FOUND?      *
		 *****************************/
		
		if(offline == YES && offlineErrorShown == NO) {
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops..."
															message:@"It looks like all the Joeys are offline right now. Please try again later."
														   delegate:nil
												  cancelButtonTitle:@"Will do!"
												  otherButtonTitles: nil];
			[alert show];
			
			offlineErrorShown = YES;
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
    
}

- (IBAction)pressRefresh:(id)sender
{
	offlineErrorShown = NO;
    
	[self loadETAs];
	[self startTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
