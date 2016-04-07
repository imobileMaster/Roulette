//
//  GameViewController.m
//  roulette
//
//  Created by Greg Ellis on 2014-02-08.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "AppDelegate.h"
#import "GameViewController.h"
#import "Common.h"
#import "TableBackground.h"
#import "UIImageView+WebCache.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <UIView+Toast.h>
#import "BlankChip.h"
#import <UIAlertView-Blocks/UIAlertView+Blocks.h>

#define LONG_PRESS_THRESHOLD 0.3

int low[5] = {2,5,10,20,50};
int med[5] = {20,50,100,200,500};
int high[5] = {200,500,1000,2000,5000};
int vip[5] = {2000,5000,10000,20000,50000};
int vipextreme[5] = {10000, 20000, 50000, 100000, 400000};

@interface GameViewController ()

@end

@implementation GameViewController

-(id)init{
    return [self initWithGameTable:nil];
}

-(void)buy:(UIButton*)sender{
    
}

-(void)closeCashier:(UIButton*)sender{
    [sender.superview removeFromSuperview];
    bBetsAllowed = YES;
}

-(void)showOutOfChipsAlert{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Uh Oh!" message:@"You don't have enough chips for this bet! Would you like to get more chips?" cancelButtonItem:[RIButtonItem itemWithLabel:@"No" action:^{
        
    }] otherButtonItems:[RIButtonItem itemWithLabel:@"Yes, Get Chips" action:^{
        [self getchips:nil];
    }], nil];
    
    [av show];
}



-(void)getchips:(BButton*)sender{
    
    bBetsAllowed = NO;
    
    
    //[[KGModal sharedInstance] showWithContentView:containerView andAnimated:YES];
}

-(void)options:(BButton*)sender{
   
}

-(void)lobby:(BButton*)sender{

    //[[self navigationController] popViewControllerAnimated:NO];
    
    /*[FBSession.activeSession closeAndClearTokenInformation];
    [[FBSession activeSession] close];
    [FBSession setActiveSession:nil];*/
    
    [self clearAllChips];
    
    
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"callback: %@", response);
    };
    
    [UIAppDelegate.socketIO sendEvent:@"leavetable" withData:nil andAcknowledge:cb];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    //transition.subtype = kCATransitionFromTop; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [[self navigationController] popViewControllerAnimated:NO];
}

-(void)clearSlotHighlights{
    for(int j=0; j<49; j++)
        slotHighlight[j].backgroundColor = [UIColor colorWithRed:0.0/255.0 green:120.0/255.0 blue:255.0/255.0 alpha:0.0];
}
-(void)playChipDrop{
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"chipdrop" ofType:@"mp3"]] error:nil];
    chipDropPlayer = newPlayer;
    
    chipDropPlayer.numberOfLoops = 0;
    chipDropPlayer.currentTime = 0;
    chipDropPlayer.volume = 1.0;
    [chipDropPlayer play];
}

-(void)playWinChips{
    NSString *voiceFilePath = [[NSBundle mainBundle] pathForResource:@"winchips" ofType:@"wav"];
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:voiceFilePath] error:nil];
    winChipsPlayer = newPlayer;
    
    winChipsPlayer.numberOfLoops = 0;
    winChipsPlayer.currentTime = 0;
    winChipsPlayer.volume = 0.5;
    [winChipsPlayer play];
}

-(void)playRifflingChips{
    NSString *voiceFilePath = [[NSBundle mainBundle] pathForResource:@"rifflingchips" ofType:@"wav"];
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:voiceFilePath] error:nil];
    rifflingChipsPlayer = newPlayer;
    
    rifflingChipsPlayer.numberOfLoops = -1;
    rifflingChipsPlayer.currentTime = 0;
    rifflingChipsPlayer.volume = 1.0;
    [rifflingChipsPlayer play];
}

-(void) playSound:(NSString*)strSound{
    //if(delegate.sound){
    NSString *voiceFilePath = [[NSBundle mainBundle] pathForResource:strSound ofType:@"mp3"];
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:voiceFilePath] error:nil];
    voicePlayer = newPlayer;
    
    voicePlayer.numberOfLoops = 0;
    voicePlayer.currentTime = 0;
    voicePlayer.volume = 1.0;
    [voicePlayer play];
    //}
}

-(void) playVoice:(NSString*)strVoice{
    //if(delegate.voice){
        NSString *voiceFilePath = [[NSBundle mainBundle] pathForResource:strVoice ofType:@"mp3"];
        AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:voiceFilePath] error:nil];
        voicePlayer = newPlayer;
        
        voicePlayer.numberOfLoops = 0;
        voicePlayer.currentTime = 0;
        voicePlayer.volume = 1.0;
        [voicePlayer play];
    //}
}

-(void)initializeAudio{
    NSString *soundEffectPath = [[NSBundle mainBundle] pathForResource:@"startball" ofType:@"mp3"];
    startBallEffect = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:soundEffectPath] error:nil];
    [startBallEffect setDelegate:self];
    
    startBallEffect.numberOfLoops = 0;
    startBallEffect.currentTime = 0;
    startBallEffect.volume = 1.0;
    
    [startBallEffect prepareToPlay];
    
    soundEffectPath = [[NSBundle mainBundle] pathForResource:@"middleball" ofType:@"mp3"];
    middleBallEffect = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:soundEffectPath] error:nil];
    [middleBallEffect setDelegate:self];
    
    middleBallEffect.numberOfLoops = -1;
    middleBallEffect.currentTime = 0;
    middleBallEffect.volume = 1.0;
    
    [middleBallEffect prepareToPlay];
    
    soundEffectPath = [[NSBundle mainBundle] pathForResource:@"stopball" ofType:@"mp3"];
    stopBallEffect = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:soundEffectPath] error:nil];
    [stopBallEffect setDelegate:self];
    
    stopBallEffect.numberOfLoops = 0;
    stopBallEffect.currentTime = 0;
    stopBallEffect.volume = 1.0;
    
    [stopBallEffect prepareToPlay];
    
    soundEffectPath = [[NSBundle mainBundle] pathForResource:@"ball_bouncing_extended" ofType:@"wav"];
    ballBouncingEffect = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:soundEffectPath] error:nil];
    [ballBouncingEffect setDelegate:self];
    
    ballBouncingEffect.numberOfLoops = -1;
    ballBouncingEffect.currentTime = 0;
    ballBouncingEffect.volume = 1.0;
    
    [ballBouncingEffect prepareToPlay];
}


-(int)getNumber{
    return roulette_numbers[[self getIndex]];
}

-(int)getIndex{
    double ballangle = (wheelPosition-ballPosition);
    if(ballangle<0.0f) ballangle+= 360.0f;
    int ballslot = (double)((ballangle)/(angle_per_slice));
    if(ballslot>36) ballslot = 0;
    
    //NSLog(@"ball angle: %f ball slot index: %d number: %d", ballangle, (int)ballslot, roulette_numbers[37-(ballslot+1)]);
    
    return (37-(ballslot+1));
}

