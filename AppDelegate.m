//
//  AppDelegate.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import <Crashlytics/Crashlytics.h>

#import "AppDelegate.h"

#import "ETAViewController.h"
#import "MapViewController.h"
#import "ScheduleViewController.h"
#import "HelpViewController.h"

#import "LocalyticsSession.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[Crashlytics startWithAPIKey:@"ad868b2e526ef2c302085800eb912abf93c6f510"];
	
    [[LocalyticsSession sharedLocalyticsSession] startSession:@"fd04293dc8c7f0ecaf25320-d6d726b4-e8c8-11e1-4d98-00ef75f32667"];
    
	[[UIApplication sharedApplication] 
	 setStatusBarHidden:NO];
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	// Override point for customization after application launch.
	UIViewController *vcETA = [[ETAViewController alloc] initWithNibName:@"ETAViewController" bundle:nil];
	UIViewController *vcMap = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
	UIViewController *vcSchedule = [[ScheduleViewController alloc] initWithNibName:@"ScheduleViewController" bundle:nil];
	UIViewController *vcHelp = [[HelpViewController alloc] initWithNibName:@"HelpViewController" bundle:nil];
	self.tabBarController = [[UITabBarController alloc] init];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:vcETA, vcMap, vcSchedule, vcHelp, nil];
	
    
    // preload the schedule html
	self.window.rootViewController = vcSchedule;
	[self.window makeKeyAndVisible];
    
	self.window.rootViewController = self.tabBarController;
	[self.window makeKeyAndVisible];
    
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
    
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
    
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
    
    [[LocalyticsSession sharedLocalyticsSession] resume];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
    
    [[LocalyticsSession sharedLocalyticsSession] resume];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
    
    // Close Localytics Session
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
