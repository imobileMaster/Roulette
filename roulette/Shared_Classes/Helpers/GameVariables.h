//
//  GameVariables.h
//  slotsvip
//
//  Created by Greg Ellis on 2013-07-09.
//  Copyright (c) 2013 ellis. All rights reserved.
//

extern int mPaid;
extern int mBet;
extern int mCredit;
extern bool bSoundOn;
extern bool bMusicOn;
extern bool bNotificationsOn;
extern int mHighScore;

extern bool bAdsEnabled;
extern bool bFirstSession;

#define ARC4RANDOM_MAX 0x100000000
//european
static int roulette_numbers[37] = {0,32,15,19,4,21,2,25,17,34,6,27,13,36,11,30,8,23,10,5,24,16,33,1,20,14,31,9,22,18,29,7,28,12,35,3,26};


#define kGameCenterLeaderBoardID                @"com.ellis.videopokerpro.leaderboard"
#define kGameCenterAchievement_royalflush       @"com.ellis.videopokerpro.achievement_royalflush"
#define kGameCenterAchievement_fouraces         @"com.ellis.videopokerpro.achievement_fouraces"
#define kGameCenterAchievement_straightflush    @"com.ellis.videopokerpro.achievement_straightflush"
#define kGameCenterAchievement_fourofakind      @"com.ellis.videopokerpro.achievement_fourofakind"
#define kGameCenterAchievement_fullhouse        @"com.ellis.videopokerpro.achievement_fullhouse"
#define kGameCenterAchievement_flush            @"com.ellis.videopokerpro.achievement_flush"
#define kGameCenterAchievement_straight         @"com.ellis.videopokerpro.achievement_straight"
#define kGameCenterAchievement_twopair          @"com.ellis.videopokerpro.achievement_twopair"
#define kGameCenterAchievement_jacksorbetter    @"com.ellis.videopokerpro.achievement_jacksorbetter"

#define REVMOB_ID                   @"5217bfd17646e0f64d00000e"
#define CHARTBOOST_APPID            @"5217bff817ba470433000000"
#define CHARTBOOST_APPSIGNATURE     @"20c43e3960aaddb4a24e2e515b040dddd2e9ca8d"

#define kRemoveAdsProduct           @"com.ellis.videopokerpro.remove_ads"
#define STARTUP_CREDIT              100
#define KEY_PAID                    @"Paid"
#define KEY_HIGHSCORE               @"HighScore"
#define KEY_BET                     @"Bet"
#define KEY_CREDIT                  @"Credit"
#define KEY_SOUND                   @"Sound"
#define KEY_NOTIFICATIONS           @"Notifications"
#define KEY_MUSIC                   @"Music"
#define KEY_ADSENABLED              @"AdsEnabled"
#define KEY_FIRSTSESSION            @"FirstSession"

#define MAX_BET                     5