//did we hit the forced number?
-(BOOL)hitForcedNumber{
    if(forcednumber==-1) return YES;
    
    return [self getNumber] == forcednumber;
}

-(void)flashHistoryLabel{
    [UIView animateWithDuration:0.8 delay:0.0f options:(UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat)
     animations:^{
         [UIView setAnimationRepeatCount:5];
         historyLabel[0].alpha=0.2f;
     } completion:^(BOOL finished){
         historyLabel[0].alpha=1.0f;
     }];
}

-(void)updateHistoryList:(NSString*)strNumber{
    //move all other numbers down one
    for(int i=12; i>0; i--){
        [historyLabel[i] setText:historyLabel[i-1].text];
        [historyLabel[i] setTextColor:historyLabel[i-1].textColor];
        [historyLabel[i] setTextAlignment:historyLabel[i-1].textAlignment];
    }
    
    if(![Common isEmpty:historyLabel[0]]){
        [historyLabel[0] setText:strNumber];
        if([strNumber isEqualToString:@"0"]){
            [historyLabel[0] setTextColor:[UIColor greenColor]];
            [historyLabel[0] setTextAlignment:NSTextAlignmentCenter];
        }
        else if([places[PLACES_RED].aryNumbers containsObject:[NSNumber numberWithInt:[strNumber intValue]]]){
            [historyLabel[0] setTextColor:[UIColor redColor]];
            [historyLabel[0] setTextAlignment:NSTextAlignmentRight];
        }
        else if([places[PLACES_BLACK].aryNumbers containsObject:[NSNumber numberWithInt:[strNumber intValue]]]){
            [historyLabel[0] setTextColor:[UIColor yellowColor]];
            [historyLabel[0] setTextAlignment:NSTextAlignmentLeft];
        }
        
        [historyLabel[0] setText:strNumber];
        [self flashHistoryLabel];
    }
}

-(void)clearLosingAnimStopped{
    //ship winnings and hide cradle
    [cradle setHidden:YES];
    
    NSMutableArray *chips = [[NSMutableArray alloc] init];
    
    BOOL bWon = NO;
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        if ([places[i].aryChips count] > 0) {
            bool bAvailable = false;
            for (int j = 0; j < [places[i].aryNumbers count]; j++) {
                if ([[places[i].aryNumbers objectAtIndex:j] intValue] == [self getNumber]) {
                    bAvailable = true;
                    bWon = YES;
                }
            }
            if (!bAvailable) {
                
                
                NSMutableIndexSet *toRemove = [[NSMutableIndexSet alloc] init];
                //clear chips
                for(int j=0; j<[places[i].aryChips count]; j++){
                    Chip *thischip = [places[i].aryChips objectAtIndex:j];
                    NSMutableDictionary *c = [NSMutableDictionary dictionary];
                    [c setObject:[NSNumber numberWithInt:i] forKey:@"place"];
                    [c setObject:[NSNumber numberWithInt:(int)UIAppDelegate.g_seatindex] forKey:@"playerseat"];
                    [c setObject:[NSNumber numberWithDouble:thischip.value] forKey:@"value"];
                    
                    [chips addObject:c];
                    
                    [thischip removeFromSuperview];
                    [toRemove addIndex:j];
                }
                [places[i].aryChips removeObjectsAtIndexes:toRemove];
            }
        }
    }
    
    SocketIOCallback cccb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"place callback: %@", response);
        if(![Common isEmpty:response]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if(json){
                
            }
        }
    };
    
    NSMutableDictionary *chipsdict = [NSMutableDictionary dictionary];
    [chipsdict setObject:chips forKey:@"chips"];
    
    [UIAppDelegate.socketIO sendEvent:@"clearchips" withData:chipsdict andAcknowledge:cccb];
    
    
    if(bWon){
        [self playWinChips];
    }
    
    //update with win if applicable
    [bankroll setText:[NSString stringWithFormat:@"$%d", mCredit]];
    

    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"callback: %@", response);
    };
    
    if([g_gameTable.players count]>1){
        [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
        [SVProgressHUD setRingThickness:8];
        [SVProgressHUD showWithStatus:@"Waiting for other players..."];
    }
    
    [UIAppDelegate.socketIO sendEvent:@"spinfinish" withData:nil andAcknowledge:cb];
    
    //[self playSound:@"placeyourbets"];
}

-(void)removeChipsFromTable{
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        if ([places[i].aryChips count] > 0) {
            NSMutableIndexSet *toRemove = [[NSMutableIndexSet alloc] init];
            for(int x=0; x<[places[i].aryChips count]; x++){
                Chip* ch = [places[i].aryChips objectAtIndex:x];
                if(ch.seatindex == UIAppDelegate.g_seatindex){
                    [[places[i].aryChips objectAtIndex:x] removeFromSuperview];
                    [toRemove addIndex:x];
                }
            }
            [places[i].aryChips removeObjectsAtIndexes:toRemove];
        }
    }
}

-(void)clearAllAnimStopped{
    [self removeChipsFromTable];
    
     [background setUserInteractionEnabled:YES];
}

-(void)clearAllChipsAnimated:(BOOL)animated{
    if(!bBetsAllowed) return;
    
    if(animated){
        [background setUserInteractionEnabled:NO];
        [UIView beginAnimations:@"CLEARALLCHIPS" context:nil];
        [UIView setAnimationDuration:1.0f];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(clearAllAnimStopped)];
    }
    
    double total = 0.0f;
    BOOL bWasChips = true;
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        if ([places[i].aryChips count] > 0) {
            for(int x=0; x<[places[i].aryChips count]; x++){
                
                Chip* c = (Chip *)[places[i].aryChips objectAtIndex:x];
                if(c.seatindex == UIAppDelegate.g_seatindex){
                    if(animated) [c setCenter:CGPointMake(0, -50)];
                    total += c.value;
                }
                
            }
            bWasChips = true;
        }
    }
    
    if(animated) [UIView commitAnimations];
    
    if(bWasChips){
        if(animated)
            [self playSound:@"clearchips"];
        else
            [self removeChipsFromTable];
        
        SocketIOCallback cb = ^(id argsData) {
            NSDictionary *response = argsData;
            // do something with response
            NSLog(@"clearallchips callback: %@", response);
            if(![Common isEmpty:response]){
                NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
            }
        };
        
        //NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        //[dict setObject:[NSNumber numberWithInt:(int)UIAppDelegate.g_seatindex] forKey:@"index"];
        
        [UIAppDelegate.socketIO sendEvent:@"clearallchips" withData:nil andAcknowledge:cb];
    }
    
    mCredit = mCredit + total;
    [UIAppDelegate setBankroll:(double)mCredit];
    [bankroll setText:[NSString stringWithFormat:@"$%d", mCredit]];
    
}

-(void)clearAllChips{
    
    [self clearAllChipsAnimated:YES];
    
}

