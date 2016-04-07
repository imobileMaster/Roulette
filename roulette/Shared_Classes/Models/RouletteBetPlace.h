//
//  RouletteBetPlace.h
//  roulette
//
//  Created by Greg Ellis on 2015-04-08.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import "JSONModel.h"

typedef enum {
    kStraight,
    kSplit,
    kStreet,
    kCorner,
    kFirstFour,
    kSixLine,
    kColumn,
    kDozen,
    kEven,
    kTrio,
    kBasket,
    kLow,
    kHigh,
    kRed,
    kBlack,
    kOdd,
    kNone
} RouletteBetType;

static const int rouletteWinningSlots[17] = {1, 2, 3, 4, 4, 6, 12, 12, 18, 3, 3, 18, 18, 18, 18, 18, 0};

@protocol RouletteChip;

@interface RouletteBetPlace : JSONModel

@property (nonatomic, assign) CGRect rect;
@property (nonatomic, assign) RouletteBetType type;
@property (nonatomic, strong) NSMutableArray<RouletteChip> *aryChips;
@property (nonatomic, strong) NSMutableArray *aryNumbers;
@property (nonatomic, strong) NSMutableDictionary* totalvalue;

@end
