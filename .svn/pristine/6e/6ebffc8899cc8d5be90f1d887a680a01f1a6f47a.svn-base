//
//  RouletteTable.h
//  roulette
//
//  Created by Greg Ellis on 2015-03-31.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class RoulettePlayer;

@protocol RoulettePlayer;

@interface RouletteTable : JSONModel

@property (nonatomic, strong) NSString* tableId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gamestate;
@property (nonatomic, strong) NSMutableArray *history; //13 places
@property (nonatomic, strong) NSMutableArray<RoulettePlayer> *players;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSNumber *index;
@property (nonatomic, strong) NSMutableArray<Optional>* betplaces; //157 places


-(void)seatPlayer:(RoulettePlayer*)player;
-(void)removePlayer:(RoulettePlayer*)player;

@end