-(void)clearLosingChips{
    
    [UIView beginAnimations:@"CLEARLOSINGCHIPS" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(clearLosingAnimStopped)];
    
    BOOL bWasLosingChips = false;
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        if ([places[i].aryChips count] > 0) {
            bool bAvailable = false;
            for (int j = 0; j < [places[i].aryNumbers count]; j++) {
                if ([[places[i].aryNumbers objectAtIndex:j] intValue] == [self getNumber]) {
                    bAvailable = true;
                }
            }
            if (!bAvailable) {
                //clear chips
                for(int j=0; j<[places[i].aryChips count]; j++){
                    Chip* c = (Chip *)[places[i].aryChips objectAtIndex:j];
                    [c setCenter:CGPointMake(0, -50)];
                }
                
                bWasLosingChips = true;
            }
        }
    }
    
    [UIView commitAnimations];
    
    if(bWasLosingChips)
        [self playSound:@"clearchips"];
    
}
-(void)clearChips{
    [self clearAllChips];
}

-(void)showCradleStopped{
    [self performSelector:@selector(clearLosingChips) withObject:nil afterDelay:2.0f];
}

-(void)placeMarker:(NSString*)number{
    [cradle setHidden:NO];
    cradle.layer.zPosition = 1;
    
    [cradle setCenter:CGPointMake(-50, -50)];
    CGPoint pos = CGPointMake((slotHighlight[[number intValue]].frame.origin.x-(cradle.frame.size.width/2))+(slotHighlight[[number intValue]].frame.size.width/2), (slotHighlight[[number intValue]].frame.origin.y-(cradle.frame.size.height/2))+(slotHighlight[[number intValue]].frame.size.height/2));

    [UIView beginAnimations: @"SHOWCRADLE" context: nil];
    [UIView setAnimationDuration: 1.0f];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDidStopSelector:@selector(showCradleStopped)];
    [cradle setFrame:CGRectMake(pos.x, pos.y, cradle.frame.size.width, cradle.frame.size.height)];
    [UIView commitAnimations];
    
    //
    //cradle.layer.zPosition = 1;
}

-(float) getPayout
{
    float fGet = 0.0f;
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        if ([places[i].aryChips count] > 0) {
            bool bAvailable = false;
            for (int j = 0; j < [places[i].aryNumbers count]; j++) {
                if ([[places[i].aryNumbers objectAtIndex:j] intValue] == [self getNumber]) {
                    bAvailable = true;
                    
                    break;
                }
            }
            if (bAvailable) {
                int numberCount = winningSlots[places[i].type];
                //int numberChips = [places[i].aryChips count];
                //float fChipValue = 10.0f;
                
                float value = 0.0f;
                for (Chip* ch in places[i].aryChips) {
                    if(ch.seatindex == UIAppDelegate.g_seatindex)
                        value += ch.value;
                }
                
                //NSLog(@"NUMBER CHIPS: %d", numberChips);
                fGet += ((float)((36.0f-numberCount)/numberCount)*(/*fChipValue*numberChips*/value));
                //NSLog(@"formula: ((36.0-%d)/%d) = %f)", numberCount, numberCount, ((float)((36.0f-numberCount)/numberCount)*(fChipValue*numberChips)));
                NSLog(@"GET : %f" , fGet);
                
                
                
                mCredit = mCredit + fGet;
                [UIAppDelegate setBankroll:(double)mCredit];
                
            }
        }
    }
    return fGet;
}

//determine what slot we landed in
-(void)determineSlot{
    NSString *strNumber = [NSString stringWithFormat:@"%d", roulette_numbers[[self getIndex]]];
    [self updateHistoryList:strNumber];
    [self performSelector:@selector(playVoice:) withObject:strNumber afterDelay:1.5f];
    [self performSelector:@selector(placeMarker:) withObject:strNumber afterDelay:4.0f];
    //[self.view.window makeToast:strNumber duration:3.0f position:@"center"];
    [self getPayout];
}

//make sure ball is centered in the slot it landed in
-(void)centerBallInSlot{
    double angle = ([self getIndex] * angle_per_slice)+(angle_per_slice*0.75f)+wheelPosition;
    if(angle>360.0f) angle -= 360.0f;
    ballPosition = angle;
    ballParent.transform = CGAffineTransformMakeRotation(ballPosition*(M_PI/180));
    
    //NSLog(@"index %d number:%d angle:%f", [self getIndex], [self getNumber], angle);
}

-(void)updateWheel:(NSTimer*)timerObject{
    
    //move wheel by wheel speed
    wheelInside.transform = CGAffineTransformMakeRotation(wheelPosition*(M_PI/180));
    wheelPosition -= wheelSpeed;
    if(wheelPosition <0.0f) wheelPosition = 360.0f;
    
    
    if(ballSpeed <= 0.0f && !ballTimer && ![self hitForcedNumber]){
        
    }
    else if(bDropped && bSettled && !ballTimer && [self hitForcedNumber]){
        ballPosition -= wheelSpeed;
        if(ballPosition <=0.0f) ballPosition = 360.0f;
        ballParent.transform = CGAffineTransformMakeRotation(ballPosition*(M_PI/180));
    }
    
    //slow down wheel if enabled
    if(bDropped && bSettled && !bSpinWheelInfinite)
        wheelSpeed -= 0.0007f;
    
    if(wheelSpeed <= 0.0f && !bSpinWheelInfinite){
        [wheelTimer invalidate];
        
        bDropped = NO;
        [self determineSlot];
    }
}

-(void)startBouncingBall{
    [ballBouncingEffect play];
    
    if((arc4random()%8) == 4){
        double val = ((double)arc4random() / ARC4RANDOM_MAX)* (ballBounceMaxY - ballBounceMinY)+ ballBounceMinY;
        inwardpos = val;
        [ball setFrame:CGRectMake(ball.frame.origin.x, inwardpos, ball.frame.size.width, ball.frame.size.height)];
    }
}

