//
//  LoginViewController.m
//  roulette
//
//  Created by Greg Ellis on 2014-06-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Common.h"
#import "constants.h"
#import <FacebookSDK/FacebookSDK.h>

@interface LoginViewController ()

@end

@implementation LoginViewController



-(void)facebooklogin:(id)sender{
    if (FBSession.activeSession.state == FBSessionStateOpen
        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
        
        //already logged in so lets go
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FacebookLoggedIn" object:nil];
        
    } else {
        //We are not logged in so do it up
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile", @"email", @"user_location"]
                                           allowLoginUI:YES
                                      completionHandler:
         ^(FBSession *session, FBSessionState state, NSError *error) {
             
             // Retrieve the app delegate
             AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
             // Call the app delegate's sessionStateChanged:state:error method to handle session state changes
             [appDelegate sessionStateChanged:session state:state error:error];
             
         }];
    }
}

-(void)guestlogin:(id)sender{
    UIAppDelegate.g_strAvatarURL = nil;
    UIAppDelegate.g_imgAvatar = nil;
}

-(void)facebookloggedin:(NSNotificationCenter*)notificationcenter{
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(facebookloggedin:) name:@"FacebookLoggedIn" object:nil];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:KEY_CREDIT] == nil) {
        //nothing was there for this key
        //so this means this is first run
        
        mCredit = STARTUP_CREDIT;
        mHighScore = mCredit;
        
        [userDefaults setInteger:mCredit forKey:KEY_HIGHSCORE];
        [userDefaults setInteger:mCredit forKey:KEY_CREDIT];
        
        mPaid = 0;
        bSoundOn = YES;
        bNotificationsOn = YES;
        bMusicOn = YES;
        bAdsEnabled = YES;
    }
    else{
        //there was an object to load up
        //all the game state variables
        
        mCredit = (int)[userDefaults integerForKey:KEY_CREDIT];
        mHighScore = (int)[userDefaults integerForKey:KEY_HIGHSCORE];
        mPaid = (int)[userDefaults integerForKey:KEY_PAID];
        bSoundOn = [userDefaults boolForKey:KEY_SOUND];
        bNotificationsOn = [userDefaults boolForKey:KEY_NOTIFICATIONS];
        bMusicOn = [userDefaults boolForKey:KEY_MUSIC];
    }
    
    if ([userDefaults objectForKey:KEY_SOUND] == nil) {
        bSoundOn = YES;
        bNotificationsOn = YES;
        bMusicOn = YES;
    } else {
        bSoundOn = [userDefaults boolForKey:KEY_SOUND];
        bNotificationsOn = [userDefaults boolForKey:KEY_NOTIFICATIONS];
        bMusicOn = [userDefaults boolForKey:KEY_MUSIC];
    }
    
    if ([userDefaults objectForKey:KEY_ADSENABLED] == nil) {
        bAdsEnabled = YES;
    } else {
        bAdsEnabled = [userDefaults boolForKey:KEY_ADSENABLED];
    }
    
    //[Common cancelAllLocalNotifications];
    
    //if(bNotificationsOn)
       // [Common scheduleLocalNotification:nil message:@"Your FREE credits are waiting!"];
    
    NSLog(@"Loading... Credit %d, Paid %d, Sound %d", mCredit, mPaid, bSoundOn);
    NSLog(@"Ads Enabled is %@", bAdsEnabled?@"yes":@"no");
    
    background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginbackground.png"]];
    [background setUserInteractionEnabled:YES];
    [self.view addSubview:background];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
