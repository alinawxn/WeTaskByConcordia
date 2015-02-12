//
//  APIUrl.h
//  test
//
//  Created by XN on 11/23/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIUrl : NSObject

- (NSURL *)fetchUrlFromString: (NSString *)UrlString;


- (NSString *)paramsComponentsForUserPhoneNumberAPIwithID:(NSString *)id;
- (NSString *)paramsComponentsForUserRegisterAPIwithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password;
- (NSString *)paramsComponentsForUserLoginAPIwithPhoneNumber:(NSString *)phoneNumber password:(NSString *)password;
- (NSString *)paramsComponentsForUserConnectionsAPIwithPhoneNumber:(NSString *)phoneNumber;
- (NSString *)paramsComponentsForAddFriendwithPhoneNumber:(NSString *)phoneNumber acceptor:(NSString *)acceptor acceptoerName:(NSString *)acceptorName;
-(NSString *)paramsComponentsForAddTaskwithPhoneNumber:(NSString *)phoneNumber taskName:(NSString *)taskName deadLine:(NSString *)deadLine taskTaker:(NSString *)taskTaker;
-(NSString *)paramsComponentsForUpdateTaskwithPhoneNumber:(NSString *)phoneNumber taskName:(NSString *)taskName deadLine:(NSString *)deadLine taskTaker:(NSString *)taskTaker taskID:(NSString *)taskID taskFinished:(NSString *)taskFinished;
-(NSString *)paramsComponentsForFinishTaskwithTaskID:(NSString *)taskID taskFinished:(NSString *)taskFinished;

@end
