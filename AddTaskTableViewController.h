//
//  AddTaskTableViewController.h
//  WeTaskByConcordia
//
//  Created by XN on 12/11/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"
#import "AddTaskTakerTableViewController.h"
#import "CKCalendarView.h"
#import "LineOne.h"
#import "LineTwo.h"
#import "DefaultCellOne.h"


@class AddTaskTableViewController;

@protocol AddTaskTableViewControllerDelegate <NSObject>
- (void)AddTaskTableViewControllerDidCancel:(AddTaskTableViewController *)controller;
- (void)AddTaskTableViewController:(AddTaskTableViewController *)controller didFinishAddingTask:(Task *)task;
- (void)AddTaskTableViewController:(AddTaskTableViewController *)controller didFinishEditingTask:(Task *)task;
@end

@interface AddTaskTableViewController : UITableViewController<AddTaskTakerTableViewDelegate>

@property (nonatomic, weak) id <AddTaskTableViewControllerDelegate> delegate;
@property (nonatomic, strong) Task *taskToEdit;
@property (nonatomic) BOOL sliderShow;
@property(nonatomic) BOOL calendarFlag,dateFlag;
@property (nonatomic) BOOL coplayerShow;
@property (nonatomic) UIView *sliderBack;
@property (nonatomic) UIView *coplayerBack;
@property(nonatomic, strong) CKCalendarView *calendar;
@property (nonatomic) NSString *taskTakerListStr;
@property (nonatomic) NSInteger stepNum;

@property (nonatomic) LineOne *lineOne;
@property (nonatomic) LineTwo *lineTwo;
@property (nonatomic) DefaultCellOne *defaultCellOne, *newcell;
@property (nonatomic) UITableViewCell *justCell;
@property (nonatomic) UIButton *addStep;

@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(nonatomic, strong) NSDate *selectedDate;
@property(nonatomic, strong) NSDate *minimumDate;
@property (nonatomic) NSString *taskname;

@property (strong,nonatomic) NSMutableArray *taskTakerArray;

//@property (weak, nonatomic) IBOutlet UITextField *taskTaker;
@property (nonatomic) UITextView *taskTaker;
//@property (weak, nonatomic) IBOutlet UISlider *slideValue;
@property (nonatomic) UISlider *slideValue;

- (IBAction)showCoplayer:(id)sender;
- (IBAction)showSlide:(id)sender;
- (IBAction)deleteOneTaker:(id)sender;
- (IBAction)calendar:(id)sender;
- (IBAction)addContact:(id)sender;
- (IBAction)cancel;
- (IBAction)done;
- (IBAction)DateEndEditing;
@end
