//
//  GameViewController_iPad.m
//  roulette
//
//  Created by Greg Ellis on 2014-02-08.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "GameViewController_iPad.h"

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import <YLProgressBar/YLProgressBar.h>

@interface GameViewController_iPad ()

@end

@implementation GameViewController_iPad

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)createHistoryList{
    for(int i=0; i<13; i++){
        historyLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(793, 158+(i*34), 82, 35)];
        [historyLabel[i] setBackgroundColor:[UIColor clearColor]];
        [historyLabel[i] setFont:[UIFont fontWithName:@"ElectronicHighwaySign" size:40]];
        [historyLabel[i] setText:@""];
        
        [background addSubview:historyLabel[i]];
    }
}

-(void)createSlotHighlights{
    
    /* numbers 0-36 */
    slotHighlight[0] = [[UILabel alloc] initWithFrame:CGRectMake(883, 179, 93, 263)]; //0
    slotHighlight[1] = [[UILabel alloc] initWithFrame:CGRectMake(978, 355, 52, 81)];
    slotHighlight[2] = [[UILabel alloc] initWithFrame:CGRectMake(978, 268, 52, 82)];
    slotHighlight[3] = [[UILabel alloc] initWithFrame:CGRectMake(978, 185, 52, 77)];
    slotHighlight[4] = [[UILabel alloc] initWithFrame:CGRectMake(1037, 355, 52, 81)];
    slotHighlight[5] = [[UILabel alloc] initWithFrame:CGRectMake(1037, 268, 52, 82)];
    slotHighlight[6] = [[UILabel alloc] initWithFrame:CGRectMake(1037, 185, 52, 77)];
    slotHighlight[7] = [[UILabel alloc] initWithFrame:CGRectMake(1095, 355, 52, 81)];
    slotHighlight[8] = [[UILabel alloc] initWithFrame:CGRectMake(1095, 268, 52, 82)];
    slotHighlight[9] = [[UILabel alloc] initWithFrame:CGRectMake(1095, 185, 52, 77)];
    slotHighlight[10] = [[UILabel alloc] initWithFrame:CGRectMake(1153, 355, 53, 81)];
    slotHighlight[11] = [[UILabel alloc] initWithFrame:CGRectMake(1153, 268, 53, 82)];
    slotHighlight[12] = [[UILabel alloc] initWithFrame:CGRectMake(1153, 185, 53, 77)];
    slotHighlight[13] = [[UILabel alloc] initWithFrame:CGRectMake(1213, 356, 50, 81)];
    slotHighlight[14] = [[UILabel alloc] initWithFrame:CGRectMake(1213, 269, 50, 82)];
    slotHighlight[15] = [[UILabel alloc] initWithFrame:CGRectMake(1213, 186, 50, 77)];
    slotHighlight[16] = [[UILabel alloc] initWithFrame:CGRectMake(1270, 356, 54, 81)];
    slotHighlight[17] = [[UILabel alloc] initWithFrame:CGRectMake(1270, 269, 54, 82)];
    slotHighlight[18] = [[UILabel alloc] initWithFrame:CGRectMake(1270, 186, 54, 77)];
    slotHighlight[19] = [[UILabel alloc] initWithFrame:CGRectMake(1331, 356, 52, 81)];
    slotHighlight[20] = [[UILabel alloc] initWithFrame:CGRectMake(1331, 269, 52, 82)];
    slotHighlight[21] = [[UILabel alloc] initWithFrame:CGRectMake(1331, 186, 52, 77)];
    slotHighlight[22] = [[UILabel alloc] initWithFrame:CGRectMake(1390, 356, 50, 81)];
    slotHighlight[23] = [[UILabel alloc] initWithFrame:CGRectMake(1390, 269, 50, 82)];
    slotHighlight[24] = [[UILabel alloc] initWithFrame:CGRectMake(1390, 186, 50, 77)];
    slotHighlight[25] = [[UILabel alloc] initWithFrame:CGRectMake(1447, 356, 54, 81)];
    slotHighlight[26] = [[UILabel alloc] initWithFrame:CGRectMake(1447, 269, 54, 82)];
    slotHighlight[27] = [[UILabel alloc] initWithFrame:CGRectMake(1447, 186, 54, 77)];
    slotHighlight[28] = [[UILabel alloc] initWithFrame:CGRectMake(1508, 356, 54, 81)];
    slotHighlight[29] = [[UILabel alloc] initWithFrame:CGRectMake(1508, 269, 54, 82)];
    slotHighlight[30] = [[UILabel alloc] initWithFrame:CGRectMake(1508, 186, 54, 77)];
    slotHighlight[31] = [[UILabel alloc] initWithFrame:CGRectMake(1568, 356, 50, 81)];
    slotHighlight[32] = [[UILabel alloc] initWithFrame:CGRectMake(1568, 269, 50, 82)];
    slotHighlight[33] = [[UILabel alloc] initWithFrame:CGRectMake(1568, 186, 50, 77)];
    slotHighlight[34] = [[UILabel alloc] initWithFrame:CGRectMake(1624, 356, 52, 81)];
    slotHighlight[35] = [[UILabel alloc] initWithFrame:CGRectMake(1624, 269, 52, 82)];
    slotHighlight[36] = [[UILabel alloc] initWithFrame:CGRectMake(1624, 186, 52, 77)];

    /* 2to1, 2to1, 2to1 */
    slotHighlight[37] = [[UILabel alloc] initWithFrame:CGRectMake(1683, 356, 54, 80)];
    slotHighlight[38] = [[UILabel alloc] initWithFrame:CGRectMake(1683, 269, 54, 80)];
    slotHighlight[39] = [[UILabel alloc] initWithFrame:CGRectMake(1683, 186, 54, 77)];
    
    /* 1st, 2nd, 3rd */
    slotHighlight[40] = [[UILabel alloc] initWithFrame:CGRectMake(978, 442, 229, 78)];
    slotHighlight[41] = [[UILabel alloc] initWithFrame:CGRectMake(1213, 442, 228, 78)];
    slotHighlight[42] = [[UILabel alloc] initWithFrame:CGRectMake(1446, 442, 230, 78)];
    
    /* 1 to 18 */
    slotHighlight[43] = [[UILabel alloc] initWithFrame:CGRectMake(978, 526, 113, 80)];
    
    /* even */
    slotHighlight[44] = [[UILabel alloc] initWithFrame:CGRectMake(1096, 526, 111, 80)];
    
    /* red */
    slotHighlight[45] = [[UILabel alloc] initWithFrame:CGRectMake(1213, 526, 112, 80)];
    
    /* black */
    slotHighlight[46] = [[UILabel alloc] initWithFrame:CGRectMake(1331, 526, 109, 80)];
    
    /* odd */
    slotHighlight[47] = [[UILabel alloc] initWithFrame:CGRectMake(1446, 526, 114, 80)];
    
    /* 19 to 36 */
    slotHighlight[48] = [[UILabel alloc] initWithFrame:CGRectMake(1566, 526, 111, 80)];
    
    for(int i=0; i<49; i++){
        slotHighlight[i].backgroundColor = [Common makeColorWithRed:0 green:120 blue:255 alpha:0.0];
        [background addSubview:slotHighlight[i]];
    }
}

