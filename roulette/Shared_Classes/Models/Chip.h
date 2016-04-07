//
//  Chip.h
//  roulette
//
//  Created by Greg Ellis on 2014-04-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chip : UIImageView{
    int nValue;
    int playerId;
    int seatNumber;
    
    UILabel *text;
    float value;
}

-(void)setChipValue:(float)chipValue;
@property (nonatomic, strong) UILabel* text;
@property (nonatomic, assign) float value;
@property (nonatomic, assign) NSInteger seatindex;

@end
