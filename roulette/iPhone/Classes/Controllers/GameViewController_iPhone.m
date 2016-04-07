//
//  GameViewController_iPhone.m
//  roulette
//
//  Created by Greg Ellis on 2014-02-08.
//  Copyright (c) 2014 ellis. All rights reserved.
//

#import "AppDelegate.h"
#import "GameViewController_iPhone.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import <YLProgressBar/YLProgressBar.h>

@interface GameViewController_iPhone ()

@end

@implementation GameViewController_iPhone

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)createHistoryList{
    //setup history list
    for(int i=0; i<13; i++){
        historyLabel[i] = [[UILabel alloc] initWithFrame:CGRectMake(324, 82+(i*14), 32,14)];
        [historyLabel[i] setBackgroundColor:[UIColor clearColor]];
        [historyLabel[i] setFont:[UIFont fontWithName:@"ElectronicHighwaySign" size:15]];
        [historyLabel[i] setText:@""];
        [background addSubview:historyLabel[i]];
    }
}

-(void)createSlotHighlights{
    slotHighlight[0] = [[UILabel alloc] initWithFrame:CGRectMake(366,55,44,126)]; //0
    
    slotHighlight[1] = [[UILabel alloc] initWithFrame:CGRectMake(413,140,25,38)];
    slotHighlight[2] = [[UILabel alloc] initWithFrame:CGRectMake(413,98,25,38)];
    slotHighlight[3] = [[UILabel alloc] initWithFrame:CGRectMake(413,58,25,36)];
    slotHighlight[4] = [[UILabel alloc] initWithFrame:CGRectMake(442,140,25,38)];
    slotHighlight[5] = [[UILabel alloc] initWithFrame:CGRectMake(442,98,25,38)];
    slotHighlight[6] = [[UILabel alloc] initWithFrame:CGRectMake(442,58,25,36)];
    slotHighlight[7] = [[UILabel alloc] initWithFrame:CGRectMake(471,140,25,38)];
    slotHighlight[8] = [[UILabel alloc] initWithFrame:CGRectMake(471,98,25,38)];
    slotHighlight[9] = [[UILabel alloc] initWithFrame:CGRectMake(471,58,25,36)];
    slotHighlight[10] = [[UILabel alloc] initWithFrame:CGRectMake(499,140,26,38)];
    slotHighlight[11] = [[UILabel alloc] initWithFrame:CGRectMake(499,98,26,38)];
    slotHighlight[12] = [[UILabel alloc] initWithFrame:CGRectMake(499,58,26,36)];
    slotHighlight[13] = [[UILabel alloc] initWithFrame:CGRectMake(529,140,24,38)];
    slotHighlight[14] = [[UILabel alloc] initWithFrame:CGRectMake(529,98,24,38)];
    slotHighlight[15] = [[UILabel alloc] initWithFrame:CGRectMake(529,58,24,36)];
    slotHighlight[16] = [[UILabel alloc] initWithFrame:CGRectMake(556,140,27,38)];
    slotHighlight[17] = [[UILabel alloc] initWithFrame:CGRectMake(556,98,27,38)];
    slotHighlight[18] = [[UILabel alloc] initWithFrame:CGRectMake(556,58,27,36)];
    slotHighlight[19] = [[UILabel alloc] initWithFrame:CGRectMake(587,140,25,38)];
    slotHighlight[20] = [[UILabel alloc] initWithFrame:CGRectMake(587,98,25,38)];
    slotHighlight[21] = [[UILabel alloc] initWithFrame:CGRectMake(587,58,25,36)];
    slotHighlight[22] = [[UILabel alloc] initWithFrame:CGRectMake(615,140,25,38)];
    slotHighlight[23] = [[UILabel alloc] initWithFrame:CGRectMake(615,98,25,38)];
    slotHighlight[24] = [[UILabel alloc] initWithFrame:CGRectMake(615,58,25,36)];
    slotHighlight[25] = [[UILabel alloc] initWithFrame:CGRectMake(643,140,27,38)];
    slotHighlight[26] = [[UILabel alloc] initWithFrame:CGRectMake(643,98,27,38)];
    slotHighlight[27] = [[UILabel alloc] initWithFrame:CGRectMake(643,58,27,36)];
    slotHighlight[28] = [[UILabel alloc] initWithFrame:CGRectMake(673,140,26,38)];
    slotHighlight[29] = [[UILabel alloc] initWithFrame:CGRectMake(673,98,26,38)];
    slotHighlight[30] = [[UILabel alloc] initWithFrame:CGRectMake(673,58,26,36)];
    slotHighlight[31] = [[UILabel alloc] initWithFrame:CGRectMake(703,140,24,38)];
    slotHighlight[32] = [[UILabel alloc] initWithFrame:CGRectMake(703,98,24,38)];
    slotHighlight[33] = [[UILabel alloc] initWithFrame:CGRectMake(703,58,24,36)];
    slotHighlight[34] = [[UILabel alloc] initWithFrame:CGRectMake(730,140,26,38)];
    slotHighlight[35] = [[UILabel alloc] initWithFrame:CGRectMake(730,98,26,38)];
    slotHighlight[36] = [[UILabel alloc] initWithFrame:CGRectMake(730,58,26,36)];
    
    /*for(int i=0; i<3; i++){
        int left = 413;
        int top = 140-(42*i);
        
        for(int j=0; j<12; j++){
            left = 413+(j*29);
            slotHighlight[(i+1)+(3*j)] = [[UILabel alloc] initWithFrame:CGRectMake(left, top, 26, 38)];
        }
    }*/
    
    /* 2to1, 2to1, 2to1 */
    slotHighlight[37] = [[UILabel alloc] initWithFrame:CGRectMake(759, 140, 26, 38)];
    slotHighlight[38] = [[UILabel alloc] initWithFrame:CGRectMake(759, 98, 26, 38)];
    slotHighlight[39] = [[UILabel alloc] initWithFrame:CGRectMake(759, 57, 26, 38)];
    
    /* 1st, 2nd, 3rd */
    slotHighlight[40] = [[UILabel alloc] initWithFrame:CGRectMake(413, 181, 112, 37)];
    slotHighlight[41] = [[UILabel alloc] initWithFrame:CGRectMake(529, 181, 111, 37)];
    slotHighlight[42] = [[UILabel alloc] initWithFrame:CGRectMake(643, 181, 113, 37)];
    
    /* 1 to 18 */
    slotHighlight[43] = [[UILabel alloc] initWithFrame:CGRectMake(413, 222, 55, 37)];
    
    /* even */
    slotHighlight[44] = [[UILabel alloc] initWithFrame:CGRectMake(472, 222, 53, 37)];
    
    /* red */
    slotHighlight[45] = [[UILabel alloc] initWithFrame:CGRectMake(529, 222, 54, 37)];
    
    /* black */
    slotHighlight[46] = [[UILabel alloc] initWithFrame:CGRectMake(587, 222, 52, 37)];
    
    /* odd */
    slotHighlight[47] = [[UILabel alloc] initWithFrame:CGRectMake(643, 222, 55, 37)];
    
    /* 19 to 36 */
    slotHighlight[48] = [[UILabel alloc] initWithFrame:CGRectMake(702, 222, 53, 37)];
    
    for(int i=0; i<49; i++){
        slotHighlight[i].backgroundColor = [Common makeColorWithRed:0 green:120 blue:255 alpha:0.0];
        [background addSubview:slotHighlight[i]];
    }
}

