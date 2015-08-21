//
//  ReadJson.h
//  CallLog
//
//  Created by Zlien on 8/21/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CallHistoryMapping.h"

@interface ReadJson : NSObject

@property CallHistoryMapping *callHistoryMapping;

-(NSMutableArray*)localfileWithContentsOfJSONString:(NSString*)fileLocation;
+(void)deleteWithContentsOfJSONString:(NSString*)fileLocation Index:(NSUInteger) index;
@end