-(void)stopBall{
    [ballBouncingEffect stop];
    [ballBouncingEffect setCurrentTime:0.0];
    [ballBouncingEffect prepareToPlay];
    
    ballSpeed = 0.0f;
    bSettled = bDropped = YES;
    
    [ballBouncingEffect stop];
    [ball setFrame:CGRectMake(ball.frame.origin.x, wheelSlotsYPosition-ballHeight, ball.frame.size.width, ball.frame.size.height)];
    
    [ballTimer invalidate];
    ballTimer = nil;
    
    [self performSelectorInBackground:@selector(playStopEffects) withObject:nil];
    
    [self determineSlot];
    [self centerBallInSlot];
    
    
    [UIView animateWithDuration:1.0f delay:3.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if(scrollView)
            [scrollView setFrame:CGRectMake(initialbackgroundposition, scrollView.frame.origin.y, scrollView.frame.size.width, scrollView.frame.size.height)];
        else
            [background setFrame:CGRectMake(initialbackgroundposition, background.frame.origin.y, background.frame.size.width, background.frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)updateBall:(NSTimer*)timerObject{
    
    ballParent.transform = CGAffineTransformMakeRotation(ballPosition*(M_PI/180));
    ballPosition += ballSpeed;
    if(ballPosition >360.0f) ballPosition = 0.0f;
    
    //move ball inward as we spin
    if(inwardpos > (wheelSlotsYPosition-ballHeight)){
        inwardpos -= inwardspeed;
        [ball setFrame:CGRectMake(ball.frame.origin.x, inwardpos, ball.frame.size.width, ball.frame.size.height)];
    }
    
    ballSpeed -= ball_deceleration_factor;
    
    //if we are just going random then wait until
    //we are below a certain speed to start jumping
    //the ball around
    if(forcednumber==-1 && ballSpeed <= 0.35f){
        [self startBouncingBall];
    }
    
    if(((ballSpeed <= 0.0f || bDropped) && forcednumber==-1) || ((ballSpeed <= 0.4f || bDropped) && forcednumber!= -1)){
        
        if(![self hitForcedNumber]){
            //ok not done yet until we hit our forced
            ///number that was chosen by whatever
            [self startBouncingBall];
            bDropped = YES;
            bSettled = NO;
            
            double speeds[5] = {0.6f, 0.9f, 0.4f, 0.3f, 0.6f};
            ballSpeed = speeds[arc4random()%5];
        }
        else{
            [self stopBall];
        }
    }
}

-(void)playStopEffects{
    [stopBallEffect play];
    
    [middleBallEffect stop];
    [startBallEffect stop];
    
    [startBallEffect prepareToPlay];
    [middleBallEffect prepareToPlay];
}

-(void)playStartSpinEffects{
    [startBallEffect play];
    [middleBallEffect play];
}

-(void)spinBall{
    [self spinBallShouldLandOnNumber:-1]; //-1 means it will fall on random slot
}

//this method is useful if you want to one day make this game
//multiplayer. You will then need to generate a random slot number
//from the server and have all the clients connected to that table
//spin to that same slot number. This method allows you to do that
-(void)spinBallShouldLandOnNumber:(int)number{
    
    [self rememberBet];
    
    [UIView animateWithDuration:1.0f delay:0.1f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if(scrollView)
            [scrollView setFrame:CGRectMake(0, scrollView.frame.origin.y, scrollView.frame.size.width, scrollView.frame.size.height)];
        else
            [background setFrame:CGRectMake(0, background.frame.origin.y, background.frame.size.width, background.frame.size.height)];
    } completion:^(BOOL finished) {
        //play the spinning sounds
        [self performSelectorInBackground:@selector(playStartSpinEffects) withObject:nil];
        
        //force a number here 0-36
        //or use -1 for random number
        forcednumber = number;
        
        //start spinning wheel (if not already spinning)
        [self startWheel:nil];
        
        if(!ballTimer)
            ballTimer = [NSTimer scheduledTimerWithTimeInterval:0.05f/7.5f target:self selector:@selector(updateBall:) userInfo:nil repeats:YES];
    }];
    
}

-(void)startWheel:(UIButton*)sender{
    
    //spin ball from zero position
    [self initializeBallPosition];
    
    
    if(!bSpinWheelInfinite){
        if(wheelTimer){
            [wheelTimer invalidate];
            wheelTimer = nil;
        }
        
        bDropped = bSettled = NO;
        
        wheelSpeed = 0.4f;
        wheelTimer = [NSTimer scheduledTimerWithTimeInterval:updatesPerSecond target:self selector:@selector(updateWheel:) userInfo:nil repeats:YES];
    }
}

-(void)stopWheel:(UIButton*)sender{
    //start turning wheel
    bDropped =YES;
}

-(void)spin:(UIButton*)sender{
    [self spinBallShouldLandOnNumber:-1];
}

-(void)clear:(UIButton*)sender{
    [self clearChips];
}

-(void)rememberBet{
    for(int i=0; i<PLACE_COUNT; i++){
        [rebetplaces[i].aryChips removeAllObjects];
        for(int x=0; x<[places[i].aryChips count]; x++){
            
            if(((Chip*)[places[i].aryChips objectAtIndex:x]).seatindex == UIAppDelegate.g_seatindex){
                NSInteger seatindex = ((Chip*)[places[i].aryChips objectAtIndex:x]).seatindex;
                double value = ((Chip*)[places[i].aryChips objectAtIndex:x]).value;
                BlankChip *blankchip = [[BlankChip alloc] init];
                blankchip.seatindex = seatindex;
                blankchip.value = value;
                [rebetplaces[i].aryChips addObject:blankchip];
            }
        }
    }
}

-(void)rebet:(UIButton*)sender{

    double t = 0.0f;
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        if ([rebetplaces[i].aryChips count] > 0) {
            for(int x=0; x<[rebetplaces[i].aryChips count]; x++){
                BlankChip* ch = [rebetplaces[i].aryChips objectAtIndex:x];
                if(ch.seatindex == UIAppDelegate.g_seatindex){
                    t += ch.value;
                }
            }
        }
    }
    if((mCredit-t) <0){
        [self showOutOfChipsAlert];
        return;
    }
    
    
    [self clearAllChipsAnimated:NO];
    
    NSMutableArray *chips = [[NSMutableArray alloc] init];

    
    //now lets reload what we remembered from last time
    double total = 0.0f;
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        int place = i;
        if ([rebetplaces[i].aryChips count] > 0) {
            for(int x=0; x<[rebetplaces[i].aryChips count]; x++){
                BlankChip* ch = [rebetplaces[i].aryChips objectAtIndex:x];
                if(ch.seatindex == UIAppDelegate.g_seatindex){
                    total += ch.value;
                    
                    Chip *placechip = [Common makeChipWithSeatIndex:ch.seatindex andImage:(NSString*)seatchip[ch.seatindex] left:0 top:0];
                    [placechip setChipValue:ch.value];
                    
                    [placechip.text setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:[self getChipFontSize]]];
                    
                    [background addSubview:placechip];
                    [background sendSubviewToBack:placechip];
                    
                    CGPoint center = CGPointMake(places[place].rect.origin.x+(places[place].rect.size.width/2), places[place].rect.origin.y+(places[place].rect.size.height/2));
                    int x = center.x-(placechip.image.size.width/2);
                    int y = center.y-(placechip.image.size.height/2);
                    [placechip setFrame:CGRectMake(x, y, placechip.image.size.width, placechip.image.size.height)];
                    
                    
                    
                    [places[place].aryChips addObject:placechip];
                    
                    NSMutableDictionary *c = [NSMutableDictionary dictionary];
                    [c setObject:[NSNumber numberWithInt:i] forKey:@"place"];
                    [c setObject:[NSNumber numberWithInt:(int)UIAppDelegate.g_seatindex] forKey:@"playerseat"];
                    [c setObject:[NSNumber numberWithDouble:placechip.value] forKey:@"value"];
                    
                    [chips addObject:c];
                    
                    //[places[i].aryChips addObject:ch];
                    //[background addSubview:ch];
                }
            }
        }
        
        double total = 0.0f;
        for (Chip* ch in places[place].aryChips) {
            if(ch.seatindex == UIAppDelegate.g_seatindex){
                total += ch.value;
                //ch.text.text = [NSString stringWithFormat:@"%@", [Common convertToCurrencyShort:total]];
            }
        }
        
        for (Chip* ch in places[place].aryChips) {
            if(ch.seatindex == UIAppDelegate.g_seatindex){
                //total += ch.value;
                ch.text.text = [NSString stringWithFormat:@"%@", [Common convertToCurrencyShort:total]];
            }
        }
    }
    
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"place callback: %@", response);
        if(![Common isEmpty:response]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if(json){
                
            }
        }
    };
    
    NSMutableDictionary *chipsdict = [NSMutableDictionary dictionary];
    [chipsdict setObject:chips forKey:@"chips"];

    [UIAppDelegate.socketIO sendEvent:@"placechips" withData:chipsdict andAcknowledge:cb];
    
    
    mCredit = mCredit - total;
    [UIAppDelegate setBankroll:(double)mCredit];
    
    [bankroll setText:[NSString stringWithFormat:@"$%d", mCredit]];
}

