//
//  CallHistoryMapping.m
//  CallLog
//
//  Created by Zlien on 8/21/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CallHistoryMapping.h"

@interface CallHistoryMapping(){
@private NSString* _phoneNumber;
@private NSString* _callFrom;
@private NSString* _callTime;
}
@end

@implementation CallHistoryMapping

-(CallHistoryMapping*)initWithPhoneNumber:(NSString*) phoneNumber And:(NSString*) callFrom And:(NSString*) callTime{
    if ((self = [super init])) {
        _phoneNumber = phoneNumber;
        _callFrom = callFrom;
        _callTime = callTime;
    }
    return self;
}
-(NSMutableArray*)mappingCallHistoryArray:(NSArray*)callHistoryArray{
    NSMutableArray *array= [[NSMutableArray alloc]init];
    [callHistoryArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        callLogModel *callLog = [self mappingCallHistory:obj];
        [array addObject:callLog];
    }];
    return array;
}
-(callLogModel*) mappingCallHistory:(NSDictionary*)callHistoryData{
    callLogModel *callLog = [callLogModel new];
    callLog.callNumber = [callHistoryData objectForKey:_phoneNumber];
    callLog.callFrom = [callHistoryData objectForKey:_callFrom];
    callLog.callTime = [callHistoryData objectForKey:_callTime];
    return callLog;

}


@end
