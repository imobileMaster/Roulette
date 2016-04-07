//
//  RouletteServer.m
//  roulette
//
//  Created by Greg Ellis on 2015-03-31.
//  Copyright (c) 2015 ellis. All rights reserved.
//

#import "RouletteServer.h"
#import "RouletteTable.h"
#import "RoulettePlayer.h"
#import "RouletteChip.h"

@implementation RouletteServer
@synthesize delegate, socketIO;

-(BOOL) isEmpty:(id)thing{
    return thing == nil
    || [thing isKindOfClass:[NSNull class]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    if ([propertyName isEqualToString: @"delegate"]) return YES;
    return NO;
}

-(id)init{
    if(self = [super init]){
        socketIO = nil;
    }
    
    return self;
}

- (void) socketIO:(SocketIO *)socket didReceiveMessage:(SocketIOPacket *)packet
{
    //NSLog(@"didReceiveMessage >>> data: %@", packet.data);
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet
{
    NSDictionary *response = packet.dataAsJSON;
    if([[response objectForKey:@"name"] isEqualToString:@"spin"]){
        
        NSInteger number = [[[response objectForKey:@"args"] objectAtIndex:0] integerValue];
        NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:number], @"number", nil];
        
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"timeleft"]){
        double percentleft = [[[response objectForKey:@"args"] objectAtIndex:2] doubleValue];
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"placeyourbets"]){
       
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"joinedtable"]){
        
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"playerleft"]){
        NSDictionary* dict = [[response objectForKey:@"args"] objectAtIndex:0];
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"chip_placed"]){
        
        NSDictionary* dict = [[response objectForKey:@"args"] objectAtIndex:0];
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"chips_placed"]){
        
        NSDictionary* dict = [[response objectForKey:@"args"] objectAtIndex:0];
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"all_chips_cleared"]){
        
        NSDictionary* dict = [[response objectForKey:@"args"] objectAtIndex:0];
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"chips_cleared"]){
        
        NSDictionary* dict = [[response objectForKey:@"args"] objectAtIndex:0];
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"playerjoined"]){
        
    }
    else if([[response objectForKey:@"name"] isEqualToString:@"gettablelist"]){
        
    }
}

-(void)socketIODidConnect:(SocketIO *)socket{
    
    NSLog(@"RouletteServer::DidConnect");
    
    if([delegate respondsToSelector:@selector(didConnect)])
        [delegate didConnect];
}

-(void)socketIO:(SocketIO *)socket onError:(NSError *)error{
    NSLog(@"RouletteServer::DidConnectFailedWithError");
    //NSLog(@"RouletteServer::%@", [NSString stringWithFormat:@"error connecting: %@", error.localizedDescription]);
    if([delegate respondsToSelector:@selector(didConnectFailedWithError:)])
        [delegate didConnectFailedWithError:error];
}


-(void)connectPlayer:(RoulettePlayer*)player toServer:(NSString *)host onPort:(NSInteger)port{
    
    if(socketIO==nil)
        socketIO = [[SocketIO alloc] initWithDelegate:self];
    
    [socketIO connectToHost:host onPort:port];
    self.me = player;
}


-(void)getTableList:(void (^) (NSMutableArray* tables))onSuccess onError:(void (^) (NSError* error))onFailure{
    SocketIOCallback listcb = ^(id argsData) {
        
        if(![self isEmpty:argsData]){
        
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *error;
            NSMutableArray* gametablelist = [RouletteTable arrayOfModelsFromData:data error:&error];
            if(error)
                onFailure([NSError errorWithDomain:kRouletteServerErrorDomain code:RouletteServerError_InvalidResponse userInfo:nil]);
            else
                onSuccess(gametablelist);
        }
        else{
            onFailure([NSError errorWithDomain:kRouletteServerErrorDomain code:RouletteServerError_NoResponse userInfo:nil]);
        }
    };
    
    [socketIO sendEvent:@"gettablelist" withData:nil andAcknowledge:listcb];
}

