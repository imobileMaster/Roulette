//
//  constants.h
//  roulette
//
//  Created by Greg Ellis on 2014-04-02.
//  Copyright (c) 2014 ellis. All rights reserved.
//
#define PLACE_COUNT 157
#define ARC4RANDOM_MAX 0x100000000

#define PLACES_RED 153
#define PLACES_BLACK 154
static int roulette_numbers[37] = {0,32,15,19,4,21,2,25,17,34,6,27,13,36,11,30,8,23,10,5,24,16,33,1,20,14,31,9,22,18,29,7,28,12,35,3,26};


//external vars
//these vars state is kept with NSUserDefaults
extern bool bAdsEnabled;
extern int  mPaid;
extern int  mBet;
extern int  mCredit;
extern bool bSoundOn;
extern bool bMusicOn;
extern bool bNotificationsOn;
extern int  mHighScore;
extern NSDate* mLastBonusAwarded;

//keys used for storing state in NSUserDefaults
#define STARTUP_CREDIT              1000
#define KEY_PAID                    @"Paid"
#define KEY_HIGHSCORE               @"HighScore"
#define KEY_BET                     @"Bet"
#define KEY_CREDIT                  @"Credit"
#define KEY_SOUND                   @"Sound"
#define KEY_NOTIFICATIONS           @"Notifications"
#define KEY_MUSIC                   @"Music"
#define KEY_ADSENABLED              @"AdsEnabled"
#define KEY_LASTBONUS_AWARDED       @"LastBonusAwarded"


#define FLURRY_APIKEY @"FKMWNZWS9P799YRJDZPY"

//In App Purchase definitions
//consumable
#define kIAP1 @"com.ellis.roulette.100_coins"
#define kIAP2 @"com.ellis.roulette.300_coins"
#define kIAP3 @"com.ellis.roulette.900_coins"
#define kIAP4 @"com.ellis.roulette.2100_coins"
#define kIAP5 @"com.ellis.roulette.9000_coins"
#define kIAP6 @"com.ellis.roulette.20000_coins"

//nonconsumable
#define kIAP7 @"com.ellis.videopokerpro.remove_ads"
#define kIAP8 @"com.ellis.videopokerpro.more_jackpots"


//Game Center Definitions
#define kGameCenterLeaderBoardID     @"com.ellis.roulette.leaderboard"
#define kGameCenterAchievement1      @"com.ellis.roulette.achievement_royalflush"
#define kGameCenterAchievement2      @"com.ellis.roulette.achievement_fouraces"
#define kGameCenterAchievement3      @"com.ellis.roulette.achievement_straightflush"
#define kGameCenterAchievement4      @"com.ellis.roulette.achievement_fourofakind"
#define kGameCenterAchievement5      @"com.ellis.roulette.achievement_fullhouse"
#define kGameCenterAchievement6      @"com.ellis.roulette.achievement_flush"
#define kGameCenterAchievement7      @"com.ellis.roulette.achievement_straight"
#define kGameCenterAchievement8      @"com.ellis.roulette.achievement_twopair"
#define kGameCenterAchievement9      @"com.ellis.roulette.achievement_jacksorbetter"


//Advertising and other APPID's
#define REVMOB_ID                    @"5217bfd17646e0f64d00000e"
#define CHARTBOOST_APPID             @"5217bff817ba470433000000"
#define CHARTBOOST_APPSIGNATURE      @"20c43e3960aaddb4a24e2e515b040dddd2e9ca8d"

#define ADMOB_ID                     @"ca-app-pub-7070435552868700/1781397079"

//Multiplayer Game Server
//URL or ipaddress of node.js multiplayer game server
#define ENABLE_MULTIPLAYER           1
#define MULTIPLAYER_GAMESERVER_HOST  @"http://192.168.1.1:8080"




