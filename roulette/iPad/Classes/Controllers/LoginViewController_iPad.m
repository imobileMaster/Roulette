//
//  LoginViewController_iPad.m
//  roulette
//
//  Created by Greg Ellis on 2014-06-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "LoginViewController_iPad.h"
#import "GameViewController_iPad.h"
#import "LobbyViewController_iPad.h"
#import "Common.h"
#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController_iPad ()

@end

@implementation LoginViewController_iPad

-(void)guestlogin:(id)sender{
    [super guestlogin:sender];
    
    [self.navigationController pushViewController:[[LobbyViewController_iPad alloc] init] animated:YES];
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
    
    UIButton *facebooklogin = [Common makeButton:@"facebooklogin.png" left:303 top:461 action:@selector(facebooklogin:) delegate:self];
    [background addSubview:facebooklogin];
    
    UIButton *guestlogin = [Common makeButton:@"guestlogin.png" left:303 top:640 action:@selector(guestlogin:) delegate:self];
    [background addSubview:guestlogin];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
