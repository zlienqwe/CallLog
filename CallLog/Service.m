//
//  Service.m
//  CallLog
//
//  Created by Zlien on 8/21/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "Service.h"
#import "CallHistoryMapping.h"

@implementation Service


-(NSMutableArray*)readJson:(NSString*)file
{
    ReadJson *readJson = [ReadJson new];
    readJson.callHistoryMapping = [[CallHistoryMapping alloc]initWithPhoneNumber:@"CallNumber" And:@"CallFrom" And:@"CallTime"];
    return [readJson localfileWithContentsOfJSONString:file];
}

-(void)urlJson:(NSString*)url AsynBack:(Asyn) asynback
{
    [[UrlJSON new] netfileWithContentsOfJSONString:url AsynBack:asynback];
}

@end
