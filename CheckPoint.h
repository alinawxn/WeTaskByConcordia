//
//  CheckPoint.h
//  WeTaskByConcordia
//
//  Created by XN on 1/8/15.
//  Copyright (c) 2015 Concordia InforTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckPoint : NSObject

@property (nonatomic) NSString *id;
@property (nonatomic) NSString *taskID;
@property (nonatomic) NSString *descritption;
@property (nonatomic) NSDate *deadLine;
@property (nonatomic) NSMutableArray *taskTakerList;
@property (nonatomic) NSString *taskStarter;
@property (nonatomic) NSString *taskFinished;

@end
