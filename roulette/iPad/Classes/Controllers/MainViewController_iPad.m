//
//  MainViewController_iPad.m
//  roulette
//
//  Created by Greg Ellis on 2014-02-07.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController_iPad.h"
#import "GameViewController_iPad.h"
#import "LoginViewController_iPad.h"
#import "LobbyViewController_iPad.h"
#import "Common.h"

@interface MainViewController_iPad ()

@end

@implementation MainViewController_iPad

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
    [self.navigationController pushViewController:[[LobbyViewController_iPad alloc] init] animated:NO];
    
    //[self.navigationController pushViewController:[[GameViewController_iPad alloc] init] animated:YES];
}

-(void)facebookloggedout:(NSNotificationCenter*)notificationcenter{
    [super facebookloggedin:notificationcenter];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:[[LoginViewController_iPad alloc] init] animated:NO];
}

-(void)playnow:(id)sender{
    [super playnow:sender];
    
    [self.navigationController pushViewController:[[GameViewController_iPad alloc] init] animated:YES];
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
    
    [self.navigationController pushViewController:[[LoginViewController_iPad alloc] init] animated:NO];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [progress setFrame:CGRectMake((self.view.frame.size.width/2)-(progress.frame.size.width/2), 235+(self.view.frame.size.height/2)-(progress.frame.size.height/2), progress.frame.size.width, progress.frame.size.width)];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /*UIButton *playnow = [Common makeButton:@"playnow.png" left:135 top:366 action:@selector(playnow:) delegate:self];
    [background addSubview:playnow];
    
    UIButton *getchips = [Common makeButton:@"getchips.png" left:554 top:366 action:@selector(playnow:) delegate:self];
    [background addSubview:getchips];*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
