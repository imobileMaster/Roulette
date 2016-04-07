//
//  AppDelegate.h
//  roulette
//
//  Created by Greg Ellis on 2014-02-07.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <FacebookSDK/FacebookSDK.h>

#import "constants.h"
#import "Flurry.h"

#import "Chartboost.h"
#import <RevMobAds/RevMobAds.h>
#import "ALSdk.h"
#import "ALInterstitialAd.h"

#import "SocketIO.h"
#import "SocketIOPacket.h"

#import "RouletteServer.h"
#import "RouletteChip.h"

#import <SSKeychain/SSKeychain.h>

#define kServerTime @"serverTime"
#define kBettingTimeLeft @"bettingTimeLeft"
#define kStartSpin @"startSpin"
#define kPlaceYourBets @"placeYourBets"

#define kGameStateIdle @"idle"
#define kGameStateBetter @"betting"
#define kGameStateSpinning @"spinning"
#define kGameStatePLaying @"playing"

#define kPlayerLeft @"playerLeft"
#define kPlayerJoined @"playerJoined"
#define kChipPlaced @"chip_placed"
#define kChipsPlaced @"chips_placed"
#define kAllChipsCleared @"all_chips_cleared"
#define kChipsCleared @"chips_cleared"


#define UIAppDelegate \
((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <RouletteServerDelegate, FBLoginViewDelegate, SocketIODelegate, UIApplicationDelegate, AVAudioPlayerDelegate, RevMobAdsDelegate, ChartboostDelegate>{
    BOOL bAdsEnabled;
    SocketIO *socketIO;
    RouletteServer* server;
}
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error;
- (void) saveGameVariables;

-(void)setBankroll:(double)amount;

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, copy) NSString *g_facebookid;
@property (nonatomic, copy) NSString *g_fbname;
@property (nonatomic, copy) NSString *g_tablename;
@property (nonatomic, copy) NSString *g_strAvatarURL;
@property (nonatomic, assign) NSInteger g_seatindex;
@property (nonatomic, strong) UIImage *g_imgAvatar;

@property (nonatomic, strong) SocketIO *socketIO;

@end
