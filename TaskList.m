//
//  TaskList.m
//  WeTaskByConcordia
//
//  Created by XN on 12/11/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "TaskList.h"
#import "Task.h"
#import "APIUrl.h"
@import UIKit;

@implementation TaskList

-(NSMutableArray *)getTaskList{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSMutableArray *taskList = [[NSMutableArray alloc]init];
    APIUrl *apiurl = [[APIUrl alloc]init];
    
    NSString *taskIDUrl = @"http://115.29.186.78/TaskListID.php";
    NSString *taskStarterUrl = @"http://115.29.186.78/TaskListStarter.php";
    NSString *taskNameUrl = @"http://115.29.186.78/TaskListName.php";
    NSString *deadLineUrl = @"http://115.29.186.78/TaskListDeadLine.php";
    NSString *taskTakerUrl = @"http://115.29.186.78/TaskListTaker.php";
    NSString *taskFinishedUrl = @"http://115.29.186.78/TaskListFinished.php";
    
    NSURL *idurl = [apiurl fetchUrlFromString:taskIDUrl];
    NSURL *starterurl = [apiurl fetchUrlFromString:taskStarterUrl];
    NSURL *nameurl = [apiurl fetchUrlFromString:taskNameUrl];
    NSURL *deadLineurl = [apiurl fetchUrlFromString:deadLineUrl];
    NSURL *takerurl = [apiurl fetchUrlFromString:taskTakerUrl];
    NSURL *finishedurl = [apiurl fetchUrlFromString:taskFinishedUrl];
    
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNumber"];
    NSString *param = [apiurl paramsComponentsForUserConnectionsAPIwithPhoneNumber:phoneNumber];
    
    NSMutableArray *taskID = [self sendHttpRequestConnectionsToUrl:idurl withParam:param];
    NSMutableArray *taskStarter = [self sendHttpRequestConnectionsToUrl:starterurl withParam:param];
    NSMutableArray *taskName = [self sendHttpRequestConnectionsToUrl:nameurl withParam:param];
    NSMutableArray *deadLine = [self sendHttpRequestConnectionsToUrl:deadLineurl withParam:param];
    NSMutableArray *taskTaker = [self sendHttpRequestConnectionsToUrl:takerurl withParam:param];
    NSMutableArray *taskFinished = [self sendHttpRequestConnectionsToUrl:finishedurl withParam:param];
    
    for (int i = 0; i < taskStarter.count; i++) {
        Task *task = [[Task alloc]init];
        task.taskID = [taskID objectAtIndex:i];
        task.taskStarter = [taskStarter objectAtIndex:i];
        task.taskName = [taskName objectAtIndex:i];
        task.deadLine = [dateFormatter dateFromString:[deadLine objectAtIndex:i]];
        task.taskFinished = [taskFinished objectAtIndex:i];
        [task.taskTakerList addObject:[taskTaker objectAtIndex:i]];
        [taskList addObject:task];
    }
    

    return taskList;
}

-(NSMutableArray *)sendHttpRequestConnectionsToUrl:(NSURL *)url withParam:(NSString *)params{
    //create and config a NSURLSession
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    [self customConfig:config];
    //create a post request with url
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod: @"POST"];
    
    //serialize params as json data
    //NSError *error = nil;
    //NSData  *data = [NSJSONSerialization dataWithJSONObject:params options:kNilOptions error:&error];
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    NSError *error;
    NSData *data2 = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error:&error];
    if (!data2)
    {
        NSLog(@"Download Error: %@", error.localizedDescription);
        UIAlertView *alert =
        [[UIAlertView alloc]initWithTitle:@"Error"
                                  message:[NSString stringWithFormat:@"Error : %@",error.localizedDescription]
                                 delegate:self
                        cancelButtonTitle:@"Ok"
                        otherButtonTitles:nil];
        [alert show];
        return nil;
    }else{
        NSString* newStr = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
        NSMutableArray *connections = [self getConnectionsFromString:newStr];
        return connections;
    }
}

//configuration of session
- (void)customConfig: (NSURLSessionConfiguration *)sessionConfig{
    //allow cellular access
    sessionConfig.allowsCellularAccess = YES;
    //set all requests only accept json response
    //[sessionConfig setHTTPAdditionalHeaders:@{@"Content-Type":@"application/json"}];
    [sessionConfig setHTTPAdditionalHeaders:@{@"Accept":@"Application/json"}];
    //others
    sessionConfig.HTTPMaximumConnectionsPerHost = 1;
    sessionConfig.timeoutIntervalForRequest = 60.0;
    sessionConfig.timeoutIntervalForResource = 60.0;
}

-(NSMutableArray *)getConnectionsFromString:(NSString *)connections{
    NSMutableArray *connectionsArray = [[NSMutableArray alloc]init];
    if ([connections containsString:@","]) {
        NSRange range = [connections rangeOfString:@","];
        while (range.location < connections.length-1) {
            NSString *connect = [connections substringToIndex:range.location];
            [connectionsArray addObject:connect];
            connections = [connections substringFromIndex:range.location+1];
            range = [connections rangeOfString:@","];
        }
        NSString *connect = [connections substringToIndex:range.location];
        [connectionsArray addObject:connect];
    }
    return connectionsArray;
}
@end
