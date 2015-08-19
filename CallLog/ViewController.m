//
//  ViewController.m
//  CallLog
//
//  Created by Zlien on 8/18/15.
//  Copyright (c) 2015 Zlien. All rights reserved.
//

#import "ViewController.h"

#import "callLogModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *callLogNumber;
    NSMutableArray *callLogFrom;
    NSMutableArray *callLogTime;
    NSMutableArray *callLog;
}
@end




@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self readySource];
    self.callTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, 320, self.view.frame.size.height-20) style:UITableViewStylePlain];

    self.callTableView.dataSource = self;
    self.callTableView.delegate=self;
    [self.view addSubview:self.callTableView];
}


-(void) readySource{
    callLogNumber = [[NSMutableArray alloc] initWithObjects:@"123123123123",@"234234234234",@"345345345345",@"456456456456",@"5657567567567",@"678678678678",@"789789789789",@"123123123123",@"234234234234",@"345345345345",@"456456456456",@"5657567567567",@"678678678678",@"789789789789",@"123123123123",@"234234234234",@"345345345345",@"456456456456",@"5657567567567",@"678678678678",@"789789789789",@"890890890890",@"90-90-90-90-", nil];
    
    callLog = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < [callLogNumber count]; index++) {
        callLogModel* model = [[callLogModel alloc] init];
        NSString *callNum;

        callNum = [callLogNumber objectAtIndex:index];
        model.callNumber = [NSString stringWithFormat:@"%@",callNum];
        model.callFrom = @"来源from";
        model.callTime = @"2015-8-01";
        
        
        [callLog addObject:model];
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    callLogModel *model = [callLog objectAtIndex:indexPath.row];
    
    UILabel * callNumber;
    UILabel * callFrom;
    UILabel * callTime;
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        CGRect callNumF = CGRectMake(5, 0, 230, 64);
        callNumber = [[UILabel alloc] initWithFrame:callNumF];
        callNumber.font = [UIFont systemFontOfSize:16];
        [cell addSubview:callNumber];
        
        
        CGRect callFromF = CGRectMake(5, 45, 230, 24);
        callFrom = [[UILabel alloc] initWithFrame:callFromF];
        callFrom.textColor = [UIColor redColor];
        callFrom.font = [UIFont systemFontOfSize:12];
        [cell addSubview:callFrom];
        
        
        CGRect callTimeF = CGRectMake(230, 23, 95, 24);
        callTime = [[UILabel alloc] initWithFrame:callTimeF];
        callTime.font = [UIFont systemFontOfSize:12];

        [cell addSubview:callTime];
        
    }
    
//    callNumber.text =@"ss";
    callNumber.text = model.callNumber;
    callFrom.text = model.callFrom;
    callTime.text = model.callTime;

    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 75;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return callLogNumber.count;
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
    [callLogNumber removeObjectAtIndex:indexPath.row];
    
    // 从列表中删除
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
