//
//  ViewController.h
//  CallLog
//
//  Created by Zlien on 8/18/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *callTableView;
@property (nonatomic, assign) CGRect tableViewFrame;
@property (nonatomic) UISwitch *switchbtn;
@property (nonatomic) NSMutableArray *dataList;

@end

