//
//  Contact.m
//  WeTaskByConcordia
//
//  Created by XN on 12/7/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "Contact.h"
#import "APIUrl.h"
@import UIKit;

@implementation Contact

-(NSString *)saveContactWithAcceptor:(NSString *)acceptor acceptorName:(NSString *)acceptorName{
    APIUrl *apiurl = [[APIUrl alloc]init];
    NSString *addFriendUrl = @"http://115.29.186.78/addFriend.php";
    NSURL *url = [apiurl fetchUrlFromString:addFriendUrl];
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNumber"];
    NSString *param = [apiurl paramsComponentsForAddFriendwithPhoneNumber:phoneNumber acceptor:acceptor acceptoerName:acceptorName];
    NSString *respond = [self sendHttpRequestAddFriendToUrl:url withParam:param];
    return respond;
}

-(NSMutableArray *)ContactNameList{
    NSMutableArray *contactNameList = [[NSMutableArray alloc]init];
    APIUrl *apiurl = [[APIUrl alloc]init];
    NSString *friendListUrl = @"http://115.29.186.78/FriendList.php";
    NSURL *url = [apiurl fetchUrlFromString:friendListUrl];
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNumber"];
    NSString *param = [apiurl paramsComponentsForUserConnectionsAPIwithPhoneNumber:phoneNumber];
    contactNameList = [self sendHttpRequestConnectionsToUrl:url withParam:param];
    return contactNameList;
}

-(NSMutableArray *)ContactNumberList{
    NSMutableArray *contactNumberList = [[NSMutableArray alloc]init];
    APIUrl *apiurl = [[APIUrl alloc]init];
    NSString *friendListUrl = @"http://115.29.186.78/FriendNumberList.php";
    NSURL *url = [apiurl fetchUrlFromString:friendListUrl];
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"phoneNumber"];
    NSString *param = [apiurl paramsComponentsForUserConnectionsAPIwithPhoneNumber:phoneNumber];
    contactNumberList = [self sendHttpRequestConnectionsToUrl:url withParam:param];
    return contactNumberList;
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

//使用了将用户的联系人的名字连成一个字符串的方法，读取联系人的时候将字符串拆开。方法不太好。
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


-(NSString *)sendHttpRequestAddFriendToUrl:(NSURL *)url withParam:(NSString *)params{
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
        return nil;

    }else{
        NSString* newStr = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
        return newStr;
//        if ([newStr  isEqual: @"exist"]) {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该用户已添加至联系人列表，无需重复添加" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
//            [alert show];
//        }else{
//            NSLog(@"succeed");
//        }
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