-(void)moveChipFromStackToView{
    Chip *placechip = [Common makeChipWithSeatIndex:UIAppDelegate.g_seatindex andImage:(NSString*)seatchip[UIAppDelegate.g_seatindex] left:chip[0].frame.origin.x top:chip[0].frame.origin.y];
    [placechip setChipValue:chip[chip_selected_index].tag];

    [background addSubview:placechip];
    
    if(currentChip != nil){
       [currentChip removeFromSuperview];
        currentChip = nil;
    }
    
    currentChip = placechip;
}
-(void)updateChipPosition:(CGPoint)location{
    if(currentChip){
        currentChip.layer.zPosition = 0;
        [currentChip setFrame:CGRectMake(location.x-(currentChip.frame.size.width/2), location.y/*-35*/, currentChip.frame.size.width, currentChip.frame.size.height)];
        //DLog(@"updating chip position %f, %f", location.x, location.y);
    }
    //DLog(@"updating chip position %f, %f", location.x, location.y);
}


-(void)initializeBallPosition{
    bDropped = bSettled = NO;
    ballPosition = 0.0f;
    ballParent.transform = CGAffineTransformMakeRotation(ballPosition*(M_PI/180));
    
    //pick a random ball speed, but ensure that the ball goes around the bowl
    //at least three times as this is the rule for a spin to valid in roulette :)
    ballSpeed = ((double)arc4random() / ARC4RANDOM_MAX)* (2.6f - 1.5f)+ 1.5f;
    NSLog(@"ballspeed: %f", ballSpeed);
    
    //initialize the ball position so that it starts on the outside
    inwardpos = wheelBowlBallTrackPosition-ballHeight;
    
    //calculate how long it will take the ball to go from the outside of the bowl
    //to the inside of the bowl
    double timetofinish = (ballSpeed/ball_deceleration_factor) * updatesPerSecond;
    
    NSLog(@"timetofinish: %f callspersec: %f", timetofinish, updatesPerSecond);
    
    //calculate the speed at which we need to move the ball inward
    //in order to ensure that the ball
    double speed = distancetoslots/(timetofinish/updatesPerSecond);
    NSLog(@"inwardspeed: %f", speed);
    //662-530 = 132
    inwardspeed = speed;
}

-(void)highlightWinningSlots:(CGPoint)location{
    
    //make sure we check relative to center of chip
    location.y = location.y + (currentChip.frame.size.height/2);
     //location.x = location.x + (currentChip.frame.size.width/2);
    
    for(int i=0; i<PLACE_COUNT; i++){
        if(CGRectContainsPoint(places[i].rect, location)){
            for(int x=0; x<[places[i].aryNumbers count]; x++){
                int number = [[places[i].aryNumbers objectAtIndex:x] intValue];
                if(number >= 0)
                    slotHighlight[number].backgroundColor = [UIColor colorWithRed:0.0/255.0 green:120.0/255.0 blue:255.0/255.0 alpha:0.5];
            }
            //NSString *betType[17] = {@"Straight",@"Split",@"Street",@"Corner",@"Five Line",@"Six Line",@"Column",@"Dozen",@"Even",@"Trio",@"Basket",@"Low",@"High",@"Red",@"Black",@"Odd",@"None"};

            //NSLog(@"inside (%@)", betType[places[i].type]);
            break;
        }
    }
}

-(void)initializeWheelPosition{
    wheelPosition = 360.0f; //in degrees
    wheelInside.transform = CGAffineTransformMakeRotation(wheelPosition*(M_PI/180)); //rotate wheel to this position
    wheelSpeed = 0.4f;
}

-(void)initializeRoulettePositions{
    [self initializeWheelPosition];
    [self initializeBallPosition];
    
    if(bSpinWheelInfinite){
        if(wheelTimer){
            [wheelTimer invalidate];
            wheelTimer = nil;
        }
        
        bDropped = bSettled = NO;
        
        wheelSpeed = 0.4f;
        wheelTimer = [NSTimer scheduledTimerWithTimeInterval:updatesPerSecond target:self selector:@selector(updateWheel:) userInfo:nil repeats:YES];
    }
}

-(void)dropChipAtLocation:(CGPoint)location{

    
    if(currentChip){
        
        //make sure we check relative to center of chip
        if(fingerOffsetForLongPress>0)
            location.y = location.y + (currentChip.frame.size.height/2);
        //location.x = location.x + (currentChip.frame.size.width/2);
        //[chipselect setFrame:CGRectMake(location.x-(chipselect.frame.size.width/2), location.y-35, chipselect.frame.size.width, chipselect.frame.size.height)];

        
        BOOL bDroppedInPlace = NO;
        for(int i=0; i<PLACE_COUNT; i++){
            if(CGRectContainsPoint(places[i].rect, location)){
                
                if((mCredit-currentChip.value) <0.0f){
                    [self showOutOfChipsAlert];
                }
                else{
                
                    BOOL bCenter = YES;
                    
                    float y = 0.0f;
                    if(bCenter){
                        CGPoint center = CGPointMake(places[i].rect.origin.x+(places[i].rect.size.width/2), places[i].rect.origin.y+(places[i].rect.size.height/2));
                        if(/*enable stacking*/0==1)
                            center.y = center.y - ([places[i].aryChips count]*1);
                        
                        y = center.y;
                        
                        
                        int x = center.x-(currentChip.image.size.width/2);
                        int y = center.y-(currentChip.image.size.height/2);
                        [currentChip setFrame:CGRectMake(x, y, currentChip.image.size.width, currentChip.image.size.height)];
                        

                        
                        [places[i].aryChips addObject:currentChip];
                        
                        //NSInteger value = [[places[i].totalvalue objectForKey:[NSString stringWithFormat:@"seat_%d", UIAppDelegate.g_seatindex]] integerValue];
                        //[places[i].totalvalue setObject:[NSNumber numberWithDouble:(value+currentChip.value)] forKey:[NSString stringWithFormat:@"seat_%d", UIAppDelegate.g_seatindex]];
                            
                       
                        
                        
                        mCredit = mCredit - currentChip.value;
                        [UIAppDelegate setBankroll:(double)mCredit];
                        [bankroll setText:[NSString stringWithFormat:@"$%d", mCredit]];
                        
                        SocketIOCallback cb = ^(id argsData) {
                            NSDictionary *response = argsData;
                            // do something with response
                            NSLog(@"place callback: %@", response);
                            if(![Common isEmpty:response]){
                                NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
                                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                
                                if(json){
                                   
                                }
                            }
                        };
                        
                        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                        [dict setObject:[NSNumber numberWithInt:i] forKey:@"index"];
                        [dict setObject:[NSNumber numberWithDouble:currentChip.value] forKey:@"value"];
                        
                        [UIAppDelegate.socketIO sendEvent:@"placechip" withData:dict andAcknowledge:cb];
                        
                        
                        currentChip = nil;
                        bDroppedInPlace = YES;
                        [self playChipDrop];
                        
                        //update top chip total with total value
                        double total = 0.0f;
                        for (Chip* ch in places[i].aryChips) {
                            if(ch.seatindex == UIAppDelegate.g_seatindex){
                                total += ch.value;
                                ch.text.text = [NSString stringWithFormat:@"%@", [Common convertToCurrencyShort:total]];
                            }
                        }
                        
                        

                        break;
                    }
                }
            }
        }
        
        if(!bDroppedInPlace){
            [currentChip removeFromSuperview];
            currentChip = nil;
        }
    }
}

