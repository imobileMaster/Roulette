//
//  AppDelegate_iPhone.m
//  roulette
//
//  Created by Greg Ellis on 2014-02-07.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "AppDelegate_iPhone.h"

@implementation AppDelegate_iPhone
@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL ret = [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    mainViewController = [[MainViewController_iPhone alloc] init];
    
    UINavigationController* navigationViewController = [[UINavigationController alloc] init];
    [navigationViewController setViewControllers:@[mainViewController] animated:NO];
    navigationViewController.navigationBarHidden = YES;
    
    
    [self.window setBackgroundColor:[UIColor blackColor]];
    [self.window setRootViewController:navigationViewController];
    
    //[bookmark showInView:navigationViewController.view atLocation:CGPointMake(800, 0)];
    //[bookmark setHidden:YES withAnimation:YES];
    
    return ret;
}


@end