-(void)getTableList{
    SocketIOCallback listcb = ^(id argsData) {
        
        if(![self isEmpty:argsData]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError *error;
            NSMutableArray* gametablelist = [RouletteTable arrayOfModelsFromData:data error:&error];
            if(error)
                [delegate didGetTableListFailedWithError:[NSError errorWithDomain:kRouletteServerErrorDomain code:RouletteServerError_InvalidResponse userInfo:nil]];
            else
                [delegate didGetTableList:gametablelist];
        }
        else{
            [delegate didGetTableListFailedWithError:[NSError errorWithDomain:kRouletteServerErrorDomain code:RouletteServerError_NoResponse userInfo:nil]];
        }
    };
    
    [socketIO sendEvent:@"gettablelist" withData:nil andAcknowledge:listcb];
}

-(void)sitAtTable:(RouletteTable*)table onSuccess:(void (^) (RouletteTable* table, NSNumber* seatindex))onSuccess onFailure:(void (^) (NSError* error))onFailure{
    SocketIOCallback cb = ^(id argsData) {
        
        //NSLog(@"%@", table);
        
        if(![self isEmpty:argsData]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
        
            NSError* error;
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if(!error){
                error = nil;
                RouletteTable *newTable = [[RouletteTable alloc] initWithDictionary:[json objectForKey:@"table"] error:&error];
                if(!error){
                    NSNumber *seatindex = [NSNumber numberWithInteger:[[json objectForKey:@"seatindex"] integerValue]];
                    self.mytable = newTable;
                    self.me.table = (RouletteTable<Optional, RouletteTable>*)newTable;
                    self.me.seatindex = seatindex;
                    onSuccess(newTable, seatindex);
                }
                else{
                    onFailure(error);
                }
            }
            else{
                onFailure(error);
            }
        }
        else{
            onFailure([NSError errorWithDomain:kRouletteServerErrorDomain code:RouletteServerError_NoResponse userInfo:nil]);
        }
    };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.me.name forKey:@"name"];
    [dict setObject:self.me.balance forKey:@"balance"];
    [dict setObject:[NSString stringWithFormat:@"%ld", (long)[table.index longValue]] forKey:@"number"];
    [dict setObject:self.me.imageurl forKey:@"imageurl"];
    
    [socketIO sendEvent:@"jointable" withData:dict andAcknowledge:cb];
}

/* seat a player at a table */
-(void)sitAtTable:(RouletteTable*)table{
    
    SocketIOCallback cb = ^(id argsData) {
        
        if(![self isEmpty:argsData]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            
            NSError* error;
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if(!error){
                error = nil;
                RouletteTable *newTable = [[RouletteTable alloc] initWithDictionary:[json objectForKey:@"table"] error:&error];
                if(!error){
                    NSNumber *seatindex = [NSNumber numberWithInteger:[[json objectForKey:@"seatindex"] integerValue]];
                    self.mytable = newTable;
                    self.me.table = (RouletteTable<Optional, RouletteTable>*)newTable;
                    self.me.seatindex = seatindex;
                    [delegate didSeatPlayerAtTable:newTable inSeatIndex:seatindex];
                }
                else{
                    [delegate didSeatPlayerFailedWithError:error];
                }
            }
            else{
                [delegate didSeatPlayerFailedWithError:error];
            }
        }
        else{
            [delegate didSeatPlayerFailedWithError:[NSError errorWithDomain:kRouletteServerErrorDomain code:RouletteServerError_NoResponse userInfo:nil]];
        }
    };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.me.name forKey:@"name"];
    [dict setObject:self.me.balance forKey:@"balance"];
    [dict setObject:[NSString stringWithFormat:@"%ld", (long)[table.index longValue]] forKey:@"number"];
    [dict setObject:self.me.imageurl forKey:@"imageurl"];
    
    [socketIO sendEvent:@"jointable" withData:dict andAcknowledge:cb];
}

