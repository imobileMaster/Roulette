//
//  LoginViewController_iPhone.m
//  roulette
//
//  Created by Greg Ellis on 2014-06-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "LoginViewController_iPhone.h"
#import "GameViewController_iPhone.h"
#import "LobbyViewController_iPhone.h"
#import "Common.h"
#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController_iPhone ()

@end

@implementation LoginViewController_iPhone

-(void)guestlogin:(id)sender{
    [super guestlogin:sender];
    
    [self.navigationController pushViewController:[[LobbyViewController_iPhone alloc] init] animated:NO];
    
     //[self.navigationController pushViewController:[[GameViewController_iPhone alloc] init] animated:YES];
}

-(void)facebookloggedin:(NSNotificationCenter*)notificationcenter{
    [super facebookloggedin:notificationcenter];
}

-(void)facebooklogin:(id)sender{
    [super facebooklogin:sender];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(!IS_IPHONE_5)
        [background setFrame:CGRectMake(-44, 0, background.frame.size.width, background.frame.size.height)];
    
    UIButton *facebooklogin = [Common makeButton:@"facebooklogin.png" left:185 top:175 action:@selector(facebooklogin:) delegate:self];
    [background addSubview:facebooklogin];
    
    UIButton *guestlogin = [Common makeButton:@"guestlogin.png" left:185 top:262 action:@selector(guestlogin:) delegate:self];
    [background addSubview:guestlogin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
