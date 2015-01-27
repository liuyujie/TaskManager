//
//  HPTaskCenter.m
//  snapgrab
//
//  Created by hupeng on 14-10-24.
//  Copyright (c) 2014年 Hu Peng. All rights reserved.
//

#import "HPTaskCenter.h"
#import "HPTaskManager.h"

@implementation HPTaskCenter

+ (HPTaskCenter *)defaultCenter
{
    static HPTaskCenter *instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [[HPTaskCenter alloc] init];
    });
    return instance;
}

- (id)init
{
    if (self = [super init]) {
        [self registerAppTasks];
    }
    return self;
}

- (void)registerAppTasks
{
    NSString *demoTaskKey = @"DemoPeriodicTask";
    NSString *adminUser   = @"Admin";

    
//    // peridic task demo
//    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    NSDateFormatter *_formatter = [[NSDateFormatter alloc] init];
//    [_formatter setDateFormat:@"yyyy-MM-dd"];
//    [_formatter setCalendar:cal];
//    
//    NSDate *fDate = [_formatter dateFromString:@"2015-01-25"];
//    
//
//    [[HPTaskManager defaultManager] registerPeriodicTask:demoTaskKey forUser:adminUser fromDate:fDate duration:10];
//    
//    if ([[HPTaskManager defaultManager] periodicTaskIsValid:demoTaskKey forUser:adminUser]) {
//        NSLog(@"valid task");
//    } else {
//        NSLog(@"invalid task");
//    }
    
    
    [[HPTaskManager defaultManager] registerWeeklyTask:demoTaskKey forUser:adminUser taskTimes:1 onSpecifiedWeekdays:(HPTaskWeekdaySaturday | HPTaskWeekdaySunday)];
    
    
    if ([[HPTaskManager defaultManager] completeTask:demoTaskKey forUser:adminUser onSpecifiedWeekdays:(HPTaskWeekdaySaturday | HPTaskWeekdaySunday)]) {
        NSLog(@"completed weekly task");
    }
    
    
    /*********************************** multi thread demo ***********************************/
   
        /*********************************** error demo ***********************************/
    
    // 1. error register demo
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        for (int i = 0; i < 1; i++) {
//            
//            if ([[HPTaskManager defaultManager] registerNoramlTask:demoTaskKey forUser:adminUser taskTimes:1]) {
//                NSLog(@"register successed");
//            }
//        }
//        
//    });
//    
//    if ([[HPTaskManager defaultManager] registerNoramlTask:demoTaskKey forUser:adminUser taskTimes:1]) {
//        NSLog(@"register successed");
//    }
//
//    // 2.error complete demo
//    
//    [[HPTaskManager defaultManager] registerNoramlTask:demoTaskKey forUser:adminUser taskTimes:1];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        
//        for (int i = 0; i < 1; i++) {
//
//            if ([[HPTaskManager defaultManager] completeTask:demoTaskKey forUser:adminUser taskType:HPTaskTypeNormalTask]) {
//                NSLog(@"complete task successed -- %d" ,i);
//            }
//        }
//        
//    });
//    
//    if ([[HPTaskManager defaultManager] completeTask:demoTaskKey forUser:adminUser taskType:HPTaskTypeNormalTask]) {
//        NSLog(@"complete task successed");
//    }
    
        /*********************************** right demo ***********************************/
    
    // 4. right register demo
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        for (int i = 0; i < 1; i++) {
//            
//            [[HPTaskManager defaultManager] registerNoramlTask:demoTaskKey forUser:adminUser taskTimes:1 withCompletionBlock:^(NSError *error) {
//                
//                if (!error) {
//                    NSLog(@"register successed - global queue");
//                } else {
//                    NSLog(error.domain);
//                }
//            }];
//        }
//        
//    });
//    
//    [[HPTaskManager defaultManager] registerNoramlTask:demoTaskKey forUser:adminUser taskTimes:1 withCompletionBlock:^(NSError *error) {
//        if (!error) {
//            NSLog(@"register successed - main thread");
//        } else {
//            NSLog(error.domain);
//        }
//    }];
    
    // 5.right complete demo
    
//    [[HPTaskManager defaultManager] registerNoramlTask:demoTaskKey forUser:adminUser taskTimes:1];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        
//        for (int i = 0; i < 3; i++) {
//            
//            [[HPTaskManager defaultManager] completeTask:demoTaskKey forUser:adminUser taskType:HPTaskTypeNormalTask withCompletionBlock:^(NSError *error) {
//                if (!error) {
//                     NSLog(@"complete task successed -- %d" ,i);
//                } else {
//                    NSLog(error.domain);
//                }
//            }];
//        }
//        
//    });
//    
//    [[HPTaskManager defaultManager] completeTask:demoTaskKey forUser:adminUser taskType:HPTaskTypeNormalTask withCompletionBlock:^(NSError *error) {
//        if (!error) {
//            NSLog(@"complete task successed -- main thread");
//        } else {
//            NSLog(error.domain);
//        }
//    }];
    
    
    

}



@end