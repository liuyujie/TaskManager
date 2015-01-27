//
//  ILS.m
//  snapgrab
//
//  Created by hupeng on 14-10-24.
//  Copyright (c) 2014年 Hu Peng. All rights reserved.
//

#import "NSDate+DateKit.h"

@implementation NSDate (DateKit)

- (BOOL)inSameWeek:(NSDate *)date
{
    if (!self) {
        return FALSE;
    }
    return [date getWeekIndex] == [self getWeekIndex];
}


- (NSInteger)getWeekIndex
{
    NSCalendar *cal = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = [cal components:NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday fromDate:self];
    
    if (comps.weekday == 1) {
        return comps.weekOfYear - 1;
    } else {
        return comps.weekOfYear;
    }
}

@end