-(void)createBetPlaces{
    
    /* position rects of all the top row bets, winning numbers, and bet type */
    places[0] = [[BetPlace alloc] initWithRect:CGRectMake(404,49,17,17) numbers:@[@1,@2,@3,@0] type:kFirstFour];
    places[1] = [[BetPlace alloc] initWithRect:CGRectMake(419,49,14,17) numbers:@[@1,@2,@3] type:kStreet];
    places[2] = [[BetPlace alloc] initWithRect:CGRectMake(431,49,18,17) numbers:@[@1,@2,@3,@4,@5,@6] type:kSixLine];
    places[3] = [[BetPlace alloc] initWithRect:CGRectMake(447,49,15,17) numbers:@[@4,@5,@6] type:kStreet];
    places[4] = [[BetPlace alloc] initWithRect:CGRectMake(460,49,18,17) numbers:@[@4,@5,@6,@7,@8,@9] type:kSixLine];
    places[5] = [[BetPlace alloc] initWithRect:CGRectMake(476,49,15,17) numbers:@[@7,@8,@9] type:kStreet];
    places[6] = [[BetPlace alloc] initWithRect:CGRectMake(489,49,18,17) numbers:@[@7,@8,@9,@10,@11,@12] type:kSixLine];
    places[7] = [[BetPlace alloc] initWithRect:CGRectMake(505,49,15,17) numbers:@[@10,@11,@12] type:kStreet];
    places[8] = [[BetPlace alloc] initWithRect:CGRectMake(518,49,18,17) numbers:@[@10,@11,@12,@13,@14,@15] type:kSixLine];
    places[9] = [[BetPlace alloc] initWithRect:CGRectMake(534,49,14,17) numbers:@[@13,@14,@15] type:kStreet];
    places[10] = [[BetPlace alloc] initWithRect:CGRectMake(546,49,18,17) numbers:@[@13,@14,@15,@16,@17,@18] type:kSixLine];
    places[11] = [[BetPlace alloc] initWithRect:CGRectMake(563,49,15,17) numbers:@[@16,@17,@18] type:kStreet];
    places[12] = [[BetPlace alloc] initWithRect:CGRectMake(576,49,18,17) numbers:@[@16,@17,@18,@19,@20,@21] type:kSixLine];
    places[13] = [[BetPlace alloc] initWithRect:CGRectMake(592,49,15,17) numbers:@[@19,@20,@21] type:kStreet];
    places[14] = [[BetPlace alloc] initWithRect:CGRectMake(605,49,18,17) numbers:@[@19,@20,@21,@22,@23,@24] type:kSixLine];
    places[15] = [[BetPlace alloc] initWithRect:CGRectMake(621,49,14,17) numbers:@[@22,@23,@24] type:kStreet];
    places[16] = [[BetPlace alloc] initWithRect:CGRectMake(633,49,18,17) numbers:@[@22,@23,@24,@25,@26,@27] type:kSixLine];
    places[17] = [[BetPlace alloc] initWithRect:CGRectMake(649,49,15,17) numbers:@[@25,@26,@27] type:kStreet];
    places[18] = [[BetPlace alloc] initWithRect:CGRectMake(662,49,18,17) numbers:@[@25,@26,@27,@28,@29,@30] type:kSixLine];
    places[19] = [[BetPlace alloc] initWithRect:CGRectMake(679,49,15,17) numbers:@[@28,@29,@30] type:kStreet];
    places[20] = [[BetPlace alloc] initWithRect:CGRectMake(692,49,18,17) numbers:@[@28,@29,@30,@31,@32,@33] type:kSixLine];
    places[21] = [[BetPlace alloc] initWithRect:CGRectMake(708,49,14,17) numbers:@[@31,@32,@33] type:kStreet];
    places[22] = [[BetPlace alloc] initWithRect:CGRectMake(720,49,18,17) numbers:@[@31,@32,@33,@34,@35,@36] type:kSixLine];
    places[23] = [[BetPlace alloc] initWithRect:CGRectMake(736,49,21,17) numbers:@[@34,@35,@36] type:kStreet];
    
    /* position rects of all second row bets, winning numbers, and bet type */
    places[24] = [[BetPlace alloc] initWithRect:CGRectMake(404,64,17,25) numbers:@[@0,@3] type:kSplit];
    places[25] = [[BetPlace alloc] initWithRect:CGRectMake(419,64,14,25) numbers:@[@3] type:kStraight];
    places[26] = [[BetPlace alloc] initWithRect:CGRectMake(431,64,18,25) numbers:@[@3,@6] type:kSplit];
    places[27] = [[BetPlace alloc] initWithRect:CGRectMake(447,64,15,25) numbers:@[@6] type:kStraight];
    places[28] = [[BetPlace alloc] initWithRect:CGRectMake(460,64,18,25) numbers:@[@6,@9] type:kSplit];
    places[29] = [[BetPlace alloc] initWithRect:CGRectMake(476,64,15,25) numbers:@[@9] type:kStraight];
    places[30] = [[BetPlace alloc] initWithRect:CGRectMake(489,64,18,25) numbers:@[@9,@12] type:kSplit];
    places[31] = [[BetPlace alloc] initWithRect:CGRectMake(505,64,15,25) numbers:@[@12] type:kStraight];
    places[32] = [[BetPlace alloc] initWithRect:CGRectMake(518,64,18,25) numbers:@[@12,@15] type:kSplit];
    places[33] = [[BetPlace alloc] initWithRect:CGRectMake(534,64,14,25) numbers:@[@15] type:kStraight];
    places[34] = [[BetPlace alloc] initWithRect:CGRectMake(546,64,18,25) numbers:@[@15,@18] type:kSplit];
    places[35] = [[BetPlace alloc] initWithRect:CGRectMake(562,64,16,25) numbers:@[@18] type:kStraight];
    places[36] = [[BetPlace alloc] initWithRect:CGRectMake(576,64,18,25) numbers:@[@18,@21] type:kSplit];
    places[37] = [[BetPlace alloc] initWithRect:CGRectMake(592,64,15,25) numbers:@[@21] type:kStraight];
    places[38] = [[BetPlace alloc] initWithRect:CGRectMake(605,64,18,25) numbers:@[@21,@24] type:kSplit];
    places[39] = [[BetPlace alloc] initWithRect:CGRectMake(621,64,15,25) numbers:@[@24] type:kStraight];
    places[40] = [[BetPlace alloc] initWithRect:CGRectMake(633,64,18,25) numbers:@[@24,@27] type:kSplit];
    places[41] = [[BetPlace alloc] initWithRect:CGRectMake(649,64,15,25) numbers:@[@27] type:kStraight];
    places[42] = [[BetPlace alloc] initWithRect:CGRectMake(662,64,18,25) numbers:@[@27,@30] type:kSplit];
    places[43] = [[BetPlace alloc] initWithRect:CGRectMake(678,64,16,25) numbers:@[@30] type:kStraight];
    places[44] = [[BetPlace alloc] initWithRect:CGRectMake(692,64,18,25) numbers:@[@30,@33] type:kSplit];
    places[45] = [[BetPlace alloc] initWithRect:CGRectMake(708,64,14,25) numbers:@[@33] type:kStraight];
    places[46] = [[BetPlace alloc] initWithRect:CGRectMake(720,64,18,25) numbers:@[@33,@36] type:kSplit];
    places[47] = [[BetPlace alloc] initWithRect:CGRectMake(736,64,20,25) numbers:@[@36] type:kStraight];
    
    /* position rects of all third row bets, winning numbers, and bet type */
    places[48] = [[BetPlace alloc] initWithRect:CGRectMake(404,87,17,18) numbers:@[@0,@2,@3] type:kTrio];
    places[49] = [[BetPlace alloc] initWithRect:CGRectMake(419,87,14,18) numbers:@[@2,@3] type:kSplit];
    places[50] = [[BetPlace alloc] initWithRect:CGRectMake(431,87,18,18) numbers:@[@2,@3,@5,@6] type:kCorner];
    places[51] = [[BetPlace alloc] initWithRect:CGRectMake(447,87,15,18) numbers:@[@5,@6] type:kSplit];
    places[52] = [[BetPlace alloc] initWithRect:CGRectMake(460,87,18,18) numbers:@[@5,@6,@8,@9] type:kCorner];
    places[53] = [[BetPlace alloc] initWithRect:CGRectMake(476,87,15,18) numbers:@[@8,@9] type:kSplit];
    places[54] = [[BetPlace alloc] initWithRect:CGRectMake(489,87,18,18) numbers:@[@8,@9,@11,@12] type:kCorner];
    places[55] = [[BetPlace alloc] initWithRect:CGRectMake(505,87,15,18) numbers:@[@11,@12] type:kSplit];
    places[56] = [[BetPlace alloc] initWithRect:CGRectMake(518,87,18,18) numbers:@[@11,@12,@14,@15] type:kCorner];
    places[57] = [[BetPlace alloc] initWithRect:CGRectMake(534,87,14,18) numbers:@[@14,@15] type:kSplit];
    places[58] = [[BetPlace alloc] initWithRect:CGRectMake(546,87,18,18) numbers:@[@14,@15,@17,@18] type:kCorner];
    places[59] = [[BetPlace alloc] initWithRect:CGRectMake(562,87,15,18) numbers:@[@17,@18] type:kSplit];
    places[60] = [[BetPlace alloc] initWithRect:CGRectMake(576,87,18,18) numbers:@[@17,@18,@20,@21] type:kCorner];
    places[61] = [[BetPlace alloc] initWithRect:CGRectMake(592,87,15,18) numbers:@[@20,@21] type:kSplit];
    places[62] = [[BetPlace alloc] initWithRect:CGRectMake(605,87,18,18) numbers:@[@20,@21,@23,@24] type:kCorner];
    places[63] = [[BetPlace alloc] initWithRect:CGRectMake(621,87,14,18) numbers:@[@23,@24] type:kSplit];
    places[64] = [[BetPlace alloc] initWithRect:CGRectMake(633,87,18,18) numbers:@[@23,@24,@26,@27] type:kCorner];
    places[65] = [[BetPlace alloc] initWithRect:CGRectMake(649,87,15,18) numbers:@[@26,@27] type:kSplit];
    places[66] = [[BetPlace alloc] initWithRect:CGRectMake(662,87,18,18) numbers:@[@26,@27,@29,@30] type:kCorner];
    places[67] = [[BetPlace alloc] initWithRect:CGRectMake(678,87,15,18) numbers:@[@29,@30] type:kSplit];
    places[68] = [[BetPlace alloc] initWithRect:CGRectMake(692,87,18,18) numbers:@[@29,@30,@32,@33] type:kCorner];
    places[69] = [[BetPlace alloc] initWithRect:CGRectMake(708,87,14,18) numbers:@[@32,@33] type:kSplit];
    places[70] = [[BetPlace alloc] initWithRect:CGRectMake(720,87,18,18) numbers:@[@32,@33,@35,@36] type:kCorner];
    places[71] = [[BetPlace alloc] initWithRect:CGRectMake(736,87,21,18) numbers:@[@35,@36] type:kSplit];
    
    
    /* position rects of all fourth row bets, winning numbers, and bet type */
    places[72] = [[BetPlace alloc] initWithRect:CGRectMake(404,103,17,28) numbers:@[@0,@2] type:kSplit];
    places[73] = [[BetPlace alloc] initWithRect:CGRectMake(419,103,14,28) numbers:@[@2] type:kStraight];
    places[74] = [[BetPlace alloc] initWithRect:CGRectMake(431,103,18,28) numbers:@[@2,@5] type:kSplit];
    places[75] = [[BetPlace alloc] initWithRect:CGRectMake(447,103,15,28) numbers:@[@5] type:kStraight];
    places[76] = [[BetPlace alloc] initWithRect:CGRectMake(460,103,18,28) numbers:@[@5,@8] type:kSplit];
    places[77] = [[BetPlace alloc] initWithRect:CGRectMake(476,103,15,28) numbers:@[@8] type:kStraight];
    places[78] = [[BetPlace alloc] initWithRect:CGRectMake(489,103,18,28) numbers:@[@8,@11] type:kSplit];
    places[79] = [[BetPlace alloc] initWithRect:CGRectMake(505,103,15,28) numbers:@[@11] type:kStraight];
    places[80] = [[BetPlace alloc] initWithRect:CGRectMake(518,103,18,28) numbers:@[@11,@14] type:kSplit];
    places[81] = [[BetPlace alloc] initWithRect:CGRectMake(534,103,14,28) numbers:@[@14] type:kStraight];
    places[82] = [[BetPlace alloc] initWithRect:CGRectMake(546,103,18,28) numbers:@[@14,@17] type:kSplit];
    places[83] = [[BetPlace alloc] initWithRect:CGRectMake(562,103,16,28) numbers:@[@17] type:kStraight];
    places[84] = [[BetPlace alloc] initWithRect:CGRectMake(576,103,18,28) numbers:@[@17,@20] type:kSplit];
    places[85] = [[BetPlace alloc] initWithRect:CGRectMake(592,103,15,28) numbers:@[@20] type:kStraight];
    places[86] = [[BetPlace alloc] initWithRect:CGRectMake(605,103,18,28) numbers:@[@20,@23] type:kSplit];
    places[87] = [[BetPlace alloc] initWithRect:CGRectMake(621,103,15,28) numbers:@[@23] type:kStraight];
    places[88] = [[BetPlace alloc] initWithRect:CGRectMake(633,103,18,28) numbers:@[@23,@26] type:kSplit];
    places[89] = [[BetPlace alloc] initWithRect:CGRectMake(649,103,15,28) numbers:@[@26] type:kStraight];
    places[90] = [[BetPlace alloc] initWithRect:CGRectMake(662,103,18,28) numbers:@[@26,@29] type:kSplit];
    places[91] = [[BetPlace alloc] initWithRect:CGRectMake(678,103,16,28) numbers:@[@29] type:kStraight];
    places[92] = [[BetPlace alloc] initWithRect:CGRectMake(692,103,18,28) numbers:@[@29,@32] type:kSplit];
    places[93] = [[BetPlace alloc] initWithRect:CGRectMake(708,103,14,28) numbers:@[@32] type:kStraight];
    places[94] = [[BetPlace alloc] initWithRect:CGRectMake(720,103,18,28) numbers:@[@32,@35] type:kSplit];
    places[95] = [[BetPlace alloc] initWithRect:CGRectMake(736,103,20,28) numbers:@[@35] type:kStraight];
    
    
    /* position rects of all fifth row bets, winning numbers, and bet type */
    places[96] = [[BetPlace alloc] initWithRect:CGRectMake(404,129,17,18) numbers:@[@0,@1,@2] type:kTrio];
    places[97] = [[BetPlace alloc] initWithRect:CGRectMake(419,129,14,18) numbers:@[@1,@2] type:kSplit];
    places[98] = [[BetPlace alloc] initWithRect:CGRectMake(431,129,18,18) numbers:@[@1,@2,@4,@5] type:kCorner];
    places[99] = [[BetPlace alloc] initWithRect:CGRectMake(447,129,15,18) numbers:@[@4,@5] type:kSplit];
    places[100] = [[BetPlace alloc] initWithRect:CGRectMake(460,129,18,18) numbers:@[@4,@5,@7,@8] type:kCorner];
    places[101] = [[BetPlace alloc] initWithRect:CGRectMake(476,129,15,18) numbers:@[@7,@8] type:kSplit];
    places[102] = [[BetPlace alloc] initWithRect:CGRectMake(489,129,18,18) numbers:@[@7,@8,@10,@11] type:kCorner];
    places[103] = [[BetPlace alloc] initWithRect:CGRectMake(505,129,15,18) numbers:@[@10,@11] type:kSplit];
    places[104] = [[BetPlace alloc] initWithRect:CGRectMake(518,129,18,18) numbers:@[@10,@11,@13,@14] type:kCorner];
    places[105] = [[BetPlace alloc] initWithRect:CGRectMake(534,129,14,18) numbers:@[@13,@14] type:kSplit];
    places[106] = [[BetPlace alloc] initWithRect:CGRectMake(546,129,18,18) numbers:@[@13,@14,@16,@17] type:kCorner];
    places[107] = [[BetPlace alloc] initWithRect:CGRectMake(562,129,15,18) numbers:@[@16,@17] type:kSplit];
    places[108] = [[BetPlace alloc] initWithRect:CGRectMake(576,129,18,18) numbers:@[@16,@17,@19,@20] type:kCorner];
    places[109] = [[BetPlace alloc] initWithRect:CGRectMake(592,129,15,18) numbers:@[@19,@20] type:kSplit];
    places[110] = [[BetPlace alloc] initWithRect:CGRectMake(605,129,18,18) numbers:@[@19,@20,@22,@23] type:kCorner];
    places[111] = [[BetPlace alloc] initWithRect:CGRectMake(621,129,14,18) numbers:@[@22,@23] type:kSplit];
    places[112] = [[BetPlace alloc] initWithRect:CGRectMake(633,129,18,18) numbers:@[@22,@23,@25,@26] type:kCorner];
    places[113] = [[BetPlace alloc] initWithRect:CGRectMake(649,129,15,18) numbers:@[@25,@26] type:kSplit];
    places[114] = [[BetPlace alloc] initWithRect:CGRectMake(662,129,18,18) numbers:@[@25,@26,@28,@29] type:kCorner];
    places[115] = [[BetPlace alloc] initWithRect:CGRectMake(678,129,15,18) numbers:@[@28,@29] type:kSplit];
    places[116] = [[BetPlace alloc] initWithRect:CGRectMake(692,129,18,18) numbers:@[@28,@29,@31,@32] type:kCorner];
    places[117] = [[BetPlace alloc] initWithRect:CGRectMake(708,129,14,18) numbers:@[@31,@32] type:kSplit];
    places[118] = [[BetPlace alloc] initWithRect:CGRectMake(720,129,18,18) numbers:@[@31,@32,@34,@35] type:kCorner];
    places[119] = [[BetPlace alloc] initWithRect:CGRectMake(736,129,21,18) numbers:@[@34,@35] type:kSplit];
    
    
    /* position rects of all sixth row bets, winning numbers, and bet type */
    places[120] = [[BetPlace alloc] initWithRect:CGRectMake(404,145,17,34) numbers:@[@0,@1] type:kSplit];
    places[121] = [[BetPlace alloc] initWithRect:CGRectMake(419,145,14,34) numbers:@[@1] type:kStraight];
    places[122] = [[BetPlace alloc] initWithRect:CGRectMake(431,145,18,34) numbers:@[@1,@4] type:kSplit];
    places[123] = [[BetPlace alloc] initWithRect:CGRectMake(447,145,15,34) numbers:@[@4] type:kStraight];
    places[124] = [[BetPlace alloc] initWithRect:CGRectMake(460,145,18,34) numbers:@[@4,@7] type:kSplit];
    places[125] = [[BetPlace alloc] initWithRect:CGRectMake(476,145,15,34) numbers:@[@7] type:kStraight];
    places[126] = [[BetPlace alloc] initWithRect:CGRectMake(489,145,18,34) numbers:@[@7,@10] type:kSplit];
    places[127] = [[BetPlace alloc] initWithRect:CGRectMake(505,145,15,34) numbers:@[@10] type:kStraight];
    places[128] = [[BetPlace alloc] initWithRect:CGRectMake(518,145,18,34) numbers:@[@10,@13] type:kSplit];
    places[129] = [[BetPlace alloc] initWithRect:CGRectMake(534,145,14,34) numbers:@[@13] type:kStraight];
    places[130] = [[BetPlace alloc] initWithRect:CGRectMake(546,145,18,34) numbers:@[@13,@16] type:kSplit];
    places[131] = [[BetPlace alloc] initWithRect:CGRectMake(562,145,16,34) numbers:@[@16] type:kStraight];
    places[132] = [[BetPlace alloc] initWithRect:CGRectMake(576,145,18,34) numbers:@[@16,@19] type:kSplit];
    places[133] = [[BetPlace alloc] initWithRect:CGRectMake(592,145,15,34) numbers:@[@19] type:kStraight];
    places[134] = [[BetPlace alloc] initWithRect:CGRectMake(605,145,18,34) numbers:@[@19,@22] type:kSplit];
    places[135] = [[BetPlace alloc] initWithRect:CGRectMake(621,145,15,34) numbers:@[@22] type:kStraight];
    places[136] = [[BetPlace alloc] initWithRect:CGRectMake(633,145,18,34) numbers:@[@22,@25] type:kSplit];
    places[137] = [[BetPlace alloc] initWithRect:CGRectMake(649,145,15,34) numbers:@[@25] type:kStraight];
    places[138] = [[BetPlace alloc] initWithRect:CGRectMake(662,145,18,34) numbers:@[@25,@28] type:kSplit];
    places[139] = [[BetPlace alloc] initWithRect:CGRectMake(678,145,16,34) numbers:@[@28] type:kStraight];
    places[140] = [[BetPlace alloc] initWithRect:CGRectMake(692,145,18,34) numbers:@[@28,@31] type:kSplit];
    places[141] = [[BetPlace alloc] initWithRect:CGRectMake(708,145,14,34) numbers:@[@31] type:kStraight];
    places[142] = [[BetPlace alloc] initWithRect:CGRectMake(720,145,18,34) numbers:@[@31,@34] type:kSplit];
    places[143] = [[BetPlace alloc] initWithRect:CGRectMake(736,145,20,34) numbers:@[@34] type:kStraight];
    
    /* zero */
    places[144] = [[BetPlace alloc] initWithRect:CGRectMake(366,55,38,126) numbers:@[@0] type:kStraight];
    
    /* column bets */
    places[145] = [[BetPlace alloc] initWithRect:CGRectMake(756,55,33,41) numbers:@[@3,@6,@9,@12,@15,@18,@21,@24,@27,@30,@33,@36,@39] type:kColumn];
    places[146] = [[BetPlace alloc] initWithRect:CGRectMake(756,96,33,41) numbers:@[@2,@5,@8,@11,@14,@17,@20,@23,@26,@29,@32,@35,@38] type:kColumn];
    places[147] = [[BetPlace alloc] initWithRect:CGRectMake(756,139,33,41) numbers:@[@1,@4,@7,@10,@13,@16,@19,@22,@25,@28,@31,@34,@37] type:kColumn];
    
    /* dozen bets */
    places[148] = [[BetPlace alloc] initWithRect:CGRectMake(410,178,117,42) numbers:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@40] type:kDozen];
    places[149] = [[BetPlace alloc] initWithRect:CGRectMake(527,178,115,42) numbers:@[@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24,@41] type:kDozen];
    places[150] = [[BetPlace alloc] initWithRect:CGRectMake(642,178,115,42) numbers:@[@25,@26,@27,@28,@29,@30,@31,@32,@33,@34,@35,@36,@42] type:kDozen];
    
    /* low */
    places[151] = [[BetPlace alloc] initWithRect:CGRectMake(411,220,59,41) numbers:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@43] type:kLow];
    
    /* even*/
    places[152] = [[BetPlace alloc] initWithRect:CGRectMake(471,220,56,41) numbers:@[@2,@4,@6,@8,@10,@12,@14,@16,@18,@20,@22,@24,@26,@28,@30,@32,@34,@36,@44] type:kEven];
    
    /* red */
    places[153] = [[BetPlace alloc] initWithRect:CGRectMake(527,220,58,41) numbers:@[@1,@3,@5,@7,@9,@12,@14,@16,@18,@19,@21,@23,@25,@27,@30,@32,@34,@36,@45] type:kRed];
    
    /* black */
    places[154] = [[BetPlace alloc] initWithRect:CGRectMake(585,220,57,41) numbers:@[@2,@4,@6,@8,@10,@11,@13,@15,@17,@20,@22,@24,@26,@28,@29,@31,@33,@35,@46] type:kBlack];
    
    /* odd */
    places[155] = [[BetPlace alloc] initWithRect:CGRectMake(643,220,57,41) numbers:@[@1,@3,@5,@7,@9,@11,@13,@15,@17,@19,@21,@23,@25,@27,@29,@31,@33,@35,@47] type:kOdd];
    
    /* high */
    places[156] = [[BetPlace alloc] initWithRect:CGRectMake(701,220,57,41) numbers:@[@19,@20,@21,@22,@23,@24,@25,@26,@27,@28,@29,@30,@31,@32,@33,@34,@35,@36,@48] type:kHigh];

    for(int i=0; i<157; i++){
        rebetplaces[i] = [[BlankBetPlace alloc] init];
    }
    
}