-(void)rePositionChipAfterLongPress{
    if(!CGPointEqualToPoint(lastChipPosition, CGPointZero))
    {
        lastChipPosition.y -= fingerOffsetForLongPress;
        [self clearSlotHighlights];
        [self updateChipPosition:lastChipPosition];
        [self highlightWinningSlots:lastChipPosition];
    }
}

- (void)fireLongPress {

    
}

- (void)fireLongPressWithOffset:(int)offset {
    if(!bBetsAllowed) return;
    
    fingerOffsetForLongPress = offset;
    [self rePositionChipAfterLongPress];
    NSLog(@"longpress offset: %f", fingerOffsetForLongPress);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(!bBetsAllowed) return;
    
    UITouch *theTouch = [touches anyObject];
    CGPoint location = [theTouch locationInView:background];
    lastChipPosition = location;
    
    CGPoint loc = [theTouch locationInView:self.view];
    if(CGRectContainsPoint(header.frame, loc))
        return;
    
    
    location.y -= fingerOffsetForLongPress;
    
    BOOL bHitChip = NO;
    for(int i=0; i<5; i++){
        if(CGRectContainsPoint(chip[i].frame, location)){
            [self setSelectedChip:i];
            bHitChip = YES;
            NSLog(@"hit chip %d", i);
            break;
        }
    }
    
    if(!bHitChip){
        [self moveChipFromStackToView];
        [self updateChipPosition:location];
        
        [self clearSlotHighlights];
        [self highlightWinningSlots:location];
    }
    
    [self performSelector:@selector(fireLongPress) withObject:nil afterDelay:LONG_PRESS_THRESHOLD];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(!bBetsAllowed) return;
    
    UITouch *theTouch = [touches anyObject];
    CGPoint location = [theTouch locationInView:background];
    
     location.y -= fingerOffsetForLongPress;
    
    [self clearSlotHighlights];
    [self dropChipAtLocation:location];
    
    fingerOffsetForLongPress = 0.0f;
    lastChipPosition = CGPointZero;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if(!bBetsAllowed) return;
    
    UITouch *theTouch = [touches anyObject];
    CGPoint location = [theTouch locationInView:background];
    lastChipPosition = location;
    
    location.y -= fingerOffsetForLongPress;
    [self clearSlotHighlights];
    
    [self updateChipPosition:location];
    [self highlightWinningSlots:location];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    if(!bBetsAllowed) return;
    
    fingerOffsetForLongPress = 0.0f;
    lastChipPosition = CGPointZero;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self clearSlotHighlights];
}

-(void)setSelectedChip:(int)index{
    for(int i=0; i<5; i++)
        chip[i].layer.shadowOpacity = 0.0f;
        
    chip[index].layer.shadowColor = [UIColor yellowColor].CGColor;
    chip[index].layer.shadowOpacity = 1.0f;
    chip[index].layer.shadowRadius = 3.0f;
    chip[index].layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    chip[index].layer.masksToBounds = NO;
    
    chip_selected_index = index;
}

-(void)serverTime:(NSNotification*)notification{
    NSDictionary* userInfo = notification.userInfo;
    NSDate* datetime = [userInfo objectForKey:@"datetime"];
    
    NSDate *awardBonusTime = [Common addHours:1 toDate:datetime];
    //if we are past or equal to award time award it
    /*if(!([datetime compare:awardBonusTime] == NSOrderedAscending)){
        NSLog(@"they can have award");
        [timeLeftTillBonus setText:@"CLAIM!"];
    }
    else{*/
    double minutes = [Common secondsBetween:datetime and:mLastBonusAwarded]/60.0f;
    double timetillbonus = (1.0f*60.0f)-minutes;
    if(timetillbonus<=0){
        NSLog(@"they can have award");
        [timeLeftTillBonus setText:@"claim!"];
        //[[NSUserDefaults standardUserDefaults] setObject:datetime forKey:KEY_LASTBONUS_AWARDED];
        //[[NSUserDefaults standardUserDefaults] synchronize];
    }
    else{
    NSLog(@"timelefttill %@",  [Common timeFormatted:(timetillbonus*60.f)]);
        
        if(timeLeftTillBonus){
            [timeLeftTillBonus setText:[Common timeFormatted:(timetillbonus*60.f)]];
        }
    }
    //}
}

-(void)timeLeft:(NSNotification*)notification{
    NSDictionary* userInfo = notification.userInfo;
    double progress = [[userInfo objectForKey:@"percentLeft"] doubleValue]/100.0f;
    

    [timeLeft setProgress:progress animated:YES];
}

-(void)placeYourBets:(NSNotification*)notification{
    [self setAllowBets:YES];
    
    //if([SVProgressHUD isVisible])
    {
        
        [self refreshTableData];
        if(bWasWaitingForNextRound){
            SocketIOCallback cb = ^(id argsData) {
                NSDictionary *response = argsData;
                // do something with response
                NSLog(@"tbale chpis callback: %@", response);
            };
            
            [UIAppDelegate.socketIO sendEvent:@"gettablechips" withData:nil andAcknowledge:cb];
        }
        [SVProgressHUD dismiss];
        bWasWaitingForNextRound = NO;
    }
    
    [self.view makeToast:@"Place Your Bets" duration:1.5 position:CSToastPositionCenter title:@"Roulette Dealer" image:[UIImage imageNamed:@"dealerimage.png"]];
    
    [self playSound:@"placeyourbets"];
}

