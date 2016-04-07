//
//  Common.m
//  expensegenie
//
//  Created by Greg Ellis on 2013-05-28.
//  Copyright (c) 2013 ellis. All rights reserved.
//

#import "Common.h"
#include <ifaddrs.h>
#include <arpa/inet.h>

@implementation Common

+ (float) currentWidth
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    int width = size.width;
    int height = size.height;
    float w = (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))? MAX (width, height) : MIN (width, height);
    //NSLog(@"the width is: %f", w);
    return w;
}

+ (float) currentHeight
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    int width = size.width;
    int height = size.height;
    float h = (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))? MIN (width, height) : MAX (width, height);
    //NSLog(@"the width is: %f", w);
    return h;
}

+(void)cancelAllLocalNotifications{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

+(void)scheduleLocalNotification:(NSDate*)date message:(NSString*)message{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay: 3];
    [components setMonth: 7];
    [components setYear: 2013];
    [components setHour:[self genRandomNumber:17 to:20]];
    [components setMinute: [self genRandomNumber:1 to:59]];
    [components setSecond: 0];
    [calendar setTimeZone: [NSTimeZone defaultTimeZone]];
    NSDate *dateToFire = [calendar dateFromComponents:components];
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = dateToFire;
    localNotification.alertBody = message;
    localNotification.alertAction = @"get your free credits";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    localNotification.repeatInterval = NSDayCalendarUnit;
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

+(NSString*) convertToCurrencyShort:(double)value{
    NSNumberFormatter *nformat = [[NSNumberFormatter alloc] init];
    [nformat setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [nformat setCurrencySymbol:@""];
    [nformat setNumberStyle:NSNumberFormatterCurrencyStyle];
    double doubleValue = value;
    NSString *stringValue = nil;
    NSArray *abbrevations = [NSArray arrayWithObjects:@"K", @"M", @"B", @"T", nil] ;
    
    if(doubleValue < 1000.0f){
        stringValue = [NSString stringWithFormat:@"%d", (int)value];
        return stringValue;
    }
    
    for (NSString *s in abbrevations)
    {
        
        doubleValue /= 1000.0 ;
        
        if ( doubleValue < 1000.0 )
        {
            
            if ( (long long)doubleValue % (long long) 100 == 0 ) {
                [nformat setMaximumFractionDigits:0];
            } else {
                [nformat setMaximumFractionDigits:1];
            }
            
            stringValue = [NSString stringWithFormat: @"%@", [nformat stringFromNumber: [NSNumber numberWithDouble: doubleValue]] ];
            NSUInteger stringLen = [stringValue length];
            
            if ( [stringValue hasSuffix:@".00"] )
            {
                // Remove suffix
                stringValue = [stringValue substringWithRange: NSMakeRange(0, stringLen-3)];
            } else if ( [stringValue hasSuffix:@".0"] ) {
                
                // Remove suffix
                stringValue = [stringValue substringWithRange: NSMakeRange(0, stringLen-2)];
                
            } else if ( [stringValue hasSuffix:@"0"] ) {
                
                // Remove suffix
                stringValue = [stringValue substringWithRange: NSMakeRange(0, stringLen-1)];
            }
            
            
            // Add the letter suffix at the end of it
            stringValue = [stringValue stringByAppendingString: s];
            
            //stringValue = [NSString stringWithFormat: @"%@%@", [nformat stringFromNumber: [NSNumber numberWithDouble: doubleValue]]  , s] ;
            break ;
        }
    }
    
    NSLog(@"Cash = %@", stringValue);
    return stringValue;
}

+ (NSString *)getIPAddress {
    
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}

+(NSString*) convertToCurrency:(double)amount withSymbol:(NSString*)symbol{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    [formatter setGroupingSeparator:groupingSeparator];
    [formatter setCurrencySymbol:symbol];
    [formatter setMaximumFractionDigits:2];
    [formatter setUsesGroupingSeparator:YES];
    
    NSString *formattedString = [formatter stringFromNumber:[NSDecimalNumber numberWithDouble:amount]];
    return formattedString;
}

+(NSString*) convertToCurrency:(double)amount{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    [formatter setGroupingSeparator:groupingSeparator];
    [formatter setCurrencySymbol:@"$"];
    [formatter setMaximumFractionDigits:2];
    [formatter setUsesGroupingSeparator:YES];
    
    NSString *formattedString = [formatter stringFromNumber:[NSDecimalNumber numberWithDouble:amount]];
    return formattedString;
}

+(UIColor*)makeColorWithRed:(int)red green:(int)green blue:(int)blue alpha:(float)alpha{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+(UIColor*)makeColorWithRed:(int)red green:(int)green blue:(int)blue{
    return [self makeColorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""]; // remove the #
    NSScanner *scanner = [NSScanner scannerWithString:noHashString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]]; // remove + and $
    

    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

+(void) showAlert:(NSString *)title message:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alert show];
}

+(UIButton*)makeButton:(NSString*)strImage left:(int)left top:(int)top action:(SEL)action delegate:(id)delegate{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgButton = [UIImage imageNamed:strImage];
    [button setBackgroundImage:imgButton forState:UIControlStateNormal];
    button.frame = CGRectMake(left, top, imgButton.size.width, imgButton.size.height);
    [button addTarget:delegate action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton*)makeButton:(NSString*)strImage withSelected:(NSString*)strSelectedImage left:(int)left top:(int)top action:(SEL)action delegate:(id)delegate{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgButton = [UIImage imageNamed:strImage];
    [button setBackgroundImage:imgButton forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:strSelectedImage] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(left, top, imgButton.size.width, imgButton.size.height);
    [button addTarget:delegate action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(UIButton*)makeButton:(NSString*)strImage withSelected:(NSString*)strSelectedImage andLabel:(NSString*)strText left:(int)left top:(int)top action:(SEL)action delegate:(id)delegate{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgButton = [UIImage imageNamed:strImage];
    [button setBackgroundImage:imgButton forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:strSelectedImage] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(left, top, imgButton.size.width, imgButton.size.height);
    [button addTarget:delegate action:action forControlEvents:UIControlEventTouchUpInside];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, button.frame.size.width, button.frame.size.height)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont boldSystemFontOfSize:15]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:strText];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    [button addSubview:label];
    
    return button;
}

+(UIButton*)makeInvisibleButton:(int)left top:(int)top width:(int)width height:(int)height action:(SEL)action delegate:(id)delegate{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(left, top, width, height);
    [button addTarget:delegate action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+(UIImageView*)makeImage:(NSString*)strImage left:(int)left top:(int)top{
    UIImage *imgImage = [UIImage imageNamed:strImage];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:imgImage];
    [imageView setUserInteractionEnabled:YES];
    imageView.frame = CGRectMake(left, top, imgImage.size.width, imgImage.size.height);
    return imageView;
}

+(Chip*)makeChip:(NSString*)strImage left:(int)left top:(int)top{
    UIImage *imgImage = [UIImage imageNamed:strImage];
    Chip *imageView = [[Chip alloc] initWithImage:imgImage];
    [imageView setUserInteractionEnabled:YES];
    imageView.frame = CGRectMake(left, top, imgImage.size.width, imgImage.size.height);
    return imageView;
}

+(Chip*)makeChipWithSeatIndex:(NSInteger)seatindex andImage:(NSString*)strImage left:(int)left top:(int)top{
    UIImage *imgImage = [UIImage imageNamed:strImage];
    Chip *imageView = [[Chip alloc] initWithImage:imgImage];
    imageView.seatindex = seatindex;
    [imageView setUserInteractionEnabled:YES];
    imageView.frame = CGRectMake(left, top, imgImage.size.width, imgImage.size.height);
    return imageView;

}

+(NSString *) genRandomStringLength: (int) len
{
    NSString *letters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++)
        [randomString appendFormat: @"%c", [letters characterAtIndex: rand()%[letters length]]];
    
    return randomString;
}

+(int)genRandomNumber:(int)from to:(int)to{
    return (int)from + arc4random() % (to-from+1);
}

+(BOOL) isEmpty:(id)thing{
    return thing == nil
    || [thing isKindOfClass:[NSNull class]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

+(NSDate *)dateForRFC3339DateTimeString:(NSString *)rfc3339DateTimeString {
    
    NSDateFormatter *rfc3339DateFormatter = [[NSDateFormatter alloc] init];
    
    [rfc3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"];
    [rfc3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    // Convert the RFC 3339 date time string to an NSDate.
    NSDate *result = [rfc3339DateFormatter dateFromString:rfc3339DateTimeString];
    return result;
}

+(NSString*)dateToString:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];
	NSString *currentdate = [dateFormatter stringFromDate:date];
    return currentdate;
}

+(NSDate *)dateFromString:(NSString*)strDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [[NSDate alloc] init];
    date = [dateFormatter dateFromString:strDate];
    return date;
}

+(NSString*)dateTimeToString:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSString *currentdate = [dateFormatter stringFromDate:date];
    return currentdate;
}

+(NSDate *)dateTimeFromString:(NSString*)strDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [[NSDate alloc] init];
    date = [dateFormatter dateFromString:strDate];
    return date;
}

