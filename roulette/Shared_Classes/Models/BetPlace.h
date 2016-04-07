//
//  BetPlace.h
//  roulette
//
//  Created by Greg Ellis on 2014-04-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "Chip.h"

//American because kFiveLine (0,00,1,2,3)
/*typedef enum {
    kStraight,
    kSplit,
    kStreet,
    kCorner,
    kFiveLine,
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
} BetType;*/

//static const int winningSlots[17] = {1, 2, 3, 4, 5, 6, 12, 12, 18, 3, 3, 18, 18, 18, 18, 18, 0};

//define each bet type
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
} BetType;

//how many slots win for each bet type
static const int winningSlots[17] = {1, 2, 3, 4, 4, 6, 12, 12, 18, 3, 3, 18, 18, 18, 18, 18, 0};

@interface BetPlace : NSObject{
    CGRect rect;
    BetType type;
    NSMutableArray *aryChips;
    NSMutableArray *aryNumbers;
    NSMutableDictionary* totalvalue;
}

-(id)initWithRect:(CGRect)frame numbers:(NSArray*)numbers type:(BetType)bettype;

@property (nonatomic, assign) CGRect rect;
@property (nonatomic, assign) BetType type;
@property (nonatomic, strong) NSMutableArray *aryChips;
@property (nonatomic, strong) NSMutableArray *aryNumbers;
@property (nonatomic, strong) NSMutableDictionary* totalvalue;

@end
