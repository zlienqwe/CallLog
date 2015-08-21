//
//  ReadJson.m
//  CallLog
//
//  Created by Zlien on 8/21/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ReadJson.h"

@implementation ReadJson

-(NSMutableArray*)localfileWithContentsOfJSONString:(NSString*)fileLocation{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    
    NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    return [_callHistoryMapping mappingCallHistoryArray:result];
}

+(void)deleteWithContentsOfJSONString:(NSString*)fileLocation Index:(NSUInteger) index{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSMutableArray *array=[NSMutableArray arrayWithArray:result];
    [array removeObjectAtIndex:index];
    [array writeToFile:filePath atomically:YES];
}
@end
