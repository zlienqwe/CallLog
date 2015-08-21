//
//  CallHistoryMapping.h
//  CallLog
//
//  Created by Zlien on 8/21/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "callLogModel.h"


@interface CallHistoryMapping : NSObject

-(CallHistoryMapping*)initWithPhoneNumber:(NSString*) phoneNumber And:(NSString*) callFrom And:(NSString*) callTime;
-(NSMutableArray*)mappingCallHistoryArray:(NSArray*)callHistoryArray;
-(callLogModel*) mappingCallHistory:(NSDictionary*)callHistoryData;

@end