-(void)createBetPlaces{
    
    /* position rects of all the top row bets, winning numbers, and bet type */
    places[0] = [[BetPlace alloc] initWithRect:CGRectMake(959,167,33,33) numbers:@[@1,@2,@3,@0] type:kFirstFour];
    places[1] = [[BetPlace alloc] initWithRect:CGRectMake(990,167,28,33) numbers:@[@1,@2,@3] type:kStreet];
    places[2] = [[BetPlace alloc] initWithRect:CGRectMake(1016,167,34,33) numbers:@[@1,@2,@3,@4,@5,@6] type:kSixLine];
    places[3] = [[BetPlace alloc] initWithRect:CGRectMake(1048,167,29,33) numbers:@[@4,@5,@6] type:kStreet];
    places[4] = [[BetPlace alloc] initWithRect:CGRectMake(1075,167,34,33) numbers:@[@4,@5,@6,@7,@8,@9] type:kSixLine];
    places[5] = [[BetPlace alloc] initWithRect:CGRectMake(1107,167,28,33) numbers:@[@7,@8,@9] type:kStreet];
    places[6] = [[BetPlace alloc] initWithRect:CGRectMake(1133,167,34,33) numbers:@[@7,@8,@9,@10,@11,@12] type:kSixLine];
    places[7] = [[BetPlace alloc] initWithRect:CGRectMake(1165,167,30,33) numbers:@[@10,@11,@12] type:kStreet];
    places[8] = [[BetPlace alloc] initWithRect:CGRectMake(1193,167,34,33) numbers:@[@10,@11,@12,@13,@14,@15] type:kSixLine];
    places[9] = [[BetPlace alloc] initWithRect:CGRectMake(1225,167,26,33) numbers:@[@13,@14,@15] type:kStreet];
    places[10] = [[BetPlace alloc] initWithRect:CGRectMake(1251,167,32,33) numbers:@[@13,@14,@15,@16,@17,@18] type:kSixLine];
    places[11] = [[BetPlace alloc] initWithRect:CGRectMake(1281,167,31,33) numbers:@[@16,@17,@18] type:kStreet];
    places[12] = [[BetPlace alloc] initWithRect:CGRectMake(1310,167,34,33) numbers:@[@16,@17,@18,@19,@20,@21] type:kSixLine];
    places[13] = [[BetPlace alloc] initWithRect:CGRectMake(1342,167,30,33) numbers:@[@19,@20,@21] type:kStreet];
    places[14] = [[BetPlace alloc] initWithRect:CGRectMake(1370,167,32,33) numbers:@[@19,@20,@21,@22,@23,@24] type:kSixLine];
    places[15] = [[BetPlace alloc] initWithRect:CGRectMake(1402,167,26,33) numbers:@[@22,@23,@24] type:kStreet];
    places[16] = [[BetPlace alloc] initWithRect:CGRectMake(1426,167,34,33) numbers:@[@22,@23,@24,@25,@26,@27] type:kSixLine];
    places[17] = [[BetPlace alloc] initWithRect:CGRectMake(1458,167,31,33) numbers:@[@25,@26,@27] type:kStreet];
    places[18] = [[BetPlace alloc] initWithRect:CGRectMake(1487,167,34,33) numbers:@[@25,@26,@27,@28,@29,@30] type:kSixLine];
    places[19] = [[BetPlace alloc] initWithRect:CGRectMake(1519,167,30,33) numbers:@[@28,@29,@30] type:kStreet];
    places[20] = [[BetPlace alloc] initWithRect:CGRectMake(1547,167,34,33) numbers:@[@28,@29,@30,@31,@32,@33] type:kSixLine];
    places[21] = [[BetPlace alloc] initWithRect:CGRectMake(1579,167,27,33) numbers:@[@31,@32,@33] type:kStreet];
    places[22] = [[BetPlace alloc] initWithRect:CGRectMake(1605,167,33,33) numbers:@[@31,@32,@33,@34,@35,@36] type:kSixLine];
    places[23] = [[BetPlace alloc] initWithRect:CGRectMake(1636,167,41,33) numbers:@[@34,@35,@36] type:kStreet];
    
    /* position rects of all second row bets, winning numbers, and bet type */
    places[24] = [[BetPlace alloc] initWithRect:CGRectMake(959,198,33,52) numbers:@[@0,@3] type:kSplit];
    places[25] = [[BetPlace alloc] initWithRect:CGRectMake(990,198,28,52) numbers:@[@3] type:kStraight];
    places[26] = [[BetPlace alloc] initWithRect:CGRectMake(1016,198,34,52) numbers:@[@3,@6] type:kSplit];
    places[27] = [[BetPlace alloc] initWithRect:CGRectMake(1048,198,29,52) numbers:@[@6] type:kStraight];
    places[28] = [[BetPlace alloc] initWithRect:CGRectMake(1075,198,34,52) numbers:@[@6,@9] type:kSplit];
    places[29] = [[BetPlace alloc] initWithRect:CGRectMake(1107,198,28,52) numbers:@[@9] type:kStraight];
    places[30] = [[BetPlace alloc] initWithRect:CGRectMake(1133,198,34,52) numbers:@[@9,@12] type:kSplit];
    places[31] = [[BetPlace alloc] initWithRect:CGRectMake(1165,198,30,52) numbers:@[@12] type:kStraight];
    places[32] = [[BetPlace alloc] initWithRect:CGRectMake(1193,198,34,52) numbers:@[@12,@15] type:kSplit];
    places[33] = [[BetPlace alloc] initWithRect:CGRectMake(1225,198,28,52) numbers:@[@15] type:kStraight];
    places[34] = [[BetPlace alloc] initWithRect:CGRectMake(1251,198,32,52) numbers:@[@15,@18] type:kSplit];
    places[35] = [[BetPlace alloc] initWithRect:CGRectMake(1281,198,31,52) numbers:@[@18] type:kStraight];
    places[36] = [[BetPlace alloc] initWithRect:CGRectMake(1310,198,34,52) numbers:@[@18,@21] type:kSplit];
    places[37] = [[BetPlace alloc] initWithRect:CGRectMake(1342,198,30,52) numbers:@[@21] type:kStraight];
    places[38] = [[BetPlace alloc] initWithRect:CGRectMake(1370,198,32,52) numbers:@[@21,@24] type:kSplit];
    places[39] = [[BetPlace alloc] initWithRect:CGRectMake(1400,198,28,52) numbers:@[@24] type:kStraight];
    places[40] = [[BetPlace alloc] initWithRect:CGRectMake(1426,198,34,52) numbers:@[@24,@27] type:kSplit];
    places[41] = [[BetPlace alloc] initWithRect:CGRectMake(1458,198,31,52) numbers:@[@27] type:kStraight];
    places[42] = [[BetPlace alloc] initWithRect:CGRectMake(1487,198,34,52) numbers:@[@27,@30] type:kSplit];
    places[43] = [[BetPlace alloc] initWithRect:CGRectMake(1519,198,30,52) numbers:@[@30] type:kStraight];
    places[44] = [[BetPlace alloc] initWithRect:CGRectMake(1547,198,34,52) numbers:@[@30,@33] type:kSplit];
    places[45] = [[BetPlace alloc] initWithRect:CGRectMake(1579,198,28,52) numbers:@[@33] type:kStraight];
    places[46] = [[BetPlace alloc] initWithRect:CGRectMake(1605,198,33,52) numbers:@[@33,@36] type:kSplit];
    places[47] = [[BetPlace alloc] initWithRect:CGRectMake(1637,198,40,52) numbers:@[@36] type:kStraight];
    
    /* position rects of all third row bets, winning numbers, and bet type */
    places[48] = [[BetPlace alloc] initWithRect:CGRectMake(959,248,33,34) numbers:@[@0,@2,@3] type:kTrio];
    places[49] = [[BetPlace alloc] initWithRect:CGRectMake(990,248,28,34) numbers:@[@2,@3] type:kSplit];
    places[50] = [[BetPlace alloc] initWithRect:CGRectMake(1016,248,34,34) numbers:@[@2,@3,@5,@6] type:kCorner];
    places[51] = [[BetPlace alloc] initWithRect:CGRectMake(1048,248,29,34) numbers:@[@5,@6] type:kSplit];
    places[52] = [[BetPlace alloc] initWithRect:CGRectMake(1075,248,34,34) numbers:@[@5,@6,@8,@9] type:kCorner];
    places[53] = [[BetPlace alloc] initWithRect:CGRectMake(1107,248,28,34) numbers:@[@8,@9] type:kSplit];
    places[54] = [[BetPlace alloc] initWithRect:CGRectMake(1133,248,34,34) numbers:@[@8,@9,@11,@12] type:kCorner];
    places[55] = [[BetPlace alloc] initWithRect:CGRectMake(1165,248,30,34) numbers:@[@11,@12] type:kSplit];
    places[56] = [[BetPlace alloc] initWithRect:CGRectMake(1193,248,34,34) numbers:@[@11,@12,@14,@15] type:kCorner];
    places[57] = [[BetPlace alloc] initWithRect:CGRectMake(1225,248,26,34) numbers:@[@14,@15] type:kSplit];
    places[58] = [[BetPlace alloc] initWithRect:CGRectMake(1251,248,32,34) numbers:@[@14,@15,@17,@18] type:kCorner];
    places[59] = [[BetPlace alloc] initWithRect:CGRectMake(1281,248,31,34) numbers:@[@17,@18] type:kSplit];
    places[60] = [[BetPlace alloc] initWithRect:CGRectMake(1310,248,34,34) numbers:@[@17,@18,@20,@21] type:kCorner];
    places[61] = [[BetPlace alloc] initWithRect:CGRectMake(1342,248,30,34) numbers:@[@20,@21] type:kSplit];
    places[62] = [[BetPlace alloc] initWithRect:CGRectMake(1370,248,32,34) numbers:@[@20,@21,@23,@24] type:kCorner];
    places[63] = [[BetPlace alloc] initWithRect:CGRectMake(1402,248,26,34) numbers:@[@23,@24] type:kSplit];
    places[64] = [[BetPlace alloc] initWithRect:CGRectMake(1426,248,34,34) numbers:@[@23,@24,@26,@27] type:kCorner];
    places[65] = [[BetPlace alloc] initWithRect:CGRectMake(1458,248,31,34) numbers:@[@26,@27] type:kSplit];
    places[66] = [[BetPlace alloc] initWithRect:CGRectMake(1487,248,34,34) numbers:@[@26,@27,@29,@30] type:kCorner];
    places[67] = [[BetPlace alloc] initWithRect:CGRectMake(1519,248,30,34) numbers:@[@29,@30] type:kSplit];
    places[68] = [[BetPlace alloc] initWithRect:CGRectMake(1547,248,34,34) numbers:@[@29,@30,@32,@33] type:kCorner];
    places[69] = [[BetPlace alloc] initWithRect:CGRectMake(1579,248,27,34) numbers:@[@32,@33] type:kSplit];
    places[70] = [[BetPlace alloc] initWithRect:CGRectMake(1605,248,33,34) numbers:@[@32,@33,@35,@36] type:kCorner];
    places[71] = [[BetPlace alloc] initWithRect:CGRectMake(1636,248,41,34) numbers:@[@35,@36] type:kSplit];
    
    
    /* position rects of all fourth row bets, winning numbers, and bet type */
    places[72] = [[BetPlace alloc] initWithRect:CGRectMake(959,280,33,58) numbers:@[@0,@2] type:kSplit];
    places[73] = [[BetPlace alloc] initWithRect:CGRectMake(990,280,28,58) numbers:@[@2] type:kStraight];
    places[74] = [[BetPlace alloc] initWithRect:CGRectMake(1016,280,34,58) numbers:@[@2,@5] type:kSplit];
    places[75] = [[BetPlace alloc] initWithRect:CGRectMake(1048,280,29,58) numbers:@[@5] type:kStraight];
    places[76] = [[BetPlace alloc] initWithRect:CGRectMake(1075,280,34,58) numbers:@[@5,@8] type:kSplit];
    places[77] = [[BetPlace alloc] initWithRect:CGRectMake(1107,280,28,58) numbers:@[@8] type:kStraight];
    places[78] = [[BetPlace alloc] initWithRect:CGRectMake(1133,280,34,58) numbers:@[@8,@11] type:kSplit];
    places[79] = [[BetPlace alloc] initWithRect:CGRectMake(1165,280,30,58) numbers:@[@11] type:kStraight];
    places[80] = [[BetPlace alloc] initWithRect:CGRectMake(1193,280,34,58) numbers:@[@11,@14] type:kSplit];
    places[81] = [[BetPlace alloc] initWithRect:CGRectMake(1225,280,28,58) numbers:@[@14] type:kStraight];
    places[82] = [[BetPlace alloc] initWithRect:CGRectMake(1251,280,32,58) numbers:@[@14,@17] type:kSplit];
    places[83] = [[BetPlace alloc] initWithRect:CGRectMake(1281,280,31,58) numbers:@[@17] type:kStraight];
    places[84] = [[BetPlace alloc] initWithRect:CGRectMake(1310,280,34,58) numbers:@[@17,@20] type:kSplit];
    places[85] = [[BetPlace alloc] initWithRect:CGRectMake(1342,280,30,58) numbers:@[@20] type:kStraight];
    places[86] = [[BetPlace alloc] initWithRect:CGRectMake(1370,280,32,58) numbers:@[@20,@23] type:kSplit];
    places[87] = [[BetPlace alloc] initWithRect:CGRectMake(1400,280,28,58) numbers:@[@23] type:kStraight];
    places[88] = [[BetPlace alloc] initWithRect:CGRectMake(1426,280,34,58) numbers:@[@23,@26] type:kSplit];
    places[89] = [[BetPlace alloc] initWithRect:CGRectMake(1458,280,31,58) numbers:@[@26] type:kStraight];
    places[90] = [[BetPlace alloc] initWithRect:CGRectMake(1487,280,34,58) numbers:@[@26,@29] type:kSplit];
    places[91] = [[BetPlace alloc] initWithRect:CGRectMake(1519,280,30,58) numbers:@[@29] type:kStraight];
    places[92] = [[BetPlace alloc] initWithRect:CGRectMake(1547,280,34,58) numbers:@[@29,@32] type:kSplit];
    places[93] = [[BetPlace alloc] initWithRect:CGRectMake(1579,280,28,58) numbers:@[@32] type:kStraight];
    places[94] = [[BetPlace alloc] initWithRect:CGRectMake(1605,280,33,58) numbers:@[@32,@35] type:kSplit];
    places[95] = [[BetPlace alloc] initWithRect:CGRectMake(1637,280,40,58) numbers:@[@35] type:kStraight];
    
    
    /* position rects of all fifth row bets, winning numbers, and bet type */
    places[96] = [[BetPlace alloc] initWithRect:CGRectMake(959,336,33,34) numbers:@[@0,@1,@2] type:kTrio];
    places[97] = [[BetPlace alloc] initWithRect:CGRectMake(990,336,28,34) numbers:@[@1,@2] type:kSplit];
    places[98] = [[BetPlace alloc] initWithRect:CGRectMake(1016,336,34,34) numbers:@[@1,@2,@4,@5] type:kCorner];
    places[99] = [[BetPlace alloc] initWithRect:CGRectMake(1048,336,29,34) numbers:@[@4,@5] type:kSplit];
    places[100] = [[BetPlace alloc] initWithRect:CGRectMake(1075,336,34,34) numbers:@[@4,@5,@7,@8] type:kCorner];
    places[101] = [[BetPlace alloc] initWithRect:CGRectMake(1107,336,28,34) numbers:@[@7,@8] type:kSplit];
    places[102] = [[BetPlace alloc] initWithRect:CGRectMake(1133,336,34,34) numbers:@[@7,@8,@10,@11] type:kCorner];
    places[103] = [[BetPlace alloc] initWithRect:CGRectMake(1165,336,30,34) numbers:@[@10,@11] type:kSplit];
    places[104] = [[BetPlace alloc] initWithRect:CGRectMake(1193,336,34,34) numbers:@[@10,@11,@13,@14] type:kCorner];
    places[105] = [[BetPlace alloc] initWithRect:CGRectMake(1225,336,26,34) numbers:@[@13,@14] type:kSplit];
    places[106] = [[BetPlace alloc] initWithRect:CGRectMake(1251,336,32,34) numbers:@[@13,@14,@16,@17] type:kCorner];
    places[107] = [[BetPlace alloc] initWithRect:CGRectMake(1281,336,31,34) numbers:@[@16,@17] type:kSplit];
    places[108] = [[BetPlace alloc] initWithRect:CGRectMake(1310,336,34,34) numbers:@[@16,@17,@19,@20] type:kCorner];
    places[109] = [[BetPlace alloc] initWithRect:CGRectMake(1342,336,30,34) numbers:@[@19,@20] type:kSplit];
    places[110] = [[BetPlace alloc] initWithRect:CGRectMake(1370,336,32,34) numbers:@[@19,@20,@22,@23] type:kCorner];
    places[111] = [[BetPlace alloc] initWithRect:CGRectMake(1402,336,26,34) numbers:@[@22,@23] type:kSplit];
    places[112] = [[BetPlace alloc] initWithRect:CGRectMake(1426,336,34,34) numbers:@[@22,@23,@25,@26] type:kCorner];
    places[113] = [[BetPlace alloc] initWithRect:CGRectMake(1458,336,31,34) numbers:@[@25,@26] type:kSplit];
    places[114] = [[BetPlace alloc] initWithRect:CGRectMake(1487,336,34,34) numbers:@[@25,@26,@28,@29] type:kCorner];
    places[115] = [[BetPlace alloc] initWithRect:CGRectMake(1519,336,30,34) numbers:@[@28,@29] type:kSplit];
    places[116] = [[BetPlace alloc] initWithRect:CGRectMake(1547,336,34,34) numbers:@[@28,@29,@31,@32] type:kCorner];
    places[117] = [[BetPlace alloc] initWithRect:CGRectMake(1579,336,27,34) numbers:@[@31,@32] type:kSplit];
    places[118] = [[BetPlace alloc] initWithRect:CGRectMake(1605,336,33,34) numbers:@[@31,@32,@34,@35] type:kCorner];
    places[119] = [[BetPlace alloc] initWithRect:CGRectMake(1636,336,41,34) numbers:@[@34,@35] type:kSplit];
    
    
    /* position rects of all sixth row bets, winning numbers, and bet type */
    places[120] = [[BetPlace alloc] initWithRect:CGRectMake(959,368,33,69) numbers:@[@0,@1] type:kSplit];
    places[121] = [[BetPlace alloc] initWithRect:CGRectMake(990,368,28,69) numbers:@[@1] type:kStraight];
    places[122] = [[BetPlace alloc] initWithRect:CGRectMake(1016,368,34,69) numbers:@[@1,@4] type:kSplit];
    places[123] = [[BetPlace alloc] initWithRect:CGRectMake(1048,368,29,69) numbers:@[@4] type:kStraight];
    places[124] = [[BetPlace alloc] initWithRect:CGRectMake(1075,368,34,69) numbers:@[@4,@7] type:kSplit];
    places[125] = [[BetPlace alloc] initWithRect:CGRectMake(1107,368,28,69) numbers:@[@7] type:kStraight];
    places[126] = [[BetPlace alloc] initWithRect:CGRectMake(1133,368,34,69) numbers:@[@7,@10] type:kSplit];
    places[127] = [[BetPlace alloc] initWithRect:CGRectMake(1165,368,30,69) numbers:@[@10] type:kStraight];
    places[128] = [[BetPlace alloc] initWithRect:CGRectMake(1193,368,34,69) numbers:@[@10,@13] type:kSplit];
    places[129] = [[BetPlace alloc] initWithRect:CGRectMake(1225,368,28,69) numbers:@[@13] type:kStraight];
    places[130] = [[BetPlace alloc] initWithRect:CGRectMake(1251,368,32,69) numbers:@[@13,@16] type:kSplit];
    places[131] = [[BetPlace alloc] initWithRect:CGRectMake(1281,368,31,69) numbers:@[@16] type:kStraight];
    places[132] = [[BetPlace alloc] initWithRect:CGRectMake(1310,368,34,69) numbers:@[@16,@19] type:kSplit];
    places[133] = [[BetPlace alloc] initWithRect:CGRectMake(1342,368,30,69) numbers:@[@19] type:kStraight];
    places[134] = [[BetPlace alloc] initWithRect:CGRectMake(1370,368,32,69) numbers:@[@19,@22] type:kSplit];
    places[135] = [[BetPlace alloc] initWithRect:CGRectMake(1400,368,28,69) numbers:@[@22] type:kStraight];
    places[136] = [[BetPlace alloc] initWithRect:CGRectMake(1426,368,34,69) numbers:@[@22,@25] type:kSplit];
    places[137] = [[BetPlace alloc] initWithRect:CGRectMake(1458,368,31,69) numbers:@[@25] type:kStraight];
    places[138] = [[BetPlace alloc] initWithRect:CGRectMake(1487,368,34,69) numbers:@[@25,@28] type:kSplit];
    places[139] = [[BetPlace alloc] initWithRect:CGRectMake(1519,368,30,69) numbers:@[@28] type:kStraight];
    places[140] = [[BetPlace alloc] initWithRect:CGRectMake(1547,368,34,69) numbers:@[@28,@31] type:kSplit];
    places[141] = [[BetPlace alloc] initWithRect:CGRectMake(1579,368,28,69) numbers:@[@31] type:kStraight];
    places[142] = [[BetPlace alloc] initWithRect:CGRectMake(1605,368,33,69) numbers:@[@31,@34] type:kSplit];
    places[143] = [[BetPlace alloc] initWithRect:CGRectMake(1637,368,40,69) numbers:@[@34] type:kStraight];
    
    /* zero */
    places[144] = [[BetPlace alloc] initWithRect:CGRectMake(883,179,77,263) numbers:@[@0] type:kStraight];
    
    /* column bets */
    places[145] = [[BetPlace alloc] initWithRect:CGRectMake(1677,179,67,85) numbers:@[@3,@6,@9,@12,@15,@18,@21,@24,@27,@30,@33,@36,@39] type:kColumn];
    places[146] = [[BetPlace alloc] initWithRect:CGRectMake(1677,265,66,88) numbers:@[@2,@5,@8,@11,@14,@17,@20,@23,@26,@29,@32,@35,@38] type:kColumn];
    places[147] = [[BetPlace alloc] initWithRect:CGRectMake(1677,353,67,90) numbers:@[@1,@4,@7,@10,@13,@16,@19,@22,@25,@28,@31,@34,@37] type:kColumn];
    
    /* dozen bets */
    places[148] = [[BetPlace alloc] initWithRect:CGRectMake(970,437,240,86) numbers:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@40] type:kDozen];
    places[149] = [[BetPlace alloc] initWithRect:CGRectMake(1210,437,233,86) numbers:@[@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24,@41] type:kDozen];
    places[150] = [[BetPlace alloc] initWithRect:CGRectMake(1444,437,240,86) numbers:@[@25,@26,@27,@28,@29,@30,@31,@32,@33,@34,@35,@36,@42] type:kDozen];
    
    /* low */
    places[151] = [[BetPlace alloc] initWithRect:CGRectMake(970,523,123,90) numbers:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@43] type:kLow];
    
    /* even*/
    places[152] = [[BetPlace alloc] initWithRect:CGRectMake(1094,523,116,90) numbers:@[@2,@4,@6,@8,@10,@12,@14,@16,@18,@20,@22,@24,@26,@28,@30,@32,@34,@36,@44] type:kEven];
    
    /* red */
    places[153] = [[BetPlace alloc] initWithRect:CGRectMake(1211,523,116,90) numbers:@[@1,@3,@5,@7,@9,@12,@14,@16,@18,@19,@21,@23,@25,@27,@30,@32,@34,@36,@45] type:kRed];
    
    /* black */
    places[154] = [[BetPlace alloc] initWithRect:CGRectMake(1328,523,116,90) numbers:@[@2,@4,@6,@8,@10,@11,@13,@15,@17,@20,@22,@24,@26,@28,@29,@31,@33,@35,@46] type:kBlack];
    
    /* odd */
    places[155] = [[BetPlace alloc] initWithRect:CGRectMake(1443,523,121,90) numbers:@[@1,@3,@5,@7,@9,@11,@13,@15,@17,@19,@21,@23,@25,@27,@29,@31,@33,@35,@47] type:kOdd];
    
    /* high */
    places[156] = [[BetPlace alloc] initWithRect:CGRectMake(1563,523,121,90) numbers:@[@19,@20,@21,@22,@23,@24,@25,@26,@27,@28,@29,@30,@31,@32,@33,@34,@35,@36,@48] type:kHigh];
    
    for(int i=0; i<157; i++){
        rebetplaces[i] = [[BlankBetPlace alloc] init];
    }
}

