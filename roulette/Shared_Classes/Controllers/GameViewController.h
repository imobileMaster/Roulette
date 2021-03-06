//
//  GameViewController.h
//  roulette
//
//  Created by Greg Ellis on 2014-02-08.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "constants.h"
#import <UIView+Toast.h>
#import "Common.h"
#import "BButton.h"
#import <YLProgressBar/YLProgressBar.h>
#import <KGModal/KGModal.h>

#import "GameTable.h"
#import "Player.h"
#import "BetPlace.h"
#import "BlankBetPlace.h"
#import "Chip.h"
#import "TableBackground.h"

static const NSString *seatchip[4] = {
    @"place_chip.png",
    @"place_chip_blue.png",
    @"place_chip_red.png",
    @"place_chip_yellow.png"};

@interface GameViewController : UIViewController<AVAudioPlayerDelegate, UIScrollViewDelegate>{
    double initialbackgroundposition;
    
    //State variables
    double updatesPerSecond;
    double wheelBowlBallTrackPosition; //where ball is spun from
    double wheelSlotsYPosition; //where slots start
    double ballBounceMinY, ballBounceMaxY;
    
    double inwardspeed, inwardpos;
    int forcednumber;
    double angle_per_slice;
    BOOL bDropped, bSettled, bSpinWheelInfinite;
    
    double distancetoslots;
    TableBackground *background;
    UIImageView *header;
    UIImageView *wheelOutside, *wheelInside;
    NSTimer *wheelTimer;
    float wheelPosition, wheelSpeed;
    BOOL bBetsAllowed;
    
    //Ball variables
    double ball_deceleration_factor;
    UIView *ballParent;
    UIImageView *ball;
    NSTimer *ballTimer;
    float ballPosition, ballSpeed, ballHeight;
    BOOL ballIsBouncing;
    
    //Audio variables
    AVAudioPlayer *startBallEffect, *middleBallEffect, *stopBallEffect;
    AVAudioPlayer *ballBouncingEffect;
    AVAudioPlayer *voicePlayer, *chipDropPlayer;
    AVAudioPlayer *rifflingChipsPlayer, *winChipsPlayer;
    
    UIImageView *cradle;
    Chip *currentChip;
    float fingerOffsetForLongPress;
    CGPoint lastChipPosition;
    
    UIImageView *chip[5];
    int chip_selected_index;
    //history list labesl
    UILabel *historyLabel[13];
    UILabel* slotHighlight[49];
    
    BetPlace *places[157];
    BlankBetPlace *rebetplaces[157];
    
    UIScrollView *scrollView;
    
    UILabel *betLabel, *winLabel;
    UIImageView *player_seat[4];
    UILabel* player_seat_name[4];
    UILabel* player_seat_balance[4];
    UIImageView *balance;
    UILabel *bankroll;
    
    YLProgressBar *timeLeft;
    
    UILabel *timeLeftTillBonus;
    UIButton *btnClaimBonus;
    
    GameTable *g_gameTable;
    float fChipFontSize;
    
    BOOL bWasWaitingForNextRound;
}

-(void)sendChipsFrom:(CGPoint)from to:(CGPoint)to;
-(void)buy:(UIButton*)sender;
-(void)closeCashier:(UIButton*)sender;
-(void)showOutOfChipsAlert;

-(id)initWithGameTable:(GameTable*)table;
-(void)loadTableData:(BOOL)initialLoad;
-(void)loadTableData;
-(void)refreshTableData;
-(void)setAllowBets:(BOOL)allow;

-(float)getChipFontSize;

-(void)chipsPlaced:(NSNotification*)notification;
-(void)chipPlaced:(NSNotification*)notification;
-(void)addPlacedChip:(Chip*)placechip withInfo:(NSDictionary*)userInfo;

-(void)options:(BButton*)sender;
-(void)lobby:(BButton*)sender;
-(void)getchips:(BButton*)sender;


-(void)setSelectedChip:(int)index;
-(void)rePositionChipAfterLongPress;
-(void)fireLongPress;
-(void)fireLongPressWithOffset:(int)offset;
-(void)moveChipFromStackToView;

-(void)rememberBet;
-(void)spin:(UIButton*)sender;
-(void)clear:(UIButton*)sender;
-(void)rebet:(UIButton*)sender;

-(void)spinBallShouldLandOnNumber:(int)number;
-(void)initializeRoulettePositions;
-(void)updateHistoryList:(NSString*)strNumber;

-(void)playVoice:(NSString*)strVoice;
-(void)playChipDrop;
-(void)playRifflingChips;
-(void)playWinChips;
-(void)initializeAudio;

@end
