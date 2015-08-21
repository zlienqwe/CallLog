//
//  CallHistoryCell.m
//  CallLog
//
//  Created by Zlien on 8/20/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "CallHistoryCell.h"

@implementation CallHistoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    CGRect callNumF = CGRectMake(5, 0, 230, 64);
    CGRect callFromF = CGRectMake(5, 45, 230, 24);
    CGRect callTimeF = CGRectMake(230, 23, 95, 24);
    
    
    self.callNumber = [[UILabel alloc] initWithFrame:callNumF];
    self.callNumber.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.callNumber];
    
    
    self.callFrom = [[UILabel alloc] initWithFrame:callFromF];
    self.callFrom.textColor = [UIColor redColor];
    self.callFrom.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.callFrom];
    
    self.callTime = [[UILabel alloc] initWithFrame:callTimeF];
    self.callTime.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.callTime];
    
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