+(NSString*)dateToTimeString:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"HH:mm:ss"];
	NSString *currentdate = [dateFormatter stringFromDate:date];
    return currentdate;
}

+(NSDate *)getFirstDayOfTheWeekFromDate:(NSDate *)givenDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // Find Sunday for the given date
    NSDateComponents *components = [calendar components:NSYearForWeekOfYearCalendarUnit |NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:givenDate];
    [components setWeekday:1]; // 1 == Sunday, 7 == Saturday
    [components setWeek:[components week]];
    
    return [calendar dateFromComponents:components];
}

+(NSString *)formattedStringForDurationBetween:(NSDate*)dt1 and:(NSDate*)dt2{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:dt1 toDate:dt2 options:0];
    
    return [NSString stringWithFormat:@"%dy, %dd, %dh, %dm, %ds", [components year], [components day], [components hour], [components minute], [components second]];
}

+ (NSString *)timeFormatted:(int)totalSeconds{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;

    
    return [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}

+(NSDate *)addHours:(int)hours toDate:(NSDate*)date{
    
    NSTimeInterval seconds = hours * 60 * 60;
    return [date dateByAddingTimeInterval:seconds];
}

+(NSDate *)addDays:(int)days toDate:(NSDate*)date{
    NSDateComponents *daycomp = [[NSDateComponents alloc] init];
    daycomp.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:daycomp toDate:date options:0];
}

