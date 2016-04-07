//
//  Chip.m
//  roulette
//
//  Created by Greg Ellis on 2014-04-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "Chip.h"

@implementation Chip
@synthesize text;
@synthesize value;
@synthesize seatindex;


-(id)initWithImage:(UIImage *)image{
    if(self = [super initWithImage:image]){
        value = 0.0f;
        seatindex = 0;
        
        text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [text setBackgroundColor:[UIColor clearColor]];
        [text setText:@""];
        [text setTextColor:[UIColor blackColor]];
        [text setTextAlignment:NSTextAlignmentCenter];
        [text setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:18]];
        [self addSubview:text];
    }
    return self;
}

-(void)setChipValue:(float)chipValue{
    value = chipValue;
    if(value >= 1000.0f)
        [text setText:[NSString stringWithFormat:@"%dK", (int)(value/1000.0f)]];
    else
         [text setText:[NSString stringWithFormat:@"%d", (int)value]];
}


-(id)copyWithZone:(NSZone *)zone{
    Chip *chip = [[[self class] allocWithZone:zone] init];
    chip.value = [self value];
    chip.text = [self text];
    
    return chip;
}

@end
