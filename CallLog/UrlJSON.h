//
//  UrlJSON.h
//  CallLog
//
//  Created by Zlien on 8/20/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlJSON : NSObject

+(NSMutableArray *)netfileContentsJSONString:(NSString*)jsonUrl;

@end
