//
//  TaskCell.h
//  WeTaskByConcordia
//
//  Created by XN on 12/25/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskCell : UITableViewCell

@property (nonatomic) BOOL subViewContains;

@property (weak, nonatomic) IBOutlet UIButton *bigCircle;
@property (weak, nonatomic) IBOutlet UIButton *smallCircle;
@property (weak, nonatomic) IBOutlet UILabel *bigTitle;
@property (weak, nonatomic) IBOutlet UILabel *smallTitle;
@property (weak, nonatomic) IBOutlet UILabel *bigDate;
@property (weak, nonatomic) IBOutlet UILabel *smallDate;
@property (nonatomic) Task *cellTask;

- (IBAction)completeTask:(id)sender;
- (IBAction)completeCheckpoint:(id)sender;

@end
