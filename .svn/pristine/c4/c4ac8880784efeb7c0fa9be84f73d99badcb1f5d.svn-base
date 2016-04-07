//
//  TableBackground.m
//  roulette
//
//  Created by Greg Ellis on 2014-04-10.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "TableBackground.h"
#import "GameViewController.h"

@implementation TableBackground
@synthesize gameViewController;

-(id)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    if(gameViewController)
        [gameViewController touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    
    if(gameViewController)
        [gameViewController touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    if(gameViewController)
        [gameViewController touchesEnded:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    
    if(gameViewController)
        [gameViewController touchesCancelled:touches withEvent:event];
}

@end
