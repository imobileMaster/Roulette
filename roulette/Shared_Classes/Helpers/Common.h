//
//  Common.h
//  expensegenie
//
//  Created by Greg Ellis on 2013-05-28.
//  Copyright (c) 2013 ellis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chip.h"

@interface Common : NSObject{
    
}

+ (float) currentWidth;
+ (float) currentHeight;
+(void)cancelAllLocalNotifications;
+(void)scheduleLocalNotification:(NSDate*)date message:(NSString*)message;

+(NSString*) convertToCurrencyShort:(double)value;

+ (NSString *)getIPAddress;

+(NSString*) convertToCurrency:(double)amount withSymbol:(NSString*)symbol;
+(NSString*) convertToCurrency:(double)amount;
//UI Stuff
+(void) showAlert:(NSString *) title message:(NSString *) msg;
+(UIButton*)makeButton:(NSString*)strImage left:(int)left top:(int)top action:(SEL)action delegate:(id)delegate;
+(UIButton*)makeButton:(NSString*)strImage withSelected:(NSString*)strSelectedImage left:(int)left top:(int)top action:(SEL)action delegate:(id)delegate;
+(UIImageView*)makeImage:(NSString*)strImage left:(int)left top:(int)top;
+(UIButton*)makeInvisibleButton:(int)left top:(int)top width:(int)width height:(int)height action:(SEL)action delegate:(id)delegate;
+(UIButton*)makeButton:(NSString*)strImage withSelected:(NSString*)strSelectedImage andLabel:(NSString*)strText left:(int)left top:(int)top action:(SEL)action delegate:(id)delegate;

+(Chip*)makeChip:(NSString*)strImage left:(int)left top:(int)top;
+(Chip*)makeChipWithSeatIndex:(NSInteger)seatindex andImage:(NSString*)strImage left:(int)left top:(int)top;

    
//General Stuff
+(NSString*)genRandomStringLength:(int)len;
+(int)genRandomNumber:(int)from to:(int)to;
+(BOOL) isEmpty:(id)thing;
+(UIColor*)makeColorWithRed:(int)red green:(int)green blue:(int)blue;
+(UIColor*)makeColorWithRed:(int)red green:(int)green blue:(int)blue alpha:(float)alpha;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

//Date stuff
+(NSDate *)dateForRFC3339DateTimeString:(NSString *)rfc3339DateTimeString;
+(NSString *)dateToString:(NSDate*)date;
+(NSDate *)dateFromString:(NSString*)strDate;
+(NSString *)dateTimeToString:(NSDate *)date;
+(NSDate *)dateTimeFromString:(NSString*)strDate;
+(NSString *)dateToTimeString:(NSDate*)date;

+(BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;
+(NSDate *)getFirstDayOfTheWeekFromDate:(NSDate *)givenDate;
+(NSString *)formattedStringForDurationBetween:(NSDate*)dt1 and:(NSDate*)dt2;

+ (NSString *)timeFormatted:(int)totalSeconds;

+(int)daysBetween:(NSDate*)dt1 and:(NSDate*)dt2;
+(int)yearsBetween:(NSDate*)dt1 and:(NSDate*)dt2;
+(double)hoursBetween:(NSDate*)dt1 and:(NSDate*)dt2;
+(double)secondsBetween:(NSDate*)dt1 and:(NSDate*)dt2;

+(NSDate *)addHours:(int)hours toDate:(NSDate*)date;
+(NSDate *)addDays:(int)days toDate:(NSDate*)date;
+(NSDate *)addMonths:(int)months toDate:(NSDate*)date;
+(NSDate *)addYears:(int)days toDate:(NSDate*)date;

//Image stuff
+(BOOL)saveImageLocally:(UIImage*)image withName:(NSString*)strImageName;
+(UIImage *)urlToImage:(NSString*)url;

@end
