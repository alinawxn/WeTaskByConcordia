//
//  Task.h
//  WeTaskByConcordia
//
//  Created by XN on 12/11/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckPointList.h"

@interface Task : NSObject

@property (nonatomic) NSString *taskID;
@property (nonatomic) NSString *taskName;
@property (nonatomic) NSDate *deadLine;
@property (nonatomic) NSMutableArray *taskTakerList;
@property (nonatomic) NSString *taskStarter;
@property (nonatomic) NSString *taskFinished;

@property (nonatomic) CheckPointList *checkPointList;

-(void)saveTaskWithTaskName:(NSString *)taskName deadLine:(NSDate *)deadLine taskTakerList:(NSMutableArray *)taskTakerList;

-(void)changeTaskWithTask:(Task *)task;
@end