+(NSDate *)addMonths:(int)months toDate:(NSDate*)date{
    NSDateComponents *monthcomp = [[NSDateComponents alloc] init];
    monthcomp.month = months;
    return [[NSCalendar currentCalendar] dateByAddingComponents:monthcomp toDate:date options:0];
}

+(NSDate *)addYears:(int)days toDate:(NSDate*)date{
    NSDateComponents *yearcomp = [[NSDateComponents alloc] init];
    yearcomp.year = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:yearcomp toDate:date options:0];
}

+ (BOOL) date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate {
    return (([date compare:beginDate] != NSOrderedAscending) && ([date compare:endDate] != NSOrderedDescending));
}

+(int)daysBetween:(NSDate*)dt1 and:(NSDate*)dt2{
    NSUInteger uintFlags = NSDayCalendarUnit;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:uintFlags fromDate:dt1 toDate:dt2 options:0];
    return [components day]+2;
}

+(int)yearsBetween:(NSDate*)dt1 and:(NSDate*)dt2{
    NSUInteger uintFlags = NSYearCalendarUnit;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:uintFlags fromDate:dt1 toDate:dt2 options:0];
    return [components year];
}

+(double)hoursBetween:(NSDate*)dt1 and:(NSDate*)dt2{
    NSTimeInterval distance = [dt1 timeIntervalSinceDate:dt2];
    double secondsInAnHour = 3600.0f;
    return fabs(distance / secondsInAnHour);
}

+(double)secondsBetween:(NSDate*)dt1 and:(NSDate*)dt2{
    NSTimeInterval distance = [dt1 timeIntervalSinceDate:dt2];
    return fabs(distance);
}

+(BOOL)saveImageLocally:(UIImage*)image withName:(NSString*)strImageName{
    BOOL bSuccess = YES;
    NSData* imageData = UIImagePNGRepresentation(image);
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [docsDir stringByAppendingPathComponent:strImageName];
    
    NSError *error = nil;
    [imageData writeToFile:path options:NSDataWritingAtomic error:&error];
    if(error!=nil)
        bSuccess = NO;
    
    return bSuccess;
}

+(UIImage *)urlToImage:(NSString*)url{
    UIImage *result;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    result = [UIImage imageWithData:data];
    return result;
}
@end