/* actions for a seated player */
-(void)placeChip:(RouletteChip*)chip{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"place callback: %@", response);
        if(![self isEmpty:response]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if(json){
                
            }
        }
    };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:chip.placeindex forKey:@"index"];
    [dict setObject:chip.value forKey:@"value"];
    
    [socketIO sendEvent:@"placechip" withData:dict andAcknowledge:cb];
}

-(void)clearChips:(NSMutableArray<RouletteChip>*)chips{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"clear some chips callback: %@", response);
        if(![self isEmpty:response]){
            //NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            //id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
        }
    };
    
    NSMutableArray *convertchips = [[NSMutableArray alloc] init];
    for (RouletteChip* chip in chips) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:chip.placeindex forKey:@"place"];
        [dict setObject:chip.value forKey:@"value"];
        [dict setObject:self.me.seatindex forKey:@"playerseat"];
        [convertchips addObject:dict];
    }
    
    NSMutableDictionary *chipsdict = [NSMutableDictionary dictionary];
    [chipsdict setObject:convertchips forKey:@"chips"];
    
    [socketIO sendEvent:@"clearchips" withData:chipsdict andAcknowledge:cb];
}

-(void)clearAllChips{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"clearallchips callback: %@", response);
        if(![self isEmpty:response]){
            //NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            //id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
        }
    };
    
    
    [socketIO sendEvent:@"clearallchips" withData:nil andAcknowledge:cb];
}

-(void)placeChips:(NSMutableArray*)chips{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"chips placed callback: %@", response);
        if(![self isEmpty:response]){
            NSData *data = [argsData dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if(json){
                
            }
        }
    };
    
    NSMutableArray *convertchips = [[NSMutableArray alloc] init];
    for (RouletteChip* chip in chips) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:chip.placeindex forKey:@"place"];
        [dict setObject:chip.value forKey:@"value"];
        [dict setObject:self.me.seatindex forKey:@"playerseat"];
        [convertchips addObject:dict];
    }
    
    NSMutableDictionary *chipsdict = [NSMutableDictionary dictionary];
    [chipsdict setObject:convertchips forKey:@"chips"];
    
    [socketIO sendEvent:@"placechips" withData:chipsdict andAcknowledge:cb];
}

-(void)spinFinished{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"callback: %@", response);
    };
    
    [socketIO sendEvent:@"spinfinish" withData:nil andAcknowledge:cb];
}

-(void)leaveTable{
    SocketIOCallback cb = ^(id argsData) {
        NSDictionary *response = argsData;
        // do something with response
        NSLog(@"callback: %@", response);
    };
    
    [socketIO sendEvent:@"leavetable" withData:nil andAcknowledge:cb];
}




/* roulette server events */

-(void)didConnect{
    
}

-(void)didConnectFailedWithError:(NSError *)error{
    
}


-(void)didSeatPlayerAtTable:(RouletteTable*)table{
    
}

-(void)didSeatPlayerFailedWithError:(NSError *)error{
    
}


-(void)didRemovePlayerFromTable:(RouletteTable*)table{
    
}

-(void)didRemovePlayerFailedWithError:(NSError *)error{
    
}


-(void)didGetTableList:(NSArray* /* <RouletteTable> */)tables{
    
}

-(void)didGetTableListFailedWithError:(NSError*)error{
    
}


-(void)didPlaceChip:(RouletteChip*)chip forTable:(RouletteTable*)table{
    
}

-(void)didPlaceChipFailedWithError:(NSError*)error{
    
}


/* roulette table events */

-(void)bettingRoundDidEndForTable:(RouletteTable*)table{
    
}

-(void)bettingRoundDidBeginForTable:(RouletteTable*)table{
    
}

-(void)bettingRoundTimeRemaining:(NSTimeInterval*)millisecondsleft forTable:(RouletteTable*)table{
    
}

-(void)wheelSpinDidBeginWithWinningNumber:(NSInteger)number forTable:(RouletteTable*)table{
    
}

-(void)playerDidJoin:(RoulettePlayer*)player forTable:(RouletteTable*)table{
    
}

-(void)playerDidLeave:(RoulettePlayer*)player forTable:(RouletteTable*)table{
    
}


@end
