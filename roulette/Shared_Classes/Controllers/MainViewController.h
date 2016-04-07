//
//  MainViewController.h
//  roulette
//
//  Created by Greg Ellis on 2014-02-07.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <YLProgressBar/YLProgressBar.h>
#import "GameViewController.h"

@interface MainViewController : UIViewController{
    UIImageView *background;
    UIActivityIndicatorView *progress;
}

-(void)facebookloggedin:(NSNotificationCenter*)notificationcenter;

-(void)playnow:(id)sender;
-(void)getchips:(id)sender;

-(void)login;
-(void)logout;

@end
