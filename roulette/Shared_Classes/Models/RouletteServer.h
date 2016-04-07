//
//  RouletteServer.h
//  roulette
//
//  Created by Greg Ellis on 2015-03-31.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "SocketIO.h"
#import "SocketIOPacket.h"

#define kRouletteServerErrorDomain @"com.rouletteserver.roulettegold"

enum {
    RouletteServerError_NoResponse = 1000,
    RouletteServerError_NotConnected,
    RouletteServerError_InvalidResponse
};

@class RouletteServer;
@class RouletteTable;
@class RoulettePlayer;
@class RouletteChip;

@protocol RouletteTable;
@protocol RouletteChip;

@protocol RouletteServerDelegate <NSObject>

/* roulette server events */

-(void)didConnect;
-(void)didConnectFailedWithError:(NSError *)error;

-(void)didSeatPlayerAtTable:(RouletteTable*)table inSeatIndex:(NSNumber*)seatindex;
-(void)didSeatPlayerFailedWithError:(NSError *)error;

-(void)didRemovePlayerFromTable:(RouletteTable*)table;
-(void)didRemovePlayerFailedWithError:(NSError *)error;

-(void)didGetTableList:(NSArray* /* <RouletteTable> */)tables;
-(void)didGetTableListFailedWithError:(NSError*)error;

-(void)didPlaceChip:(RouletteChip*)chip forTable:(RouletteTable*)table;
-(void)didPlaceChipFailedWithError:(NSError*)error;

/* roulette table events */

-(void)bettingRoundDidEndForTable:(RouletteTable*)table;
-(void)bettingRoundDidBeginForTable:(RouletteTable*)table;
-(void)bettingRoundTimeRemaining:(NSTimeInterval*)millisecondsleft forTable:(RouletteTable*)table;
-(void)wheelSpinDidBeginWithWinningNumber:(NSInteger)number forTable:(RouletteTable*)table;
-(void)playerDidJoin:(RoulettePlayer*)player forTable:(RouletteTable*)table;
-(void)playerDidLeave:(RoulettePlayer*)player forTable:(RouletteTable*)table;

@end

@interface RouletteServer : JSONModel<SocketIODelegate>{
    SocketIO *socketIO;
    id <RouletteServerDelegate> __weak delegate;
}

@property (nonatomic, strong) RoulettePlayer* me; //hero
@property (nonatomic, strong) RouletteTable* mytable; //table me is seated at (if any)

@property (nonatomic, strong) NSMutableArray<RouletteTable>* tables; //server table list

@property (nonatomic, strong) SocketIO *socketIO;
@property (nonatomic, weak) id <RouletteServerDelegate> delegate;



/* connect to game server and get list of tables */
-(void)connectPlayer:(RoulettePlayer*)player toServer:(NSString *)host onPort:(NSInteger)port;

-(void)getTableList;
-(void)getTableList:(void (^) (NSMutableArray* tables))onSuccess onError:(void (^) (NSError* error))onFailure;

/* seat a player at a table */
-(void)sitAtTable:(RouletteTable*)table;
-(void)sitAtTable:(RouletteTable*)table onSuccess:(void (^) (RouletteTable* table, NSNumber* seatindex))onSuccess onFailure:(void (^) (NSError* error))onFailure;

/* actions for a seated player */
-(void)placeChip:(RouletteChip*)chip;
-(void)placeChips:(NSMutableArray<RouletteChip>*)chips;
-(void)clearChips:(NSMutableArray<RouletteChip>*)chips;
-(void)clearAllChips;
-(void)spinFinished;
-(void)leaveTable;

@end
