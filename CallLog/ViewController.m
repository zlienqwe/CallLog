//
//  ViewController.m
//  CallLog
//
//  Created by Zlien on 8/18/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ViewController.h"
#import "callLogModel.h"
#import "CallHistoryCell.h"
#import "UrlJSON.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *callMessageObject;
    NSMutableArray *callLogFrom;
    NSMutableArray *callLogTime;
    NSMutableArray *callLog;
}
@end




@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    callMessageObject = [UrlJSON netfileContentsJSONString:jsonSourceURLAddress];
    
    self.callTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, 320, self.view.frame.size.height-20) style:UITableViewStylePlain];
    
    [self.view addSubview:self.callTableView];
    self.callTableView.dataSource = self;
    self.callTableView.delegate = self;
    
    
    
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    CallHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil) {
        cell = [[CallHistoryCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    NSUInteger row = [indexPath row];
    
    cell.callNumber.text = [[callMessageObject valueForKey:@"phonenumber"] objectAtIndex:row];
    //    cell.textLabel.text=cell.callNumber.text;
    cell.callFrom.text = [[callMessageObject valueForKey:@"location"]objectAtIndex:row];
    cell.callTime.text =[[callMessageObject valueForKey:@"calltime"] objectAtIndex:row];
    
    return cell;
}




//
//
//-(NSInteger) readySource{
//
//    NSData * callMessageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"callMessage" ofType:@"json"]];
//
//    NSError * error = nil;
//    callMessageObject = [NSJSONSerialization JSONObjectWithData:callMessageData options:NSJSONReadingMutableContainers error:&error];
//    callLog = [[NSMutableArray alloc] init];
//    for (NSInteger index = 0; index < [callMessageObject count]; index++) {
//        callLogModel *model = [[callLogModel alloc]init];
//        model.callNumber = [[callMessageObject objectAtIndex:index] objectForKey:@"CallNumber"];
//        model.callFrom = [[callMessageObject objectAtIndex:index] objectForKey:@"CallFrom"];
//        model.callTime = [[callMessageObject objectAtIndex:index] objectForKey:@"CallTime"];
//        [callLog addObject:model];
//
//
//    }
//    return [callMessageObject count];
//
//}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 75;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [callMessageObject count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 从数据源中删除
    [callMessageObject removeObjectAtIndex:indexPath.row];
    
    // 从列表中删除
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

