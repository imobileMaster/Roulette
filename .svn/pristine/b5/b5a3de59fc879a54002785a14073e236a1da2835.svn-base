//
//  MainViewController_iPhone.m
//  roulette
//
//  Created by Greg Ellis on 2014-02-07.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "MainViewController_iPhone.h"
#import "GameViewController_iPhone.h"
#import "LoginViewController_iPhone.h"
#import "LobbyViewController_iPhone.h"
#import "Common.h"

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>

@interface MainViewController_iPhone ()

@end

@implementation MainViewController_iPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)facebookloggedin:(NSNotificationCenter*)notificationcenter{
    [super facebookloggedin:notificationcenter];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:[[LobbyViewController_iPhone alloc] init] animated:NO];
    
    
    
    //[self.navigationController pushViewController:[[GameViewController_iPhone alloc] init] animated:YES];
}

-(void)facebookloggedout:(NSNotificationCenter*)notificationcenter{
    [super facebookloggedin:notificationcenter];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:[[LoginViewController_iPhone alloc] init] animated:NO];
}

-(void)login{
    [super login];
    
    [FBSession openActiveSessionWithReadPermissions:@[@"public_profile", @"email", @"user_location"]
                                       allowLoginUI:NO
                                  completionHandler:
     ^(FBSession *session, FBSessionState state, NSError *error) {
         [UIAppDelegate sessionStateChanged:session state:state error:error];
     }];
}

-(void)logout{
    [super logout];
    
    [FBSession.activeSession closeAndClearTokenInformation];
    [[FBSession activeSession] close];
    [FBSession setActiveSession:nil];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    [self.navigationController pushViewController:[[LoginViewController_iPhone alloc] init] animated:NO];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"width: %f - (%f, %f, %f, %f)", [Common currentWidth], progress.frame.origin.x, progress.frame.origin.y, progress.frame.size.width, progress.frame.size.height);
    [progress setFrame:CGRectMake((background.frame.size.width/2)-(progress.frame.size.width/2), 100+([Common currentHeight]/2)-(progress.frame.size.height/2), progress.frame.size.width, progress.frame.size.width)];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    if(!IS_IPHONE_5)
        [background setFrame:CGRectMake(-44, 0, background.frame.size.width, background.frame.size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
