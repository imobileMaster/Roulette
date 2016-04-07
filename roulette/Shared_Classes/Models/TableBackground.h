//
//  TableBackground.h
//  roulette
//
//  Created by Greg Ellis on 2014-04-10.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameViewController;

@interface TableBackground : UIImageView
{
    GameViewController *gameViewController;
}

@property (nonatomic, strong) GameViewController* gameViewController;

@end
