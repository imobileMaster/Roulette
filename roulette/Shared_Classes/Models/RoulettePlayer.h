//
//  RoulettePlayer.h
//  roulette
//
//  Created by Greg Ellis on 2015-03-31.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class RouletteTable;
@class RouletteChip;

@protocol RouletteTable;

@interface RoulettePlayer : JSONModel

@property (nonatomic, strong) RouletteTable<Optional, RouletteTable>  *table;

@property (nonatomic, strong) NSString *playerId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *seatindex;
@property (nonatomic, strong) NSNumber *balance;
@property (nonatomic, strong) NSString *imageurl;

-(void)placeChip:(RouletteChip*)chip atPosition:(NSInteger)placeindex;
-(void)spinFinished;

@end
