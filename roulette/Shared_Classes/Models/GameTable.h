//
//  GameTable.h
//  roulette
//
//  Created by Greg Ellis on 2015-03-18.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameTable : NSObject
{
    NSString *name;
    NSMutableArray *history;
    NSMutableArray *players;
    NSString *gamestate;
    NSNumber *number;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gamestate;
@property (nonatomic, strong) NSMutableArray *history;
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, strong) NSNumber *number;

@end
