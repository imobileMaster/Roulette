//
//  BetPlace.m
//  roulette
//
//  Created by Greg Ellis on 2014-04-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "BetPlace.h"

@implementation BetPlace
@synthesize rect, type, aryChips, aryNumbers, totalvalue;

-(id)initWithRect:(CGRect)frame numbers:(NSArray*)numbers type:(BetType)bettype{
    if(self=[self init]){
        self.rect = frame;
        self.type = bettype;
        self.aryNumbers = [[NSMutableArray alloc] initWithArray:numbers];
        self.aryChips = [[NSMutableArray alloc] init];
        self.totalvalue = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

@end
