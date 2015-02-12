//
//  TaskListTableViewController.h
//  WeTaskByConcordia
//
//  Created by XN on 12/11/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskTableViewController.h"

@interface TaskListTableViewController : UITableViewController<AddTaskTableViewControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) NSMutableArray *taskList;
@property (nonatomic) NSMutableArray *pastTask;
@property (nonatomic) NSMutableArray *todayTask;
@property (nonatomic) NSMutableArray *tomorrowTask;
@property (nonatomic) NSMutableArray *futureTask;
@property (nonatomic) NSMutableArray *finishedTask;

@property (nonatomic) Task *cellTask;

@property (nonatomic) BOOL sec1open;
@property (nonatomic) BOOL sec2open;
@property (nonatomic) BOOL sec3open;
@property (nonatomic) BOOL sec4open;
@property (nonatomic) BOOL sec5open;
@property (nonatomic) NSMutableArray *subviewContains;

@property (nonatomic) UIButton *bigCircle;

@end