-(void)getchips:(BButton *)sender{
    [super getchips:sender];
    
    UIView *containerView = [[UIView alloc] initWithFrame:self.view.frame];
    [containerView setBackgroundColor:[Common makeColorWithRed:0 green:0 blue:0 alpha:0.8f]];
    
    UIImageView *contentView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cashier.png"]];
    
    
    UIButton *close = [Common makeButton:@"cashier_close.png" left:((containerView.frame.size.width/2)-(contentView.frame.size.width/2)) top:((containerView.frame.size.height/2)-(contentView.frame.size.height/2)) action:@selector(closeCashier:) delegate:self];
    [contentView setFrame:CGRectMake((containerView.frame.size.width/2)-(contentView.frame.size.width/2), (containerView.frame.size.height/2)-(contentView.frame.size.height/2), contentView.frame.size.width, contentView.frame.size.height)];
    
    
    [containerView addSubview:contentView];
    [containerView addSubview:close];
    
    
    [self.view addSubview:containerView];
    
    containerView.alpha = 0;
    containerView.layer.shouldRasterize = YES;
    containerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
    [UIView animateWithDuration:0.2 animations:^{
        containerView.alpha = 1;
        containerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            containerView.alpha = 1;
            containerView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        } completion:^(BOOL finished2) {
            containerView.layer.shouldRasterize = NO;
        }];
    }];
}

