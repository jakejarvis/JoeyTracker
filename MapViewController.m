//
//  MapViewController.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import "MapViewController.h"
#import "AFNetworking.h"
#import "DDXML.h"

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	if (self) {
		self.title = NSLocalizedString(@"Map", @"Map");
		self.tabBarItem.image = [UIImage imageNamed:@"map.png"];
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
    
    
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 42.4028;
    zoomLocation.longitude= -71.1218;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.65*METERS_PER_MILE, 0.7*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    // 4
    [_mapView setRegion:adjustedRegion animated:NO];
    
    
    // DAVIS
    CLLocationCoordinate2D coordDavis;
    coordDavis.latitude = 42.396819;
    coordDavis.longitude = -71.122693;
    MKPointAnnotation *annotDavis = [[MKPointAnnotation alloc] init];
    [annotDavis setCoordinate:coordDavis];
    [annotDavis setTitle:@"Davis Square"];
    [_mapView addAnnotation:annotDavis];
    
    // CC REAR
    CLLocationCoordinate2D coordCCRear;
    coordCCRear.latitude = 42.405294;
    coordCCRear.longitude = -71.120365;
    MKPointAnnotation *annotCCRear = [[MKPointAnnotation alloc] init];
    [annotCCRear setCoordinate:coordCCRear];
    [annotCCRear setTitle:@"Campus Center (Rear)"];
    [_mapView addAnnotation:annotCCRear];
    
    // CARM/WREN
    CLLocationCoordinate2D coordCarm;
    coordCarm.latitude = 42.409556;
    coordCarm.longitude = -71.122203;
    MKPointAnnotation *annotCarm = [[MKPointAnnotation alloc] init];
    [annotCarm setCoordinate:coordCarm];
    [annotCarm setTitle:@"Carmichael / Wren Halls"];
    [_mapView addAnnotation:annotCarm];
    
    // OLIN
    CLLocationCoordinate2D coordOlin;
    coordOlin.latitude = 42.408217;
    coordOlin.longitude = -71.120966;
    MKPointAnnotation *annotOlin = [[MKPointAnnotation alloc] init];
    [annotOlin setCoordinate:coordOlin];
    [annotOlin setTitle:@"Olin Center"];
    [_mapView addAnnotation:annotOlin];
    
    // CC FRONT
    CLLocationCoordinate2D coordCCFront;
    coordCCFront.latitude = 42.405888;
    coordCCFront.longitude = -71.119786;
    MKPointAnnotation *annotCCFront = [[MKPointAnnotation alloc] init];
    [annotCCFront setCoordinate:coordCCFront];
    [annotCCFront setTitle:@"Campus Center (Front)"];
    [_mapView addAnnotation:annotCCFront];
    
    
    
    
    
    CLLocationCoordinate2D coordinates[108];
    
    coordinates[0] = CLLocationCoordinate2DMake(42.39679, -71.12276);
    coordinates[1] = CLLocationCoordinate2DMake(42.39772000000001, -71.1235);
    coordinates[2] = CLLocationCoordinate2DMake(42.3982, -71.1239);
    coordinates[3] = CLLocationCoordinate2DMake(42.39904000000001, -71.12457);
    coordinates[4] = CLLocationCoordinate2DMake(42.39916, -71.12469);
    coordinates[5] = CLLocationCoordinate2DMake(42.39985, -71.12524);
    coordinates[6] = CLLocationCoordinate2DMake(42.400400000000005, -71.12569);
    coordinates[7] = CLLocationCoordinate2DMake(42.40104, -71.12617);
    coordinates[8] = CLLocationCoordinate2DMake(42.40113, -71.12622);
    coordinates[9] = CLLocationCoordinate2DMake(42.40241, -71.12681);
    coordinates[10] = CLLocationCoordinate2DMake(42.40288, -71.12697);
    coordinates[11] = CLLocationCoordinate2DMake(42.40296, -71.12693);
    coordinates[12] = CLLocationCoordinate2DMake(42.40301, -71.12686000000001);
    coordinates[13] = CLLocationCoordinate2DMake(42.40303, -71.12671);
    coordinates[14] = CLLocationCoordinate2DMake(42.40297, -71.12651000000001);
    coordinates[15] = CLLocationCoordinate2DMake(42.402640000000005, -71.12575000000001);
    coordinates[16] = CLLocationCoordinate2DMake(42.40223, -71.12483);
    coordinates[17] = CLLocationCoordinate2DMake(42.40202, -71.12431000000001);
    coordinates[18] = CLLocationCoordinate2DMake(42.401830000000004, -71.12372);
    coordinates[19] = CLLocationCoordinate2DMake(42.40156, -71.12264);
    coordinates[20] = CLLocationCoordinate2DMake(42.40110000000001, -71.12074000000001);
    coordinates[21] = CLLocationCoordinate2DMake(42.4009, -71.11989000000001);
    coordinates[22] = CLLocationCoordinate2DMake(42.40081000000001, -71.11909);
    coordinates[23] = CLLocationCoordinate2DMake(42.400800000000004, -71.11876000000001);
    coordinates[24] = CLLocationCoordinate2DMake(42.400850000000005, -71.11751000000001);
    coordinates[25] = CLLocationCoordinate2DMake(42.400870000000005, -71.11717);
    coordinates[26] = CLLocationCoordinate2DMake(42.40099, -71.11698000000001);
    coordinates[27] = CLLocationCoordinate2DMake(42.400960000000005, -71.11685);
    coordinates[28] = CLLocationCoordinate2DMake(42.40099, -71.11665);
    coordinates[29] = CLLocationCoordinate2DMake(42.401030000000006, -71.11656);
    coordinates[30] = CLLocationCoordinate2DMake(42.40110000000001, -71.11648000000001);
    coordinates[31] = CLLocationCoordinate2DMake(42.40117, -71.11644000000001);
    coordinates[32] = CLLocationCoordinate2DMake(42.4012, -71.11644000000001);
    coordinates[33] = CLLocationCoordinate2DMake(42.401250000000005, -71.11646);
    coordinates[34] = CLLocationCoordinate2DMake(42.401300000000006, -71.11651);
    coordinates[35] = CLLocationCoordinate2DMake(42.401320000000005, -71.11655);
    coordinates[36] = CLLocationCoordinate2DMake(42.40133, -71.1166);
    coordinates[37] = CLLocationCoordinate2DMake(42.40149, -71.11674000000001);
    coordinates[38] = CLLocationCoordinate2DMake(42.401630000000004, -71.11684000000001);
    coordinates[39] = CLLocationCoordinate2DMake(42.402080000000005, -71.11691);
    coordinates[40] = CLLocationCoordinate2DMake(42.402750000000005, -71.11699);
    coordinates[41] = CLLocationCoordinate2DMake(42.40402, -71.11719000000001);
    coordinates[42] = CLLocationCoordinate2DMake(42.404860000000006, -71.11734000000001);
    coordinates[43] = CLLocationCoordinate2DMake(42.404770000000006, -71.11794);
    coordinates[44] = CLLocationCoordinate2DMake(42.40475, -71.11829);
    coordinates[45] = CLLocationCoordinate2DMake(42.404810000000005, -71.11907000000001);
    coordinates[46] = CLLocationCoordinate2DMake(42.40494, -71.11955);
    coordinates[47] = CLLocationCoordinate2DMake(42.40507, -71.11989000000001);
    coordinates[48] = CLLocationCoordinate2DMake(42.40525, -71.12039);
    coordinates[49] = CLLocationCoordinate2DMake(42.40541, -71.12082000000001);
    coordinates[50] = CLLocationCoordinate2DMake(42.406150000000004, -71.12031);
    coordinates[51] = CLLocationCoordinate2DMake(42.40673, -71.12191);
    coordinates[52] = CLLocationCoordinate2DMake(42.40767, -71.12436000000001);
    coordinates[53] = CLLocationCoordinate2DMake(42.40845, -71.12386000000001);
    coordinates[54] = CLLocationCoordinate2DMake(42.4093, -71.12329000000001);
    coordinates[55] = CLLocationCoordinate2DMake(42.40936000000001, -71.12324000000001);
    coordinates[56] = CLLocationCoordinate2DMake(42.40932, -71.12310000000001);
    coordinates[57] = CLLocationCoordinate2DMake(42.40979, -71.12265000000001);
    coordinates[58] = CLLocationCoordinate2DMake(42.409580000000005, -71.12218);
    coordinates[59] = CLLocationCoordinate2DMake(42.409400000000005, -71.12179);
    coordinates[60] = CLLocationCoordinate2DMake(42.4091, -71.12209);
    coordinates[61] = CLLocationCoordinate2DMake(42.4091, -71.12204000000001);
    coordinates[62] = CLLocationCoordinate2DMake(42.408770000000004, -71.12146);
    coordinates[63] = CLLocationCoordinate2DMake(42.40854, -71.12105000000001);
    coordinates[64] = CLLocationCoordinate2DMake(42.408440000000006, -71.12077000000001);
    coordinates[65] = CLLocationCoordinate2DMake(42.40796, -71.12109000000001);
    coordinates[66] = CLLocationCoordinate2DMake(42.40724, -71.12157);
    coordinates[67] = CLLocationCoordinate2DMake(42.40673, -71.12191);
    coordinates[68] = CLLocationCoordinate2DMake(42.406150000000004, -71.12031);
    coordinates[69] = CLLocationCoordinate2DMake(42.40569000000001, -71.11906);
    coordinates[70] = CLLocationCoordinate2DMake(42.405640000000005, -71.11885000000001);
    coordinates[71] = CLLocationCoordinate2DMake(42.40560000000001, -71.11859000000001);
    coordinates[72] = CLLocationCoordinate2DMake(42.40560000000001, -71.11817);
    coordinates[73] = CLLocationCoordinate2DMake(42.40567, -71.11745);
    coordinates[74] = CLLocationCoordinate2DMake(42.40541, -71.1174);
    coordinates[75] = CLLocationCoordinate2DMake(42.404860000000006, -71.11734000000001);
    coordinates[76] = CLLocationCoordinate2DMake(42.40402, -71.11719000000001);
    coordinates[77] = CLLocationCoordinate2DMake(42.402750000000005, -71.11699);
    coordinates[78] = CLLocationCoordinate2DMake(42.402080000000005, -71.11691);
    coordinates[79] = CLLocationCoordinate2DMake(42.401630000000004, -71.11684000000001);
    coordinates[80] = CLLocationCoordinate2DMake(42.40147, -71.11687);
    coordinates[81] = CLLocationCoordinate2DMake(42.40129, -71.11692000000001);
    coordinates[82] = CLLocationCoordinate2DMake(42.401270000000004, -71.11696);
    coordinates[83] = CLLocationCoordinate2DMake(42.40122, -71.11701000000001);
    coordinates[84] = CLLocationCoordinate2DMake(42.40115, -71.11705);
    coordinates[85] = CLLocationCoordinate2DMake(42.40106, -71.11704);
    coordinates[86] = CLLocationCoordinate2DMake(42.401, -71.11699);
    coordinates[87] = CLLocationCoordinate2DMake(42.400980000000004, -71.11695);
    coordinates[88] = CLLocationCoordinate2DMake(42.400960000000005, -71.1169);
    coordinates[89] = CLLocationCoordinate2DMake(42.40082, -71.11707000000001);
    coordinates[90] = CLLocationCoordinate2DMake(42.40059, -71.11725000000001);
    coordinates[91] = CLLocationCoordinate2DMake(42.40023, -71.11774000000001);
    coordinates[92] = CLLocationCoordinate2DMake(42.39988, -71.11821);
    coordinates[93] = CLLocationCoordinate2DMake(42.39945, -71.11889000000001);
    coordinates[94] = CLLocationCoordinate2DMake(42.39907, -71.11972);
    coordinates[95] = CLLocationCoordinate2DMake(42.39871, -71.12057);
    coordinates[96] = CLLocationCoordinate2DMake(42.39862, -71.12073000000001);
    coordinates[97] = CLLocationCoordinate2DMake(42.398540000000004, -71.12089);
    coordinates[98] = CLLocationCoordinate2DMake(42.3984, -71.12108);
    coordinates[99] = CLLocationCoordinate2DMake(42.39828000000001, -71.12122000000001);
    coordinates[100] = CLLocationCoordinate2DMake(42.398140000000005, -71.1213);
    coordinates[101] = CLLocationCoordinate2DMake(42.397560000000006, -71.12165);
    coordinates[102] = CLLocationCoordinate2DMake(42.39703, -71.12197);
    coordinates[103] = CLLocationCoordinate2DMake(42.396710000000006, -71.12219);
    coordinates[104] = CLLocationCoordinate2DMake(42.39659, -71.12228);
    coordinates[105] = CLLocationCoordinate2DMake(42.396510000000006, -71.12234000000001);
    coordinates[106] = CLLocationCoordinate2DMake(42.3967, -71.12269);
    coordinates[107] = CLLocationCoordinate2DMake(42.39679, -71.12276);
    
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coordinates count:108];
    
    [_mapView addOverlay:polyline];
    
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
    
    [self stopTimer];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackTranslucent];
	
	
    // run the plotter for the first time, then start the timer
	[self plotJoey];
    [self startTimer];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    
	[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
    
    [self stopTimer];
}

