//
//  Service.h
//  CallLog
//
//  Created by Zlien on 8/21/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadJson.h"
#import "UrlJSON.h"
@interface Service : NSObject

-(NSMutableArray*)readJson:(NSString*)file;
-(void)urlJson:(NSString*)url AsynBack:(Asyn) asynback;

@end
