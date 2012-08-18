//
//  ScheduleViewController.m
//  JoeyTracker
//
//  Created by Jake Jarvis on 2/1/12.
//  Copyright (c) 2012 Jake Jarvis. All rights reserved.
//

#import "ScheduleViewController.h"

@implementation ScheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	if (self) {
		self.title = NSLocalizedString(@"Schedule", @"Schedule");
		self.tabBarItem.image = [UIImage imageNamed:@"schedule.png"];
	}
	
	return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    html = @"";
    
    NSString *scheduleDayMonFri = @"<h1>Day Schedule (Monday &mdash; Friday)</h1>	<table width=\"100%\"><tbody><tr><th width=\"25%\">Campus Center</th><th width=\"25%\">Davis Square</th><th width=\"25%\">T.A.B.</th><th width=\"25%\">Olin Center</th></tr><tr><td align=\"center\">7:10 AM</td><td align=\"center\">7:15 AM</td><td align=\"center\">7:20 AM</td><td align=\"center\">7:30 AM</td></tr><tr><td align=\"center\">7:40 AM</td><td align=\"center\">7:45 AM</td><td align=\"center\">7:50 AM</td><td align=\"center\">8:00 AM</td></tr><tr><td align=\"center\">8:10 AM</td><td align=\"center\">8:15 AM</td><td align=\"center\">8:20 AM</td><td align=\"center\">8:30 AM</td></tr><tr><td align=\"center\">8:40 AM</td><td align=\"center\">8:45 AM</td><td align=\"center\">8:50 AM</td><td align=\"center\">8:55 AM</td></tr><tr><td align=\"center\">9:00 AM</td><td align=\"center\">9:05 AM</td><td align=\"center\">9:10 AM</td><td align=\"center\">9:15 AM</td></tr><tr><td align=\"center\">9:20 AM</td><td align=\"center\">9:25 AM</td><td align=\"center\">9:30 AM</td><td align=\"center\">9:35 AM</td></tr><tr><td align=\"center\">9:40 AM</td><td align=\"center\">9:45 AM</td><td align=\"center\">9:50 AM</td><td align=\"center\">9:55 AM</td></tr><tr><td align=\"center\">10:00 AM</td><td align=\"center\">10:05 AM</td><td align=\"center\">10:10 AM</td><td align=\"center\">10:15 AM</td></tr><tr><td align=\"center\">10:20 AM</td><td align=\"center\">10:25 AM</td><td align=\"center\">10:30 AM</td><td align=\"center\">10:35 AM</td></tr><tr><td align=\"center\">10:40 AM</td><td align=\"center\">10:45 AM</td><td align=\"center\">10:50 AM</td><td align=\"center\">10:55 AM</td></tr><tr><td align=\"center\">11:00 AM</td><td align=\"center\">11:05 AM</td><td align=\"center\">11:10 AM</td><td align=\"center\">11:15 AM</td></tr><tr><td align=\"center\">11:20 AM</td><td align=\"center\">11:25 AM</td><td align=\"center\">11:30 AM</td><td align=\"center\">11:35 AM</td></tr><tr><td align=\"center\">11:40 AM</td><td align=\"center\">11:45 AM</td><td align=\"center\">11:50 AM</td><td align=\"center\">11:55 AM</td></tr><tr><td align=\"center\">12:00 PM</td><td align=\"center\">12:05 PM</td><td align=\"center\">12:10 PM</td><td align=\"center\">12:15 PM</td></tr><tr><td align=\"center\">12:20 PM</td><td align=\"center\">12:25 PM</td><td align=\"center\">12:30 PM</td><td align=\"center\">12:35 PM</td></tr><tr><td align=\"center\">12:40 PM</td><td align=\"center\">12:45PM</td><td align=\"center\">12:50 PM</td><td align=\"center\">12:55 PM</td></tr><tr><td align=\"center\">1:00 PM</td><td align=\"center\">1:05 PM</td><td align=\"center\">1:10 PM</td><td align=\"center\">1:15 PM</td></tr><tr><td align=\"center\">1:20 PM</td><td align=\"center\">1:25 PM</td><td align=\"center\">1:30 PM</td><td align=\"center\">1:35 PM</td></tr><tr><td align=\"center\">1:40 PM</td><td align=\"center\">1:45 PM</td><td align=\"center\">1:50 PM</td><td align=\"center\">1:55 PM</td></tr><tr><td align=\"center\">2:00 PM</td><td align=\"center\">2:05 PM</td><td align=\"center\">2:10 PM</td><td align=\"center\">2:15 PM</td></tr><tr><td align=\"center\">2:20 PM</td><td align=\"center\">2:25 PM</td><td align=\"center\">2:30 PM</td><td align=\"center\">2:35 PM</td></tr><tr><td align=\"center\">2:40 PM</td><td align=\"center\">2:45 PM</td><td align=\"center\">2:50 PM</td><td align=\"center\">2:55 PM</td></tr><tr><td align=\"center\">3:00 PM</td><td align=\"center\">3:05 PM</td><td align=\"center\">3:10 PM</td><td align=\"center\">3:15 PM</td></tr><tr><td align=\"center\">3:20 PM</td><td align=\"center\">3:25 PM</td><td align=\"center\">3:30 PM</td><td align=\"center\">3:35 PM</td></tr><tr><td align=\"center\">3:40 PM</td><td align=\"center\">3:45 PM</td><td align=\"center\">3:50 PM</td><td align=\"center\">3:55 PM</td></tr><tr><td align=\"center\">4:00 PM</td><td align=\"center\">4:05 PM</td><td align=\"center\">4:10 PM</td><td align=\"center\">4:20 PM</td></tr><tr><td align=\"center\">4:30 PM</td><td align=\"center\">4:35 PM</td><td align=\"center\">4:40 PM</td><td align=\"center\">4:50 PM</td></tr><tr><td align=\"center\">5:00 PM</td><td align=\"center\">5:05 PM</td><td align=\"center\">5:10 PM</td><td align=\"center\">5:20 PM</td></tr><tr><td align=\"center\">5:30 PM</td><td align=\"center\">5:35 PM</td><td align=\"center\">5:40 PM</td><td align=\"center\">5:50 PM</td></tr></tbody></table>";
    NSString *scheduleNightMonWed = @"<h1>Night Schedule (Monday &mdash; Wednesday)</h1><table width=\"100%\"><tbody><tr><th width=\"33%\">Campus Center</th><th width=\"33%\">Davis Square</th><th width=\"33%\">Olin Center</th></tr><tr><td align=\"center\">6:00 PM</td><td align=\"center\">6:10 PM</td><td align=\"center\">6:20 PM</td></tr><tr><td align=\"center\">6:30 PM</td><td align=\"center\">6:40 PM</td><td align=\"center\">6:50 PM</td></tr><tr><td align=\"center\">7:00 PM</td><td align=\"center\">7:10 PM</td><td align=\"center\">7:20 PM</td></tr><tr><td align=\"center\">7:30 PM</td><td align=\"center\">7:40 PM</td><td align=\"center\">7:50 PM</td></tr><tr><td align=\"center\">8:00 PM</td><td align=\"center\">8:10 PM</td><td align=\"center\">8:20 PM</td></tr><tr><td align=\"center\">8:30 PM</td><td align=\"center\">8:40 PM</td><td align=\"center\">8:50 PM</td></tr><tr><td align=\"center\">9:00 PM</td><td align=\"center\">9:10 PM</td><td align=\"center\">9:20 PM</td></tr><tr><td align=\"center\">9:30 PM</td><td align=\"center\">9:40 PM</td><td align=\"center\">9:50 PM</td></tr><tr><td align=\"center\">10:00 PM</td><td align=\"center\">10:10 PM</td><td align=\"center\">10:20 PM</td></tr><tr><td align=\"center\">10:30 PM</td><td align=\"center\">10:40 PM</td><td align=\"center\">10:50 PM</td></tr><tr><td align=\"center\">11:00 PM</td><td align=\"center\">11:10 PM</td><td align=\"center\">11:20 PM</td></tr><tr><td align=\"center\">11:30 PM</td><td align=\"center\">11:40 PM</td><td align=\"center\">11:50 PM</td></tr><tr><td align=\"center\">12:00 AM</td><td align=\"center\">12:05 AM</td><td align=\"center\">12:20 AM</td></tr></tbody></table>";
    NSString *scheduleNightThuFri = @"<h1>Night Schedule (Thursday &amp; Friday)</h1><table width=\"100%\"><tbody><tr><th width=\"33%\">Campus Center</th><th width=\"33%\">Davis Square</th><th width=\"33%\">Olin Center</th></tr><tr><td align=\"center\">6:00 PM</td><td align=\"center\">6:10 PM</td><td align=\"center\">6:20 PM</td></tr><tr><td align=\"center\">6:30 PM</td><td align=\"center\">6:40 PM</td><td align=\"center\">6:50 PM</td></tr><tr><td align=\"center\">6:45 PM</td><td align=\"center\">6:55 PM</td><td align=\"center\">7:05 PM</td></tr><tr><td align=\"center\">7:00 PM</td><td align=\"center\">7:10 PM</td><td align=\"center\">7:20 PM</td></tr><tr><td align=\"center\">7:15 PM</td><td align=\"center\">7:25 PM</td><td align=\"center\">7:35 PM</td></tr><tr><td align=\"center\">7:30 PM</td><td align=\"center\">7:40 PM</td><td align=\"center\">7:50 PM</td></tr><tr><td align=\"center\">7:45 PM</td><td align=\"center\">7:55 PM</td><td align=\"center\">8:05 PM</td></tr><tr><td align=\"center\">8:00 PM</td><td align=\"center\">8:10 PM</td><td align=\"center\">8:20 PM</td></tr><tr><td align=\"center\">8:15 PM</td><td align=\"center\">8:25 PM</td><td align=\"center\">8:35 PM</td></tr><tr><td align=\"center\">8:30 PM</td><td align=\"center\">8:40 PM</td><td align=\"center\">8:50 PM</td></tr><tr><td align=\"center\">8:45 PM</td><td align=\"center\">8:55 PM</td><td align=\"center\">9:05 PM</td></tr><tr><td align=\"center\">9:00 PM</td><td align=\"center\">9:10 PM</td><td align=\"center\">9:20 PM</td></tr><tr><td align=\"center\">9:15 PM</td><td align=\"center\">9:25 PM</td><td align=\"center\">9:35 PM</td></tr><tr><td align=\"center\">9:30 PM</td><td align=\"center\">9:40 PM</td><td align=\"center\">9:50 PM</td></tr><tr><td align=\"center\">9:45 PM</td><td align=\"center\">9:55 PM</td><td align=\"center\">10:05 PM</td></tr><tr><td align=\"center\">10:00 PM</td><td align=\"center\">10:10 PM</td><td align=\"center\">10:20 PM</td></tr><tr><td align=\"center\">10:15 PM</td><td align=\"center\">10:25 PM</td><td align=\"center\">10:35 PM</td></tr><tr><td align=\"center\">10:30 PM</td><td align=\"center\">10:40 PM</td><td align=\"center\">10:50 PM</td></tr><tr><td align=\"center\">10:45 PM</td><td align=\"center\">10:55 PM</td><td align=\"center\">11:05 PM</td></tr><tr><td align=\"center\">11:00 PM</td><td align=\"center\">11:10 PM</td><td align=\"center\">11:20 PM</td></tr><tr><td align=\"center\">11:15 PM</td><td align=\"center\">11:25 PM</td><td align=\"center\">11:35 PM</td></tr><tr><td align=\"center\">11:30 PM</td><td align=\"center\">11:40 PM</td><td align=\"center\">11:50 PM</td></tr><tr><td align=\"center\">12:00 AM</td><td align=\"center\">12:10 AM</td><td align=\"center\">12:20 AM</td></tr><tr><td align=\"center\">12:30 AM</td><td align=\"center\">12:40 AM</td><td align=\"center\">12:50 AM</td></tr><tr><td align=\"center\">1:00 AM</td><td align=\"center\">1:10 AM</td><td align=\"center\">1:20 AM</td></tr><tr><td align=\"center\">1:30 AM</td><td align=\"center\">1:35 AM</td><td align=\"center\">1:50 AM</td></tr></tbody></table>";
    NSString *scheduleSat = @"<h1>Saturday Schedule</h1><table width=\"100%\"><tbody><tr><th width=\"33%\">Campus Center</th><th width=\"33%\">Davis Square</th><th width=\"33%\">Olin Center</th></tr><tr><td align=\"center\">10:00 AM</td><td align=\"center\">10:10 AM</td><td align=\"center\">10:20 AM</td></tr><tr><td align=\"center\">10:30 AM</td><td align=\"center\">10:40 AM</td><td align=\"center\">10:50 AM</td></tr><tr><td align=\"center\">11:00 AM</td><td align=\"center\">11:10 AM</td><td align=\"center\">11:20 AM</td></tr><tr><td align=\"center\">11:30 AM</td><td align=\"center\">11:40 AM</td><td align=\"center\">11:50 AM</td></tr><tr><td align=\"center\">12:00 PM</td><td align=\"center\">12:10 PM</td><td align=\"center\">12:20 PM</td></tr><tr><td align=\"center\">12:30 PM</td><td align=\"center\">12:40 PM</td><td align=\"center\">12:50 PM</td></tr><tr><td align=\"center\">1:00 PM</td><td align=\"center\">1:10 PM</td><td align=\"center\">1:20 PM</td></tr><tr><td align=\"center\">1:30 PM</td><td align=\"center\">1:40 PM</td><td align=\"center\">1:50 PM</td></tr><tr><td align=\"center\">2:00 PM</td><td align=\"center\">2:10 PM</td><td align=\"center\">2:20 PM</td></tr><tr><td align=\"center\">2:30 PM</td><td align=\"center\">2:40 PM</td><td align=\"center\">2:50 PM</td></tr><tr><td align=\"center\">3:00 PM</td><td align=\"center\">3:10 PM</td><td align=\"center\">3:20 PM</td></tr><tr><td align=\"center\">3:30 PM</td><td align=\"center\">3:40 PM</td><td align=\"center\">3:50 PM</td></tr><tr><td align=\"center\">4:00 PM</td><td align=\"center\">4:10 PM</td><td align=\"center\">4:20 PM</td></tr><tr><td align=\"center\">4:30 PM</td><td align=\"center\">4:40 PM</td><td align=\"center\">4:50 PM</td></tr><tr><td align=\"center\">5:00 PM</td><td align=\"center\">5:10 PM</td><td align=\"center\">5:20 PM</td></tr><tr><td align=\"center\">5:30 PM</td><td align=\"center\">5:40 PM</td><td align=\"center\">5:50PM</td></tr><tr><td align=\"center\">6:00 PM</td><td align=\"center\">6:10 PM</td><td align=\"center\">6:20 PM</td></tr><tr><td align=\"center\">6:30 PM</td><td align=\"center\">6:40 PM</td><td align=\"center\">6:50 PM</td></tr><tr><td align=\"center\">6:45 PM</td><td align=\"center\">6:55 PM</td><td align=\"center\">7:05 PM</td></tr><tr><td align=\"center\">7:00 PM</td><td align=\"center\">7:10 PM</td><td align=\"center\">7:20 PM</td></tr><tr><td align=\"center\">7:15 PM</td><td align=\"center\">7:25 PM</td><td align=\"center\">7:35 PM</td></tr><tr><td align=\"center\">7:30 PM</td><td align=\"center\">7:40 PM</td><td align=\"center\">7:50 PM</td></tr><tr><td align=\"center\">7:45 PM</td><td align=\"center\">7:55 PM</td><td align=\"center\">8:05 PM</td></tr><tr><td align=\"center\">8:00 PM</td><td align=\"center\">8:10 PM</td><td align=\"center\">8:20 PM</td></tr><tr><td align=\"center\">8:15 PM</td><td align=\"center\">8:25 PM</td><td align=\"center\">8:35 PM</td></tr><tr><td align=\"center\">8:30 PM</td><td align=\"center\">8:40 PM</td><td align=\"center\">8:50 PM</td></tr><tr><td align=\"center\">8:45 PM</td><td align=\"center\">8:55 PM</td><td align=\"center\">9:05 PM</td></tr><tr><td align=\"center\">9:00 PM</td><td align=\"center\">9:10 PM</td><td align=\"center\">9:20 PM</td></tr><tr><td align=\"center\">9:15 PM</td><td align=\"center\">9:25 PM</td><td align=\"center\">9:35 PM</td></tr><tr><td align=\"center\">9:30 PM</td><td align=\"center\">9:40 PM</td><td align=\"center\">9:50 PM</td></tr><tr><td align=\"center\">9:45 PM</td><td align=\"center\">9:55 PM</td><td align=\"center\">10:05 PM</td></tr><tr><td align=\"center\">10:00 PM</td><td align=\"center\">10:10 PM</td><td align=\"center\">10:20 PM</td></tr><tr><td align=\"center\">10:15 PM</td><td align=\"center\">10:25 PM</td><td align=\"center\">10:35 PM</td></tr><tr><td align=\"center\">10:30 PM</td><td align=\"center\">10:40 PM</td><td align=\"center\">10:50 PM</td></tr><tr><td align=\"center\">10:45 PM</td><td align=\"center\">10:55 PM</td><td align=\"center\">11:05 PM</td></tr><tr><td align=\"center\">11:00 PM</td><td align=\"center\">11:10 PM</td><td align=\"center\">11:20 PM</td></tr><tr><td align=\"center\">11:15 PM</td><td align=\"center\">11:25 PM</td><td align=\"center\">11:35 PM</td></tr><tr><td align=\"center\">11:30 PM</td><td align=\"center\">11:40 PM</td><td align=\"center\">11:50 PM</td></tr><tr><td align=\"center\">12:00 AM</td><td align=\"center\">12:10 AM</td><td align=\"center\">12:20 AM</td></tr><tr><td align=\"center\">12:30 AM</td><td align=\"center\">12:40 AM</td><td align=\"center\">12:50 AM</td></tr><tr><td align=\"center\">1:00 AM</td><td align=\"center\">1:10 AM</td><td align=\"center\">1:20 AM</td></tr><tr><td align=\"center\">1:30 AM</td><td align=\"center\">1:35 AM</td><td align=\"center\">1:50 AM</td></tr></tbody></table>";
    NSString *scheduleSun = @"<h1>Sunday Schedule</h1><table style=\"border:0;\" width=\"100%\"><tbody><tr><th width=\"33%\">Campus Center</th><th width=\"33%\">Davis Square</th><th width=\"33%\">Olin Center</th></tr><tr><td align=\"center\">10:00 AM</td><td align=\"center\">10:10 AM</td><td align=\"center\">10:20 AM</td></tr><tr><td align=\"center\">10:30 AM</td><td align=\"center\">10:40 AM</td><td align=\"center\">10:50 AM</td></tr><tr><td align=\"center\">11:00 AM</td><td align=\"center\">11:10 AM</td><td align=\"center\">11:20 AM</td></tr><tr><td align=\"center\">11:30 AM</td><td align=\"center\">11:40 AM</td><td align=\"center\">11:50 AM</td></tr><tr><td align=\"center\">12:00 PM</td><td align=\"center\">12:10 PM</td><td align=\"center\">12:20 PM</td></tr><tr><td align=\"center\">12:30 PM</td><td align=\"center\">12:40 PM</td><td align=\"center\">12:50 PM</td></tr><tr><td align=\"center\">1:00 PM</td><td align=\"center\">1:10 PM</td><td align=\"center\">1:20 PM</td></tr><tr><td align=\"center\">1:30 PM</td><td align=\"center\">1:40 PM</td><td align=\"center\">1:50 PM</td></tr><tr><td align=\"center\">2:00 PM</td><td align=\"center\">2:10 PM</td><td align=\"center\">2:20 PM</td></tr><tr><td align=\"center\">2:30 PM</td><td align=\"center\">2:40 PM</td><td align=\"center\">2:50 PM</td></tr><tr><td align=\"center\">3:00 PM</td><td align=\"center\">3:10 PM</td><td align=\"center\">3:20 PM</td></tr><tr><td align=\"center\">3:30 PM</td><td align=\"center\">3:40 PM</td><td align=\"center\">3:50 PM</td></tr><tr><td align=\"center\">4:00 PM</td><td align=\"center\">4:10 PM</td><td align=\"center\">4:20 PM</td></tr><tr><td align=\"center\">4:30 PM</td><td align=\"center\">4:40 PM</td><td align=\"center\">4:50 PM</td></tr><tr><td align=\"center\">5:00 PM</td><td align=\"center\">5:10 PM</td><td align=\"center\">5:20 PM</td></tr><tr><td align=\"center\">5:30 PM</td><td align=\"center\">5:40 PM</td><td align=\"center\">5:50 PM</td></tr><tr><td align=\"center\">6:00 PM</td><td align=\"center\">6:10 PM</td><td align=\"center\">6:20 PM</td></tr><tr><td align=\"center\">6:30 PM</td><td align=\"center\">6:40 PM</td><td align=\"center\">6:50 PM</td></tr><tr><td align=\"center\">7:00 PM</td><td align=\"center\">7:10 PM</td><td align=\"center\">7:20 PM</td></tr><tr><td align=\"center\">7:30 PM</td><td align=\"center\">7:40 PM</td><td align=\"center\">7:50 PM</td></tr><tr><td align=\"center\">8:00 PM</td><td align=\"center\">8:10 PM</td><td align=\"center\">8:20 PM</td></tr><tr><td align=\"center\">8:30 PM</td><td align=\"center\">8:40 PM</td><td align=\"center\">8:50 PM</td></tr><tr><td align=\"center\">9:00 PM</td><td align=\"center\">9:10 PM</td><td align=\"center\">9:20 PM</td></tr><tr><td align=\"center\">9:30 PM</td><td align=\"center\">9:40 PM</td><td align=\"center\">9:50 PM</td></tr><tr><td align=\"center\">10:00 PM</td><td align=\"center\">10:10 PM</td><td align=\"center\">10:20 PM</td></tr><tr><td align=\"center\">10:30 PM</td><td align=\"center\">10:40 PM</td><td align=\"center\">10:50 PM</td></tr><tr><td align=\"center\">11:00 PM</td><td align=\"center\">11:10 PM</td><td align=\"center\">11:20 PM</td></tr><tr><td align=\"center\">11:30 PM</td><td align=\"center\">11:40 PM</td><td align=\"center\">11:50 PM</td></tr><tr><td align=\"center\">12:00 AM</td><td align=\"center\">12:05 AM</td><td align=\"center\">12:20 AM</td></tr></tbody></table>";
    
    NSMutableArray *schedules = [[NSMutableArray alloc] initWithObjects:scheduleDayMonFri,
                                                                        scheduleNightMonWed,
                                                                        scheduleNightThuFri,
                                                                        scheduleSat,
                                                                        scheduleSun, nil];
    
    int firstSchedule = 0;
    int secondSchedule = 1;
    
    // time offsets!
    NSDate *date = [NSDate date];
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:(NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    
    if([comps weekday] == 1 && [comps hour] > 5) { // Sunday
        firstSchedule = 4;
    } else if(([comps weekday] == 7 && [comps hour] > 5) || ([comps weekday] == 1 && [comps hour] <= 3)) { // Saturday
        firstSchedule = 3;
    } else {
        if([comps hour] >= 3 && [comps hour] <= 17) {
            // weekday during day
            firstSchedule = 0;
        } else {
            // weeknight
            if([comps weekday] != 2 && [comps hour] >= 0 && [comps hour] <= 3) {
                [comps setHour:([comps hour] - 4)];    // avoid the late times bleeding into the next day
                [comps setWeekday:([comps weekday] - 1)];
            }
            
            if([comps weekday] >= 2 && [comps weekday] <= 4) { // night, monday - wednesday
                firstSchedule = 1;
            } else {
                firstSchedule = 2;
            }
        }
    }
    
    
    if(firstSchedule == 0) {  // daytime weekday
        if([comps weekday] >= 2 && [comps weekday] <= 4) {  // monday / tuesday / wednesday
            secondSchedule = 1; // show mon - wed night schedule next
        } else if([comps weekday] == 5 || [comps weekday] == 6) {  // thursday or friday
            secondSchedule = 2; // show thurs - fri night schedule next
        }
    } else if(firstSchedule == 3) {  // all day saturday
        secondSchedule = 4; // show sunday schedule next
    } else if(firstSchedule == 4) {  // all day sunday
        secondSchedule = 0; // show mon - fri day schedule next
    } else {  // weeknight
        if([comps weekday] >= 2 && [comps weekday] <= 5)  // monday night - thurs night
            secondSchedule = 0;  // show mon - fri day next
        else  // fri night
            secondSchedule = 3;  // show sat day schedule next
    }
    
    html = [html stringByAppendingString:@"<html><head><style type=\"text/css\">	body { margin:12px 0px 10px 0px; background-color: #e6e2dd; }	td,th { font-family: \"Helvetica\"; font-size:14px;}	th{background-color:#aaa; margin-bottom:10px;} table { padding-bottom:17px; }  hr { border:0; width: 100%; background-color:#000; height:1px; margin-bottom:20px; }	h1 { text-align:center; font-family: \"Helvetica\"; font-size:16px;}</style><meta name=\"viewport\" content=\"width=320; initial-scale=1.0; maximum-scale=1.0\"/></head><body>"];
    
    html = [html stringByAppendingString:[schedules objectAtIndex:firstSchedule]];
    html = [html stringByAppendingString:@"<hr>"];
    html = [html stringByAppendingString:[schedules objectAtIndex:secondSchedule]];
    html = [html stringByAppendingString:@"<hr>"];
    
    int realCount = 2;
    for(int i = 0; i < 5; i++) {
        int showSchedule = (i + secondSchedule) % 5;
        
        if(showSchedule != firstSchedule && showSchedule != secondSchedule) {
            html = [html stringByAppendingString:[schedules objectAtIndex:showSchedule]];
            
            realCount++;
            
            if(realCount != 5)
                html = [html stringByAppendingString:@"<hr>"];
        }
    }
    
    html = [html stringByAppendingString:@"</body></html>"];
    
    
	webSchedule.opaque = NO;
	webSchedule.backgroundColor = [UIColor clearColor];
    
	[webSchedule loadHTMLString:html baseURL:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