-(void)spinWheel:(NSNumber*)number{
    
    
}

-(void)startSpin:(NSNotification*)notification{
    [self setAllowBets:NO];
    
    
    
    NSDictionary* userInfo = notification.userInfo;
    NSInteger number = [[userInfo objectForKey:@"number"] integerValue];
    NSLog(@"number: %d", number);
    [self playVoice:@"nomorebets"];
    [self spinBallShouldLandOnNumber:number];
    [self.view makeToast:@"No More Bets" duration:1.0 position:CSToastPositionCenter title:@"Roulette Dealer" image:[UIImage imageNamed:@"dealerimage.png"]];
    
    //[timeLeft setProgress:progress animated:YES];
}

-(void)addPlacedChip:(Chip*)placechip withInfo:(NSDictionary*)userInfo{
    NSLog(@"chip placed: %@", userInfo);
    NSInteger seatindex = [[userInfo objectForKey:@"seatindex"] integerValue];
    NSInteger place = [[userInfo objectForKey:@"place"] integerValue];
    double chipvalue = [[userInfo objectForKey:@"chipvalue"] doubleValue];
    
    if(seatindex == UIAppDelegate.g_seatindex) return;
    
    
    [background addSubview:placechip];
    [background sendSubviewToBack:placechip];
    
    CGPoint center = CGPointMake(places[place].rect.origin.x+(places[place].rect.size.width/2), places[place].rect.origin.y+(places[place].rect.size.height/2));
    int x = center.x-(placechip.image.size.width/2);
    int y = center.y-(placechip.image.size.height/2);
    [placechip setFrame:CGRectMake(x, y, placechip.image.size.width, placechip.image.size.height)];
    
    
    
    [places[place].aryChips addObject:placechip];
    
    
    double total = 0.0f;
    for (Chip* ch in places[place].aryChips) {
        if(ch.seatindex == seatindex){
            total += ch.value;
            //ch.text.text = [NSString stringWithFormat:@"%@", [Common convertToCurrencyShort:total]];
        }
    }
    
    for (Chip* ch in places[place].aryChips) {
        if(ch.seatindex == seatindex){
            //total += ch.value;
            ch.text.text = [NSString stringWithFormat:@"%@", [Common convertToCurrencyShort:total]];
        }
    }
    
    //ok so add chip to the screen for certain user
    NSLog(@"name:b%@", [userInfo objectForKey:@"playername"]);
    
}

-(float)getChipFontSize{
    
    return fChipFontSize;
}

-(void)chipPlaced:(NSNotification*)notification{
    
}

-(void)chipsPlaced:(NSNotification*)notification{
    
    NSDictionary* userInfo = notification.userInfo;
    NSInteger bseatindex = [[userInfo objectForKey:@"seatindex"] integerValue];
    
    if(bseatindex == UIAppDelegate.g_seatindex) return;
    
    NSLog(@"chips placed: %@", userInfo);
    NSMutableArray *chips = [userInfo objectForKey:@"chips"];
    for (NSDictionary* c in chips) {
        NSInteger seatindex = [[c objectForKey:@"playerseat"] integerValue];
        NSInteger place = [[c objectForKey:@"place"] integerValue];
        double chipvalue = [[c objectForKey:@"value"] doubleValue];
        
        NSMutableDictionary* ui = [NSMutableDictionary dictionary];
        [ui setObject:[NSNumber numberWithInteger:seatindex] forKey:@"seatindex"];
        [ui setObject:[NSNumber numberWithInteger:place] forKey:@"place"];
        [ui setObject:[NSNumber numberWithDouble:chipvalue] forKey:@"chipvalue"];
        
        Chip *placechip = [Common makeChipWithSeatIndex:seatindex andImage:(NSString*)seatchip[seatindex] left:0 top:0];
        [placechip setChipValue:chipvalue];
        
        [placechip.text setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:[self getChipFontSize]]];
        [self addPlacedChip:placechip withInfo:ui];
    }
    
}

-(void)playerLeft:(NSNotification*)notification{
    NSDictionary* userInfo = notification.userInfo;
    NSInteger bseatindex = [[userInfo objectForKey:@"seatindex"] integerValue];
    
    NSLog(@"player lleft this seat: %d", bseatindex);
    
    
    for (int i = 0 ; i < PLACE_COUNT; i++) {
        if ([places[i].aryChips count] > 0) {
            NSMutableIndexSet *toRemove = [[NSMutableIndexSet alloc] init];
            for(int x=0; x<[places[i].aryChips count]; x++){
                Chip* ch = [places[i].aryChips objectAtIndex:x];
                if(ch.seatindex == bseatindex){
                    [[places[i].aryChips objectAtIndex:x] removeFromSuperview];
                    [toRemove addIndex:x];
                }
            }
            [places[i].aryChips removeObjectsAtIndexes:toRemove];
        }
    }
    
    [self refreshTableData];
    
   
}
-(void)playerJoined:(NSNotification*)notification{
     [self refreshTableData];
}

-(void)chipsCleared:(NSNotification*)notification{
    NSDictionary* userInfo = notification.userInfo;
    NSLog(@"cleared: %@", userInfo);

}

-(void)allChipsCleared:(NSNotification*)notification{
    NSDictionary* userInfo = notification.userInfo;
    NSLog(@"cleared all: %@", userInfo);
    
    NSInteger seatindex = [[userInfo objectForKey:@"seatindex"] integerValue];
    if(seatindex != UIAppDelegate.g_seatindex){
        
        
        for (int i = 0 ; i < PLACE_COUNT; i++) {
            if ([places[i].aryChips count] > 0) {
                NSMutableIndexSet *toRemove = [[NSMutableIndexSet alloc] init];
                for(int x=0; x<[places[i].aryChips count]; x++){
                    
                    Chip* c = (Chip *)[places[i].aryChips objectAtIndex:x];
                    if(c.seatindex == seatindex){
                        [toRemove addIndex:x];
                        [c setCenter:CGPointMake(0, -50)];
                        [c removeFromSuperview];
                    }
                }
                [places[i].aryChips removeObjectsAtIndexes:toRemove];
            }
        }
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [wheelTimer invalidate];
    [ballTimer invalidate];
    
    wheelTimer = nil;
    ballTimer = nil;
    
    [startBallEffect stop];
    [middleBallEffect stop];
    [stopBallEffect stop];
    [ballBouncingEffect stop];
    [voicePlayer stop];
    [chipDropPlayer stop];
    
    [SVProgressHUD dismiss];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(id)initWithGameTable:(GameTable*)table{
    if(self = [super init]){
        g_gameTable = table;
    }
    
    return self;
}

-(void)setAllowBets:(BOOL)allow{
    bBetsAllowed = allow;
    if(!bBetsAllowed){
        if(currentChip){
            [currentChip removeFromSuperview];
            currentChip = nil;
        }
        
        fingerOffsetForLongPress = 0.0f;
        lastChipPosition = CGPointZero;
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [self clearSlotHighlights];
    }
}

-(void)refreshTableData{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"callback: %@", response);
        if(![Common isEmpty:response]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if(json){
                GameTable *table = [[GameTable alloc] init];
                table.name = [[json objectForKey:@"table"] objectForKey:@"name"];
                table.players = [[NSMutableArray alloc] init];
                table.gamestate = [[json objectForKey:@"table"] objectForKey:@"gamestate"];
                table.number = [[json objectForKey:@"table"] objectForKey:@"number"];
                UIAppDelegate.g_seatindex = [[json objectForKey:@"seatindex"] integerValue];
                table.history = [NSMutableArray arrayWithArray:[[json objectForKey:@"table"] objectForKey:@"history"]];
                
                for (id p in [[json objectForKey:@"table"] objectForKey:@"players"]) {
                    Player *player = [[Player alloc] init];
                    player.name = [p objectForKey:@"name"];
                    player.imageurl = [p objectForKey:@"imageurl"];
                    player.balance = [[p objectForKey:@"balance"] doubleValue];
                    player.seatindex = [[p objectForKey:@"seatindex"] integerValue];
                    
                    
                    
                    NSLog(@"%@ , %@", player.name, player.imageurl);
                    
                    [table.players addObject:player];
                }
                
                g_gameTable = table;
                [self loadTableData];
                //[self refreshTableData];
                //[self launchGameTable:table];
            }
        }
    };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[NSString stringWithFormat:@"%ld", (long)[g_gameTable.number intValue]-1] forKey:@"number"];
    
    [UIAppDelegate.socketIO sendEvent:@"gettabledata" withData:dict andAcknowledge:cb];
}

