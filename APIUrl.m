//
//  APIUrl.m
//  test
//
//  Created by XN on 11/23/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "APIUrl.h"

@implementation APIUrl

#pragma mark - urlForAPIs
- (NSURL *)fetchUrlFromString: (NSString *)UrlString{
    return [NSURL URLWithString:UrlString];
}

#pragma mark - paramsComponentsForAPIs
- (NSString *)paramsComponentsForUserPhoneNumberAPIwithID:(NSString *)id{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"id=", id, nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

- (NSString *)paramsComponentsForUserRegisterAPIwithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"phoneNumber=", phoneNumber,@"&password=", password, nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

- (NSString *)paramsComponentsForUserLoginAPIwithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"phoneNumber=", phoneNumber,@"&password=", password, nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

- (NSString *)paramsComponentsForUserConnectionsAPIwithPhoneNumber:(NSString *)phoneNumber{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"phoneNumber=", phoneNumber, nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

- (NSString *)paramsComponentsForAddFriendwithPhoneNumber:(NSString *)phoneNumber acceptor:(NSString *)acceptor acceptoerName:(NSString *)acceptorName{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"phoneNumber=", phoneNumber, @"&acceptor=", acceptor,@"&acceptorName=",acceptorName,nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

-(NSString *)paramsComponentsForAddTaskwithPhoneNumber:(NSString *)phoneNumber taskName:(NSString *)taskName deadLine:(NSString *)deadLine taskTaker:(NSString *)taskTaker{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"phoneNumber=", phoneNumber, @"&taskName=", taskName, @"&deadLine=", deadLine, @"&taskTaker=", taskTaker, nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

-(NSString *)paramsComponentsForUpdateTaskwithPhoneNumber:(NSString *)phoneNumber taskName:(NSString *)taskName deadLine:(NSString *)deadLine taskTaker:(NSString *)taskTaker taskID:(NSString *)taskID taskFinished:(NSString *)taskFinished{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"phoneNumber=", phoneNumber, @"&taskName=", taskName, @"&deadLine=", deadLine, @"&taskTaker=", taskTaker, @"&taskID=", taskID, @"&taskFinished=", taskFinished, nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

-(NSString *)paramsComponentsForFinishTaskwithTaskID:(NSString *)taskID taskFinished:(NSString *)taskFinished{
    NSArray *paramArray = [[NSArray alloc]initWithObjects:@"taskID=",taskID, @"&taskFinished=",taskFinished, nil];
    NSString *param = [paramArray componentsJoinedByString:@""];
    return param;
}

@end