-(float)getChipFontSize{
    fChipFontSize = [super getChipFontSize];
    fChipFontSize = 18;
    return fChipFontSize;
}


-(void)addPlacedChip:(Chip *)placechip withInfo:(NSDictionary *)userInfo{
    [super addPlacedChip:placechip withInfo:userInfo];
}

-(void)chipsPlaced:(NSNotification*)notification{
    [super chipsPlaced:notification];
    
}

-(void)chipPlaced:(NSNotification*)notification{
    [super chipPlaced:notification];
    
    NSDictionary* userInfo = notification.userInfo;
    NSLog(@"chip placed: %@", userInfo);
    NSInteger seatindex = [[userInfo objectForKey:@"seatindex"] integerValue];
    NSInteger place = [[userInfo objectForKey:@"place"] integerValue];
    double chipvalue = [[userInfo objectForKey:@"chipvalue"] doubleValue];
    
    if(seatindex == UIAppDelegate.g_seatindex) return;
    
    
    
    Chip *placechip = [Common makeChipWithSeatIndex:seatindex andImage:(NSString*)seatchip[seatindex] left:0 top:0];
    [placechip setChipValue:chipvalue];
    [placechip.text setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:18]];
    [self addPlacedChip:placechip withInfo:userInfo];
    
}



-(void)moveChipFromStackToView{
    [super moveChipFromStackToView];
    [currentChip.text setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:18]];
}

