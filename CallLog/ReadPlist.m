//
//  ReadPlist.m
//  CallLog
//
//  Created by Zlien on 8/21/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ReadPlist.h"

@implementation ReadPlist
-(NSString *) urlAddress{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"URL" ofType:@"plist"];
    NSLog(@"%@",plistPath);
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *urlProtocal = [data objectForKey:@"protocal"];
    NSString *urlDomain = [data objectForKey:@"domain"];
    NSString *urlMappingCallHistory = [[data objectForKey:@"mapping"] objectForKey:@"callHistory"];
    NSString *url = [[urlProtocal stringByAppendingString:urlDomain] stringByAppendingString:urlMappingCallHistory];
    return url;
}
@end