- (void)plotJoey
{
    
    /*****************************
	 *	 UPDATE IN PROGRESS	*
	 *****************************/
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.joeytracker.com/joey_pos.xml"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFKissXMLRequestOperation *operation = [AFKissXMLRequestOperation XMLDocumentRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, DDXMLDocument *XMLDocument) {
        
        // remove previous joey plots
        for (id<MKAnnotation> annotation in _mapView.annotations) {
            if([annotation isKindOfClass:[MKPointAnnotation class]] && [annotation title] == nil)
                [_mapView removeAnnotation:annotation];
        }
        
        NSError *error = nil;
        NSArray *buses = [XMLDocument nodesForXPath:@"buses/bus" error:&error];
        
        for(DDXMLElement *bus in buses) {
            
            double latitude = [[[[bus elementsForName:@"lat"] objectAtIndex:0] stringValue] doubleValue];
            double longitude = [[[[bus elementsForName:@"long"] objectAtIndex:0] stringValue] doubleValue];
            
            if(latitude != 0) {
                CLLocationCoordinate2D coordJoey;
                coordJoey.latitude = latitude;
                coordJoey.longitude = longitude;
                MKPointAnnotation *annotJoey = [[MKPointAnnotation alloc] init];
                [annotJoey setCoordinate:coordJoey];
                [_mapView addAnnotation:annotJoey];
            }
            
        }
        
		
        
		/*****************************
		 *   DONE UPDATING VISUALS   *
		 *****************************/
		
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, DDXMLDocument *XMLDocument) {
        
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
        
        /*****************************
		 *   DONE UPDATING VISUALS   *
		 *****************************/
		
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }];
    
    [operation start];
    
}

- (void)startTimer {
    if(timerRunning == NO) {
        timer = [NSTimer scheduledTimerWithTimeInterval:8
                                                 target:self
                                               selector:@selector(plotJoey)
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

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
	
	if ([overlay isKindOfClass:[MKPolyline class]]) {
		MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
		polylineView.strokeColor = [UIColor colorWithRed:48.0/255.0 green:15.0/255.0 blue:0.0/255.0 alpha:0.6];
		polylineView.lineWidth = 10;
		return polylineView;
	}
	
	return [[MKOverlayView alloc] initWithOverlay:overlay];
	
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if([annotation isKindOfClass:[MKPointAnnotation class]] && [annotation title] == nil) {

            MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"myIdentifier"];
            
            if (annotationView == nil) {
                annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myIdentifier"];
            } else {
                annotationView.annotation = annotation;
            }
            
            annotationView.enabled = NO;
            annotationView.image=[UIImage imageNamed:@"bus.png"];
            
            return annotationView;
            
    }
    
    return nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
