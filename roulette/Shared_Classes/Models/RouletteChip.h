//
//  RouletteChip.h
//  roulette
//
//  Created by Greg Ellis on 2015-03-31.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class RoulettePlayer;
@class RouletteTable;

@protocol RoulettePlayer;
@protocol RouletteTable;

@interface RouletteChip : JSONModel

@property (nonatomic, strong) NSString *chipId;
@property (nonatomic, strong) RoulettePlayer<Optional, RoulettePlayer> *player;
@property (nonatomic, strong) RouletteTable<Optional, RouletteTable>  *table;

@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, strong) NSNumber *placeindex;

@end
