//
//  MainViewController.m
//  roulette
//
//  Created by Greg Ellis on 2014-02-07.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "Common.h"
#import "constants.h"
#import <SSKeychain/SSKeychain.h>


@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)playnow:(id)sender{

}

-(void)getchips:(id)sender{
    
}

-(void)facebookloggedin:(NSNotificationCenter*)notificationcenter{
    
    
}

-(void)facebookloggedout:(NSNotificationCenter*)notificationcenter{
    
    
}

-(void)login{
    
}

-(void)logout{
    
}

-(void)attemptlogin{
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"login" object:nil];
    }
    else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"logout" object:nil];
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    //[progress setFrame:CGRectMake((self.view.frame.size.width/2)-(progress.frame.size.width/2), 100+(self.view.frame.size.height/2)-(progress.frame.size.height/2), progress.frame.size.width, progress.frame.size.width)];

    //[progressBar setFrame:CGRectMake((self.view.frame.size.width/2)-(progressBar.frame.size.width/2), 100+(self.view.frame.size.height/2)-(progressBar.frame.size.height/2), progressBar.frame.size.width, progressBar.frame.size.height)];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(facebookloggedin:) name:@"FacebookLoggedIn" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(facebookloggedout:) name:@"FacebookLoggedOut" object:nil];
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(login) name:@"login" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout) name:@"logout" object:nil];

    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:KEY_CREDIT] == nil) {
        //nothing was there for this key
        //so this means this is first run
        
		mCredit = STARTUP_CREDIT;
        mHighScore = mCredit;
        mLastBonusAwarded = nil;
        
        [userDefaults setInteger:mCredit forKey:KEY_HIGHSCORE];
        [userDefaults setInteger:mCredit forKey:KEY_CREDIT];
        
        [SSKeychain setPassword:[NSString stringWithFormat:@"%d", mCredit] forService:@"roulettegold" account:UIAppDelegate.g_facebookid];
        
		mPaid = 0;
		bSoundOn = YES;
        bNotificationsOn = YES;
        bMusicOn = YES;
        bAdsEnabled = YES;
    }
    else{
        //there was an object to load up
        //all the game state variables
        
        mLastBonusAwarded = [userDefaults objectForKey:KEY_LASTBONUS_AWARDED];
		mCredit = (int)[userDefaults integerForKey:KEY_CREDIT];
        NSString *credits = [SSKeychain passwordForService:@"roulettegold" account:UIAppDelegate.g_facebookid];
        mCredit = [credits intValue];
        
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
    
    background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading.png"]];
    [background setUserInteractionEnabled:YES];
    [self.view addSubview:background];
    
    progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [background addSubview:progress];
    [progress startAnimating];
    
    [self performSelector:@selector(attemptlogin) withObject:nil afterDelay:1.0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