-(void)loadTableData{
    [self loadTableData:NO];
}

-(void)loadTableData:(BOOL)initialLoad{
    
    
    if(g_gameTable){
        int index = 0;
        
        for (int i=0; i<4; i++){
            [player_seat[i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", @"avatar_empty.png"]]];
            [player_seat_balance[i] setText:@"$0.00"];
            [player_seat_name[i] setText:[NSString stringWithFormat:@"%@", @"empty"]];
        }
        
        for (Player* player in g_gameTable.players) {
            
            NSInteger location = [player.imageurl rangeOfString:@"guest:"].location;
            if(location == NSNotFound){
                [player_seat[player.seatindex] setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:player.imageurl]] scale:[[UIScreen mainScreen] scale]]];
            }
            else{
                [player_seat[player.seatindex] setImage:[UIImage imageNamed:[player.imageurl stringByReplacingOccurrencesOfString:@"guest:" withString:@""]]];
            }
            
                
            [player_seat_name[player.seatindex] setText:[NSString stringWithFormat:@"%@", player.name]];
            [player_seat_balance[player.seatindex] setText:[NSString stringWithFormat:@"$%@", [Common convertToCurrencyShort:player.balance]]];
            NSLog(@"%@ - %d", player.imageurl, player.seatindex);
            index++;
        }
        
        //[player_seat[UIAppDelegate.g_seatindex] setImage:UIAppDelegate.g_imgAvatar];
        
        if(initialLoad){
            for (int i=0; i<13; i++) {
                if(historyLabel[i])
                    [historyLabel[i] setText:@""];
            }
            for (NSNumber *number in g_gameTable.history) {
                NSString *strNumber = [NSString stringWithFormat:@"%d", [number integerValue]];
                [self updateHistoryList:strNumber];
            }
        }
        
        if(initialLoad && (![SVProgressHUD isVisible] && bBetsAllowed)){
            //ok now ask it to send all chips at table bitch
            SocketIOCallback cb = ^(id argsData) {
                NSDictionary *response = argsData;
                // do something with response
                NSLog(@"tbale chpis callback: %@", response);
            };
            
            [UIAppDelegate.socketIO sendEvent:@"gettablechips" withData:nil andAcknowledge:cb];
        }
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [bankroll setText:[NSString stringWithFormat:@"$%d", mCredit]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
     [self.view setBackgroundColor:[UIColor blackColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timeLeft:) name:kBettingTimeLeft object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(serverTime:) name:kServerTime object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(placeYourBets:) name:kPlaceYourBets object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startSpin:) name:kStartSpin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerLeft:) name:kPlayerLeft object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerJoined:) name:kPlayerJoined object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chipPlaced:) name:kChipPlaced object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(allChipsCleared:) name:kAllChipsCleared object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chipsCleared:) name:kChipsCleared object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chipsPlaced:) name:kChipsPlaced object:nil];
    
    bBetsAllowed = NO;
    chip_selected_index = 0;
    fingerOffsetForLongPress = 0.0f;
    
    
    if([g_gameTable.gamestate isEqualToString:kGameStateSpinning]){
        [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
        [SVProgressHUD setRingThickness:8];
        [SVProgressHUD showWithStatus:@"Waiting for Next Round..."];
        bWasWaitingForNextRound = YES;
        [self setAllowBets:NO];
    }
    else{
        bWasWaitingForNextRound = NO;
        [self setAllowBets:YES];
    }
    
    //[cell.imageView setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    [self initializeAudio];
    
    background = [[TableBackground alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header.png"]];
    background.gameViewController = self;
    
    
    UIImage *imgCradle = [UIImage imageNamed:@"marker.png"];
    cradle = [[UIImageView alloc] initWithImage:imgCradle];
    [cradle setFrame:CGRectMake(-50, -50, imgCradle.size.width, imgCradle.size.height)];
    [cradle setHidden:YES];
    [background addSubview:cradle];
    
    chip[0] = [Common makeImage:@"chip1.png" left:0 top:0];
    chip[1] = [Common makeImage:@"chip2.png" left:0 top:0];
    chip[2] = [Common makeImage:@"chip3.png" left:0 top:0];
    chip[3] = [Common makeImage:@"chip4.png" left:0 top:0];
    chip[4] = [Common makeImage:@"chip5.png" left:0 top:0];
    
    for(int i=0; i<4; i++){
        player_seat[i] = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"seatemptybg.png"]]];
        player_seat_balance[i] = [[UILabel alloc] initWithFrame:CGRectZero];
        [player_seat_balance[i] setBackgroundColor:[UIColor blackColor]];
        [player_seat_balance[i] setTextColor:[UIColor whiteColor]];
        [player_seat_balance[i] setTextAlignment:NSTextAlignmentCenter];
        
        player_seat_name[i] = [[UILabel alloc] initWithFrame:CGRectZero];
        [player_seat_name[i] setBackgroundColor:[UIColor blackColor]];
        [player_seat_name[i] setTextColor:[UIColor whiteColor]];
        [player_seat_name[i] setLineBreakMode:NSLineBreakByTruncatingTail];
        [player_seat_name[i] setTextAlignment:NSTextAlignmentCenter];
    }
    
    balance  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"balance.png"]];
    
    
    [self setSelectedChip:chip_selected_index];
    
    for(int i=0; i<5; i++)
    {
        chip[i].tag = low[i];
        [background addSubview:chip[i]];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
