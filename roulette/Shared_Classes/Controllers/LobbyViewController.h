//
//  LobbyViewController.h
//  roulette
//
//  Created by Greg Ellis on 2014-06-03.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameTable.h"
#import "Player.h"

@interface LobbyViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UITableView *lobbyTableView;
    UIImageView *background;
    
    NSMutableArray *gametablelist;
}

-(void)launchGameTable:(GameTable*)table;

@end
