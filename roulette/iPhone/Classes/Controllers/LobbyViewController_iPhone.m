//
//  LobbyViewController_iPhone.m
//  roulette
//
//  Created by Greg Ellis on 2015-03-17.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import "AppDelegate.h"
#import "LobbyViewController_iPhone.h"
#import "GameViewController_iPhone.h"
#import "Common.h"
#import <UIView+Toast.h>

@interface LobbyViewController_iPhone ()

@end

@implementation LobbyViewController_iPhone


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    UIView* v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [Common currentWidth]-40, 30)];
    [v setBackgroundColor:[UIColor clearColor]];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [Common currentWidth]-40, 30)];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setTextColor:[UIColor whiteColor]];
    [title setText:@"Select a Roulette Table"];
    [title setFont:[UIFont boldSystemFontOfSize:18]];
    [v addSubview:title];
    [lobbyTableView setTableHeaderView:v];
    
    [lobbyTableView setFrame:CGRectMake(20, 100, [Common currentWidth]-40, [Common currentHeight]*0.66f)];
}

-(void)launchGameTable:(GameTable*)table{
    [super launchGameTable:table];
    [self.navigationController pushViewController:[[GameViewController_iPhone alloc] initWithGameTable:table] animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    //join the table and sit them down if successful
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(!IS_IPHONE_5)
        [background setFrame:CGRectMake(-44, 0, background.frame.size.width, background.frame.size.height)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
