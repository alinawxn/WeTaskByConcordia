//
//  Task.m
//  WeTaskByConcordia
//
//  Created by XN on 12/11/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "Task.h"
#import "APIUrl.h"
#import "Contact.h"
@import UIKit;

@implementation Task

//上传新任务至数据库
-(void)saveTaskWithTaskName:(NSString *)taskName deadLine:(NSDate *)deadLine taskTakerList:(NSMutableArray *)taskTakerList{
    APIUrl *apiurl = [[APIUrl alloc]init];
    NSString *addFriendUrl = @"http://115.29.186.78/addTask.php";
    NSURL *url = [apiurl fetchUrlFromString:addFriendUrl];
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNumber"];
    if(deadLine == nil){
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:deadLine];
    for (int i = 0; i<taskTakerList.count; i++) {
        Contact *contact = [taskTakerList objectAtIndex:i];
        NSString *param = [apiurl paramsComponentsForAddTaskwithPhoneNumber:phoneNumber taskName:taskName deadLine:dateString taskTaker:contact.acceptor];
        [self sendHttpRequestAddTaskToUrl:url withParam:param];
    }
}

//修改任务
-(void)changeTaskWithTask:(Task *)task{
    APIUrl *apiurl = [[APIUrl alloc]init];
    NSString *updateTaskUrl = @"http://115.29.186.78/UpdateTask.php";
    NSURL *url = [apiurl fetchUrlFromString:updateTaskUrl];
    NSString *param = [apiurl paramsComponentsForFinishTaskwithTaskID:task.taskID taskFinished:task.taskFinished];
    [self sendHttpRequestAddTaskToUrl:url withParam:param];
}

-(void)sendHttpRequestAddTaskToUrl:(NSURL *)url withParam:(NSString *)params{
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"不能联网，请重试" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
        [alert show];
        
    }else{
        NSString *ST = [[NSString alloc]initWithData:data2 encoding:NSASCIIStringEncoding];
        NSLog(@"%@", ST);
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


@end