-(void)restore:(id)sender{
    int n = 0;
}

-(void)getchips:(BButton *)sender{
    [super getchips:sender];
    
    UIView *containerView = [[UIView alloc] initWithFrame:self.view.frame];
    [containerView setBackgroundColor:[Common makeColorWithRed:0 green:0 blue:0 alpha:0.8f]];
    
    UIImageView *contentView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cashier.png"]];
    [contentView setUserInteractionEnabled:YES];
    
    UIButton *close = [Common makeButton:@"cashier_close.png" left:((containerView.frame.size.width/2)-(contentView.frame.size.width/2)) top:((containerView.frame.size.height/2)-(contentView.frame.size.height/2)) action:@selector(closeCashier:) delegate:self];
    [contentView setFrame:CGRectMake((containerView.frame.size.width/2)-(contentView.frame.size.width/2), (containerView.frame.size.height/2)-(contentView.frame.size.height/2), contentView.frame.size.width, contentView.frame.size.height)];
    
    //lets add iap buttons
    
    UIButton *restore = [Common makeButton:@"iap_restorepurchases.png" left:0 top:45 action:@selector(restore:) delegate:self];
    [restore setFrame:CGRectMake(((contentView.frame.size.width/2)-(restore.frame.size.width/2))+4, restore.frame.origin.y, restore.frame.size.width, restore.frame.size.height)];
    [contentView addSubview:restore];
    
    int offset = 5;
    UIButton *buychips1 = [Common makeButton:@"iap_button.png" left:25 top:offset+100 action:@selector(buy:) delegate:self];
    buychips1.tag = 1;
    [contentView addSubview:buychips1];
    
    UIButton *buychips2 = [Common makeButton:@"iap_button.png" left:235 top:offset+100 action:@selector(buy:) delegate:self];
    buychips2.tag = 2;
    [contentView addSubview:buychips2];
    
    UIButton *buychips3 = [Common makeButton:@"iap_button.png" left:25 top:offset+155 action:@selector(buy:) delegate:self];
    buychips3.tag = 3;
    [contentView addSubview:buychips3];
    
    UIButton *buychips4 = [Common makeButton:@"iap_button.png" left:235 top:offset+155 action:@selector(buy:) delegate:self];
    buychips4.tag = 4;
    [contentView addSubview:buychips4];
    
    UIButton *buychips5 = [Common makeButton:@"iap_button.png" left:25 top:offset+210 action:@selector(buy:) delegate:self];
    buychips5.tag = 5;
    [contentView addSubview:buychips5];
    
    UIButton *buychips6 = [Common makeButton:@"iap_button.png" left:235 top:offset+210 action:@selector(buy:) delegate:self];
    buychips6.tag = 6;
    [contentView addSubview:buychips6];
    
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
    fChipFontSize = 9;
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
    [placechip.text setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:9]];
    [self addPlacedChip:placechip withInfo:userInfo];
}

