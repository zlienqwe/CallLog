//
//  UrlJSON.m
//  CallLog
//
//  Created by Zlien on 8/20/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "UrlJSON.h"

@implementation UrlJSON
+(NSMutableArray *)netfileContentsJSONString:(NSString*)jsonUrl{
    
    NSURL *url = [NSURL URLWithString:jsonUrl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval:60.0f];
    NSError *error = [NSError new];
    NSURLResponse *response = [NSURLResponse new];
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:&response
                                                             error:&error];
    
    
    
    NSMutableArray *jsonToDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSLog(@"!!!!!!!!!!!!");
    return [NSMutableArray arrayWithArray:jsonToDictionary];
}

@end