-(void)fireLongPress{
    [super fireLongPress];
    [self fireLongPressWithOffset:70];
}

-(void)rememberBet{
    [super rememberBet];
}

-(void)rebet:(UIButton *)sender{
    [super rebet:sender];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    initialbackgroundposition = -758.0f;
    //how often we update ball/wheel frames as animating
    updatesPerSecond = 0.05f/7.5f;
    distancetoslots = 127.0f;
    
    ballHeight = 26.0f; //height of ball in pixels
    bSpinWheelInfinite = YES; //keep spinning at all times or not
    angle_per_slice = 360.0f/37.0f; //37 slots on eurpoean
    ball_deceleration_factor = 0.0015f;//how fast the ball decelerates
    
    //y position on where the track starts on the
    //outside of the bowl. We start from the bottom of the graphic
    wheelBowlBallTrackPosition = 679.0f; //pixels where ball is spun from
    
    wheelSlotsYPosition = 542.0f; //pixels where slots are located
    
    //controls how high/low ball bounces on y axis
    //our ball bouncing algorithmm is pretty basic
    //so leaving these as is, is probably best
    ballBounceMinY = wheelSlotsYPosition-32.0f;
    ballBounceMaxY = wheelSlotsYPosition-20.0f;
    
    bDropped = bSettled = NO;
    
    //position of ball on outside. as ball rolls it will
    //continue to get closer to the center of bowl this
    //inward pos is what is used to control how far the ball
    //is positioned from the center of the bowl
    inwardpos = wheelBowlBallTrackPosition-ballHeight;
    
    [header setFrame:CGRectMake(initialbackgroundposition, header.frame.origin.y, header.frame.size.width, header.frame.size.height)];
    [background setFrame:CGRectMake(initialbackgroundposition, background.frame.origin.y, background.frame.size.width, background.frame.size.height)];
    [background setUserInteractionEnabled:YES];
    [self.view addSubview:background];
    [self.view addSubview:header];
    
    wheelOutside = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wheel_outside.png"]];
    [wheelOutside setFrame:CGRectMake(28, 55, wheelOutside.frame.size.width, wheelOutside.frame.size.height)];
    [background addSubview:wheelOutside];
    
    wheelInside = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wheel_inside.png"]];
    [wheelInside setFrame:CGRectMake(28, 55, wheelInside.frame.size.width, wheelInside.frame.size.height)];
    //[wheelInside setBackgroundColor:[UIColor redColor]];
    [background addSubview:wheelInside];
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ballNew.png"]];
    [ball setFrame:CGRectMake(359-(ball.image.size.width/2), inwardpos, ball.image.size.width, ball.image.size.height)];
    
    ballParent = [[UIView alloc] initWithFrame:CGRectMake(28, 55, 718, 713)];
    [ballParent setBackgroundColor:[UIColor clearColor]];
    //[ballParent setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f]];
    [ballParent addSubview:ball];
    [background addSubview:ballParent];
    
    [self createHistoryList];
    [self createSlotHighlights];
    [self createBetPlaces];
    
    //now that we have set all the variables specific
    //to the ipad and how it needs to be we can now
    //call our initialize function to get going
    [self initializeRoulettePositions];
    
    BButton *btnSettings = [[BButton alloc] initWithFrame:CGRectMake([Common currentWidth]-280, 5, 80, 52) color:[UIColor colorWithRed:28.0/255.0 green:113.0/255.0 blue:255.0/255.0 alpha:1.0] icon:FAIconCog fontSize:42];
    [btnSettings addTarget:self action:@selector(options:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSettings];

    
    BButton *btnLobby = [[BButton alloc] initWithFrame:CGRectMake([Common currentWidth]-178, 5, 171, 52) color:[Common makeColorWithRed:219 green:0 blue:0]];
    [btnLobby.titleLabel setFont:[UIFont fontWithName:@"BerlinSansFBDemi-Bold" size:38]];
    [btnLobby setTitle:@"LOBBY" forState:UIControlStateNormal];
    [btnLobby addTarget:self action:@selector(lobby:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLobby];
    /*UIButton *lobby = [Common makeButton:@"lobby.png" left:self.view.frame.size.height-178 top:5 action:@selector(lobby:) delegate:self];
    [self.view addSubview:lobby];*/
    
    
    
    for (int i=0; i<4; i++){
        [player_seat[i] setFrame:CGRectMake(158+(i*104), 68, player_seat[i].frame.size.width, player_seat[i].frame.size.height)];
        [player_seat[i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", @"avatar_empty.png"]]];
        [player_seat[i].layer setCornerRadius:10];
        [player_seat[i].layer setBorderColor:[UIColor redColor].CGColor];
        [player_seat[i] setClipsToBounds:YES];
        
        [player_seat_name[i] setFrame:CGRectMake(158+(i*104), 56, player_seat[i].frame.size.width, 24)];
        [player_seat_name[i] setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:20]];
        
        [player_seat_balance[i] setFrame:CGRectMake(158+(i*104), 58+player_seat[i].frame.size.height, player_seat[i].frame.size.width, 24)];
        [player_seat_balance[i] setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:20]];
        
        
        [self.view addSubview:player_seat[i]];
        [self.view addSubview:player_seat_name[i]];
        [self.view addSubview:player_seat_balance[i]];
    }
    
     [self loadTableData:YES];
    
    //[balance setFrame:CGRectMake(5, 1, balance.frame.size.width, balance.frame.size.height)];
    //[self.view addSubview:balance];
    
    UIView *backview = [[UIView alloc] initWithFrame:CGRectMake(40, 5, 460, 52)];
    [backview setBackgroundColor:[UIColor blackColor]];
    
    bankroll = [[UILabel alloc] initWithFrame:CGRectMake(65, 5, 420, 52)];
    [bankroll setAdjustsFontSizeToFitWidth:YES];
    [bankroll setFont:[UIFont boldSystemFontOfSize:22]];
    [bankroll setTextColor:[UIColor whiteColor]];
    [bankroll setBackgroundColor:[UIColor clearColor]];
    
    bankroll.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getchips:)];
    [bankroll addGestureRecognizer:tapGesture];
    
    [self.view addSubview:backview];
    [self.view addSubview:bankroll];
    
    BButton *btnChips = [[BButton alloc] initWithFrame:CGRectMake(490, 5, 171, 52) color:[Common makeColorWithRed:0 green:144 blue:0]];
    [btnChips.titleLabel setFont:[UIFont fontWithName:@"BerlinSansFBDemi-Bold" size:38]];
    [btnChips setTitle:@"CHIPS" forState:UIControlStateNormal];
    [btnChips addTarget:self action:@selector(getchips:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnChips];
    
    UIImageView *creditchip = [Common makeImage:@"creditchip.png" left:1 top:2];
    [creditchip setUserInteractionEnabled:YES];
    UITapGestureRecognizer *chipTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getchips:)];
    [creditchip addGestureRecognizer:chipTap];
    [self.view addSubview:creditchip];

    
    //UIButton *spin = [Common makeButton:@"spin.png" left:783 top:622 action:@selector(spin:) delegate:self];
    //[background addSubview:spin];
    UIButton *clear = [Common makeButton:@"clear.png" left:1476 top:627 action:@selector(clear:) delegate:self];
    [background addSubview:clear];
    UIButton *rebet = [Common makeButton:@"rebet.png" left:1595 top:627 action:@selector(rebet:) delegate:self];
    [background addSubview:rebet];
    //UIButton *chips = [Common makeButton:@"morechips.png" left:1663 top:622 action:@selector(rebet:) delegate:self];
    //[background addSubview:chips];
    
    //position chips for ipad
    for(int i =0; i<5; i++)
        [chip[i] setFrame:CGRectMake(980+(i*97), 630, chip[i].frame.size.width, chip[i].frame.size.height)];
    
    timeLeft = [[YLProgressBar alloc] initWithFrame:CGRectMake(865, 515, 160, 35)];
    [timeLeft setType:YLProgressBarTypeFlat];
    [timeLeft setProgressTintColor:[UIColor redColor]];
    [timeLeft setHideStripes:YES];
    [timeLeft setProgress:1.0f animated:YES];
    timeLeft.transform =  CGAffineTransformMakeRotation( M_PI * 1.5 );
    
    [background addSubview:timeLeft];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