-(void)moveChipFromStackToView{
    [super moveChipFromStackToView];
    
    [currentChip.text setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:9]];
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

-(void)claimBonus:(id)sender{
    //[Common showAlert:@"claim" message:@""];

    //add to bankroll and show animation
    [self sendChipsFrom:CGPointMake(!IS_IPHONE_5?95-88:95, 275) to:player_seat[UIAppDelegate.g_seatindex].center];
}

-(void)animatechip:(int)index from:(CGPoint)from to:(CGPoint)to{
    
    Chip *c = [Common makeChipWithSeatIndex:UIAppDelegate.g_seatindex andImage:(NSString*)seatchip[UIAppDelegate.g_seatindex] left:from.x top:from.y];
    [self.view addSubview:c];
    
   
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [c setFrame:CGRectMake(to.x, to.y, c.frame.size.width, c.frame.size.height)];
    } completion:^(BOOL finished) {
        [c removeFromSuperview];
        
        if(index == 0)
            [rifflingChipsPlayer stop];

    }];
    
    index--;
    if(index>=0){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.05f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self animatechip:index from:from to:to];
        });
    }
}

-(void)sendChipsFrom:(CGPoint)from to:(CGPoint)to{
    
     [self playRifflingChips];
    [self animatechip:100 from:from to:to];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    float offset = -232.0f;
    if(!IS_IPHONE_5)
        offset -= 88.0f;
    

    
    initialbackgroundposition = offset;
    //how often we update ball/wheel frames as animating
    updatesPerSecond = 0.05f/7.5f;
    distancetoslots = 45.0f;
    
    ballHeight = 13.0f; //height of ball in pixels
    bSpinWheelInfinite = YES; //keep spinning at all times or not
    angle_per_slice = 360.0f/37.0f; //37 slots on eurpoean
    ball_deceleration_factor = 0.0015f;//how fast the ball decelerates
    
    //y position on where the track starts on the
    //outside of the bowl. We start from the bottom of the graphic
    wheelBowlBallTrackPosition = 252.0f; //pixels where ball is spun from
    
    wheelSlotsYPosition = 207.0f; //pixels where slots are located
    
    //controls how high/low ball bounces on y axis
    //our ball bouncing algorithmm is pretty basic
    //so leaving these as is, is probably best
    ballBounceMinY = wheelSlotsYPosition-16.0f;
    ballBounceMaxY = wheelSlotsYPosition-10.0f;
    
    bDropped = bSettled = NO;
    
    //position of ball on outside. as ball rolls it will
    //continue to get closer to the center of bowl this
    //inward pos is what is used to control how far the ball
    //is positioned from the center of the bowl
    inwardpos = wheelBowlBallTrackPosition-ballHeight;
    
    [header setFrame:CGRectMake(initialbackgroundposition, header.frame.origin.y, header.frame.size.width, header.frame.size.height)];
    //[background setFrame:CGRectMake(initialbackgroundposition, background.frame.origin.y, background.frame.size.width, background.frame.size.height)];
    [background setUserInteractionEnabled:YES];
    //[self.view addSubview:background];
    
    
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(initialbackgroundposition, background.frame.origin.y, background.frame.size.width, background.frame.size.height)];
    [scrollView setDelegate:self];
    [scrollView addSubview:background];
    [self.view addSubview:scrollView];
    [self.view addSubview:header];
    
    wheelOutside = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wheel_outside.png"]];
    [wheelOutside setFrame:CGRectMake(28, 40, wheelOutside.frame.size.width, wheelOutside.frame.size.height)];
    [background addSubview:wheelOutside];
    
    wheelInside = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wheel_inside.png"]];
    [wheelInside setFrame:CGRectMake(28, 40, wheelInside.frame.size.width, wheelInside.frame.size.height)];
    //[wheelInside setBackgroundColor:[UIColor redColor]];
    [background addSubview:wheelInside];
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ballNew.png"]];
    [ball setFrame:CGRectMake(131-(ball.image.size.width/2), inwardpos, ball.image.size.width, ball.image.size.height)];
    
    ballParent = [[UIView alloc] initWithFrame:CGRectMake(28, 40, 262, 262)];
    [ballParent setBackgroundColor:[UIColor clearColor]];
    //[ballParent setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f]];
    [ballParent addSubview:ball];
    [background addSubview:ballParent];

    [self createHistoryList];
    [self createSlotHighlights];
    [self createBetPlaces];
    
    //now that we have set all the variables specific
    //to the iphone and how it needs to be we can now
    //call our initialize function to get going
    [self initializeRoulettePositions];
    
    betLabel = [[UILabel alloc] initWithFrame:CGRectMake(background.frame.size.width-156, 35, 51, 15)];
    [betLabel setText:@"$2,500,000"];
    [betLabel setAdjustsFontSizeToFitWidth:YES];
    [betLabel setFont:[UIFont boldSystemFontOfSize:11]];
    [betLabel setTextColor:[UIColor whiteColor]];
    [betLabel setBackgroundColor:[UIColor clearColor]];
    [background addSubview:betLabel];
    
    winLabel = [[UILabel alloc] initWithFrame:CGRectMake(background.frame.size.width-63, 35, 51, 15)];
    [winLabel setText:@"$4,050,000"];
    [winLabel setAdjustsFontSizeToFitWidth:YES];
    [winLabel setFont:[UIFont boldSystemFontOfSize:11]];
    [winLabel setTextColor:[UIColor whiteColor]];
    [winLabel setBackgroundColor:[UIColor clearColor]];
    [background addSubview:winLabel];
    
   
    
    
    
    BButton *btnSettings = [BButton awesomeButtonWithOnlyIcon:FAIconCog color:[UIColor colorWithRed:28.0/255.0 green:113.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [btnSettings setFrame:CGRectMake([Common currentWidth]-125, 2, 40, 26)];
    [btnSettings addTarget:self action:@selector(options:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSettings];
    
    /*UIButton *lobby = [Common makeButton:@"lobby.png" left:self.view.frame.size.height-80 top:3 action:@selector(lobby:) delegate:self];
    [self.view addSubview:lobby];*/
    
    BButton *btnLobby = [[BButton alloc] initWithFrame:CGRectMake([Common currentWidth]-80, 2, 74, 26) color:[Common makeColorWithRed:219 green:0 blue:0]];
    [btnLobby.titleLabel setFont:[UIFont fontWithName:@"BerlinSansFBDemi-Bold" size:16]];
    [btnLobby setTitle:@"LOBBY" forState:UIControlStateNormal];
    [btnLobby addTarget:self action:@selector(lobby:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLobby];
    
    //AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //NSString *strURL = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large", delegate.g_facebookid];

    for (int i=0; i<4; i++){
        [player_seat[i] setFrame:CGRectMake(10+(i*44), 8, player_seat[i].frame.size.width, player_seat[i].frame.size.height)];
        //[player_seat[i] sd_setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:[UIImage imageNamed:@"avatar1.png"]];
        [player_seat[i] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", @"avatar_empty.png"]]];
        [player_seat[i].layer setCornerRadius:5];
        [player_seat[i].layer setBorderColor:[UIColor redColor].CGColor];
        [player_seat[i] setClipsToBounds:YES];
        

        [player_seat_name[i] setFrame:CGRectMake(10+(i*44), 0, player_seat[i].frame.size.width, 12)];
        [player_seat_name[i] setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:10]];
        
        [player_seat_balance[i] setFrame:CGRectMake(10+(i*44), player_seat[i].frame.size.height, player_seat[i].frame.size.width, 12)];
        [player_seat_balance[i] setFont:[UIFont fontWithName:@"AgencyFB-Reg" size:10]];
        
        
        [self.view addSubview:player_seat[i]];
        [self.view addSubview:player_seat_name[i]];
        [self.view addSubview:player_seat_balance[i]];
    }
    NSLog(@"stick seat: %d", UIAppDelegate.g_seatindex);
    
    [self loadTableData:YES];
    
    //[balance setFrame:CGRectMake(200, 0, balance.frame.size.width, balance.frame.size.height)];
    //[self.view addSubview:balance];
    
    UIView *backview = [[UIView alloc] initWithFrame:CGRectMake(200, 2, 100, 25)];
    [backview setBackgroundColor:[UIColor blackColor]];
    
    bankroll = [[UILabel alloc] initWithFrame:CGRectMake(215, 2, 70, 25)];
    [bankroll setAdjustsFontSizeToFitWidth:YES];
    [bankroll setFont:[UIFont boldSystemFontOfSize:11]];
    [bankroll setTextColor:[UIColor whiteColor]];
    [bankroll setBackgroundColor:[UIColor clearColor]];
    
    bankroll.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getchips:)];
    [bankroll addGestureRecognizer:tapGesture];
    
    [self.view addSubview:backview];
    [self.view addSubview:bankroll];
    
    BButton *btnChips = [[BButton alloc] initWithFrame:CGRectMake(285, 2, 64, 26) color:[Common makeColorWithRed:0 green:144 blue:0]];
    [btnChips.titleLabel setFont:[UIFont fontWithName:@"BerlinSansFBDemi-Bold" size:16]];
    [btnChips setTitle:@"CHIPS" forState:UIControlStateNormal];
    [btnChips addTarget:self action:@selector(getchips:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnChips];
    
    UIImageView *creditchip = [Common makeImage:@"creditchip.png" left:185 top:0];
    [creditchip setUserInteractionEnabled:YES];
    UITapGestureRecognizer *chipTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getchips:)];
    [creditchip addGestureRecognizer:chipTap];
    [self.view addSubview:creditchip];

    
    //UIButton *spin = [Common makeButton:@"spin.png" left:320 top:262 action:@selector(spin:) delegate:self];
    //[background addSubview:spin];
    UIButton *clear = [Common makeButton:@"clear.png" left:671 top:270 action:@selector(clear:) delegate:self];
    [background addSubview:clear];
    UIButton *rebet = [Common makeButton:@"rebet.png" left:734 top:270 action:@selector(rebet:) delegate:self];
    [background addSubview:rebet];
    //UIButton *chips = [Common makeButton:@"morechips.png" left:758 top:270 action:@selector(rebet:) delegate:self];
    //[background addSubview:chips];
    
    //position chips for iphone
    for(int i =0; i<5; i++)
        [chip[i] setFrame:CGRectMake(440+(i*45), 270, chip[i].frame.size.width, chip[i].frame.size.height)];
    
    timeLeft = [[YLProgressBar alloc] initWithFrame:CGRectMake(356, 214, 80, 20)];
    [timeLeft setType:YLProgressBarTypeFlat];
    [timeLeft setProgressTintColor:[UIColor redColor]];
    [timeLeft setHideStripes:YES];
    [timeLeft setProgress:1.0f animated:YES];
    timeLeft.transform =  CGAffineTransformMakeRotation( M_PI * 1.5 );
    
    timeLeftTillBonus = [[UILabel alloc] initWithFrame:CGRectMake(355, 281, 57, 13)];
    [timeLeftTillBonus setBackgroundColor:[UIColor clearColor]];
    [timeLeftTillBonus setText:@"--:--"];
    [timeLeftTillBonus setTextColor:[UIColor whiteColor]];
    [timeLeftTillBonus setFont:[UIFont boldSystemFontOfSize:15]];
    [timeLeftTillBonus setTextAlignment:NSTextAlignmentRight];
    [background addSubview:timeLeftTillBonus];
    [background addSubview:timeLeft];
    
    btnClaimBonus = [Common makeInvisibleButton:320 top:270 width:110 height:50 action:@selector(claimBonus:) delegate:self];
    //[btnClaimBonus setBackgroundColor:[UIColor redColor]];
    [background addSubview:btnClaimBonus];
    
    /*AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString *strURL = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large", delegate.g_facebookid];
    UIImageView *image = [[UIImageView alloc] init];
    [image sd_setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:nil];
    
    [background addSubview:image];*/
    
    //CGPoint bgpos = CGPointMake(btnClaimBonus.frame.origin.x-(background.frame.s.width), 0);
    
    
    
    
    
    //lets ask for the chips placed to be fired
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
