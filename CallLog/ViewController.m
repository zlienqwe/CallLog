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
#import "Service.h"
#import "ReadPlist.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *callMessageObject;
    NSMutableArray *callLog;
    Service *service;
    UIActivityIndicatorView *activityIndicator;
    ReadPlist *readPlist;
    
}
@end




@implementation ViewController


- (void)viewDidLoad {
    
    service=[Service new];
    readPlist = [ReadPlist new];
    callMessageObject = [service readJson:Local];
    
    [self initView];

    
    
}
-(void)initView
{
    CGRect frame=CGRectMake(8, 65, 350, self.view.frame.size.height-20);
    self.callTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.callTableView.dataSource = self;
    self.callTableView.delegate = self;
    
    CGRect swichframe=CGRectMake(250, 30, 50, 50);
    self.switchbtn=[[UISwitch alloc] initWithFrame:swichframe];
    [self.switchbtn addTarget: self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    

    [self.view addSubview:self.switchbtn];
    
    activityIndicator = [[UIActivityIndicatorView alloc]
                         initWithActivityIndicatorStyle:
                         UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.color = [UIColor blackColor];
    activityIndicator.center =self.view.center;
    
    // activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:self.switchbtn];
    [self.view addSubview:self.callTableView];
    [self.view addSubview:activityIndicator];
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    static NSString *CellWithIdentifier = @"Cell";
    CallHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    
    if (cell == nil) {
        cell = [[CallHistoryCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellWithIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
    }
    
    NSUInteger row = [indexPath row];
    callLogModel *CallLog = (callLogModel*)[callMessageObject objectAtIndex:row];

    cell.callNumber.text = CallLog.callNumber;
    cell.callFrom.text = CallLog.callFrom;
    cell.callTime.text =CallLog.callTime;
    
    return cell;
}







-(void) switchValueChanged:(id)sender{
    [callMessageObject removeAllObjects];
    if (!self.switchbtn.on) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [activityIndicator stopAnimating];
        });
        callMessageObject= [service readJson:Local];
    }
    else{
        [activityIndicator startAnimating];

        NSString *url = [readPlist urlAddress];
        [service urlJson:url
                AsynBack:^(NSURLResponse *response, NSData *data, NSError *error){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [activityIndicator stopAnimating];
                    });
                    if (error) {
                        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"网络错误" message:@"请重试" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil];
                        [alter show];
                    }else{
                        __autoreleasing NSError* error = nil;
                        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
                        
                        CallHistoryMapping *_callHistoryMapping = [[CallHistoryMapping alloc]initWithPhoneNumber:@"phonenumber" And:@"location" And:@"calltime"];
                        
                        callMessageObject=[_callHistoryMapping mappingCallHistoryArray:result];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.callTableView reloadData];
                        });
                    }
                }
         ];
    }
    [self.callTableView reloadData];

    
}


//

-(NSInteger) readySource{

    NSData * callMessageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"callMessage" ofType:@"json"]];

    NSError * error = nil;
    callMessageObject = [NSJSONSerialization JSONObjectWithData:callMessageData options:NSJSONReadingMutableContainers error:&error];
    callLog = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < [callMessageObject count]; index++) {
        callLogModel *model = [[callLogModel alloc]init];
        model.callNumber = [[callMessageObject objectAtIndex:index] objectForKey:@"CallNumber"];
        model.callFrom = [[callMessageObject objectAtIndex:index] objectForKey:@"CallFrom"];
        model.callTime = [[callMessageObject objectAtIndex:index] objectForKey:@"CallTime"];
        [callLog addObject:model];


    }
    return [callMessageObject count];

}




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

