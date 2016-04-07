//
//  BlankBetPlace.m
//  roulette
//
//  Created by Greg Ellis on 2015-04-03.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import "BlankBetPlace.h"

@implementation BlankBetPlace
@synthesize aryChips;

-(id)init{
    if(self=[super init]){
        self.aryChips = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
