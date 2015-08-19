//
//  callLogModel.h
//  CallLog
//
//  Created by Zlien on 8/19/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface callLogModel : NSObject


@property (copy, nonatomic) NSString * callNumber;
@property (copy, nonatomic) NSString * callFrom;
@property (copy, nonatomic) NSString * callTime;

@end
