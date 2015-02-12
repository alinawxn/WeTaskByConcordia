//
//  AddTaskTableViewController.m
//  WeTaskByConcordia
//
//  Created by XN on 12/11/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "AddTaskTableViewController.h"


@interface AddTaskTableViewController ()

@end

@implementation AddTaskTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加任务执行人时的小按钮。
    //self.addTaskTaker.hidden = YES;
    self.stepNum = 1;
    
    //显示部件flags
    self.calendarFlag = NO;
    self.sliderShow = NO;
    self.coplayerShow = NO;
    
    //分配空间
    self.taskTakerArray = [[NSMutableArray alloc]init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 部件-一步
-(IBAction)doneOneStep:(id)sender{
    [self.addStep setEnabled:YES];
}

- (IBAction)addOneStep:(id)sender{
    NSLog(@"ADD");
    self.stepNum++;
    NSIndexPath *newpath =[NSIndexPath indexPathForRow:self.stepNum + 1 inSection:0];
    NSArray *ar = [[NSArray alloc]initWithObjects:newpath, nil];
    [self.tableView insertRowsAtIndexPaths:ar withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.addStep setEnabled:NO];
    //[self.tableView reloadData];
}

-(IBAction)deleteOneStep:(id)sender{
    self.stepNum--;
    NSIndexPath *newpath =[NSIndexPath indexPathForRow:self.newcell.tag inSection:0];
    NSArray *ar = [[NSArray alloc]initWithObjects:newpath, nil];
    [self.tableView deleteRowsAtIndexPaths:ar withRowAnimation:UITableViewRowAnimationFade];
    [self.addStep setEnabled:YES];
}

#pragma mark -  部件-任务名
- (IBAction)finishEditing:(id)sender{
    self.taskname = self.lineOne.taskName.text;
}

#pragma mark -  部件-日历
//日历-----------------------------------
- (IBAction)calendar:(id)sender {
    //日历未打开时，打开日历，并关闭键盘
    if (self.calendarFlag == NO && self.sliderShow == NO && self.coplayerShow == NO) {
        [self calendarView];
        [self.view endEditing:YES];
        self.calendarFlag = YES;
    }else if(self.calendarFlag == YES){//日历打开时，关闭日历
        [self.calendar setHidden:YES];
        self.calendarFlag = NO;
    }
}

-(void)calendarView{
    self.calendar = [[CKCalendarView alloc] init];
    [self.view addSubview:self.calendar];
    self.calendar.delegate = self;
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    self.minimumDate = [self.dateFormatter dateFromString:@"20/09/2012"];
    
    self.calendar.onlyShowCurrentMonth = NO;
    self.calendar.adaptHeightToNumberOfWeeksInMonth = YES;
    
    self.calendar.frame = CGRectMake(self.view.frame.size.width/2-150,self.lineTwo.calendarButton.frame.origin.y + 120, 300, 320);
    [self.view addSubview:self.calendar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
}

- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    self.lineTwo.taskDate.text = [self.dateFormatter stringFromDate:date];
    self.defaultCellOne.stepDate.text = self.lineTwo.taskDate.text;
    [self.calendar setHidden:YES];
    self.calendarFlag = NO;
    self.selectedDate = date;
    [self DateEndEditing];
}

//Date
- (IBAction)DateEndEditing{
    NSDate *todayDate = [NSDate date];
    NSString *todayStr = [self.dateFormatter stringFromDate:todayDate];
    NSString *selectedStr = [self.dateFormatter stringFromDate:self.selectedDate];
    
    //today比选定时间晚
    if ([todayStr isEqualToString:selectedStr]) {
        self.lineTwo.taskDate.layer.borderWidth = 0;
        self.dateFlag = YES;
    }
    else if ([todayDate compare:self.selectedDate] == NSOrderedAscending) {
        self.lineTwo.taskDate.layer.borderWidth = 0;
        self.dateFlag = YES;
    }else{//today比选定时间早
        self.lineTwo.taskDate.layer.borderWidth = 1;
        self.lineTwo.taskDate.layer.borderColor = [[UIColor redColor] CGColor];
        self.dateFlag = NO;
    }
}

#pragma mark - 部件-人头
- (IBAction)showCoplayer:(id)sender {
    if (self.sliderShow == NO && self.calendarFlag == NO && self.coplayerShow == NO){
        //新view
        self.coplayerBack = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, self.lineTwo.clockButton.frame.origin.y + self.lineTwo.clockButton.frame.size.height + 65, self.view.frame.size.width * 0.9, 120)];
        [self.coplayerBack setBackgroundColor:[UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]];
        [self.coplayerBack.layer setShadowColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.12].CGColor];
        [self.coplayerBack.layer setShadowOffset:CGSizeMake(2, 2)];
        [self.coplayerBack.layer setShadowOpacity:1.0];
        [self.coplayerBack setClipsToBounds:NO];
        [self.view addSubview:self.coplayerBack];
        self.coplayerShow = YES;

        //textField
        self.taskTaker = [[UITextView alloc]initWithFrame:CGRectMake(self.coplayerBack.frame.size.width * 0.05, self.coplayerBack.frame.size.height * 0.05, self.coplayerBack.frame.size.width * 0.8, self.coplayerBack.frame.size.height * 0.9)];
        self.taskTaker.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        self.taskTaker.text = self.taskTakerListStr;
        [self.coplayerBack addSubview:self.taskTaker];
        
        //buttons
        UIButton *add = [[UIButton alloc]initWithFrame:CGRectMake(self.coplayerBack.frame.size.width * 0.9, 10, 20, 20)];
        [add setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
        [add addTarget:self action:@selector(addContact:) forControlEvents:UIControlEventTouchDown];
        [self.coplayerBack addSubview:add];
        
        UIButton *delete = [[UIButton alloc]initWithFrame:CGRectMake(self.coplayerBack.frame.size.width * 0.9, 50, 20, 20)];
        [delete setImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
        [delete addTarget:self action:@selector(deleteOneTaker:) forControlEvents:UIControlEventTouchDown];
        [self.coplayerBack addSubview:delete];
        
        UIButton *done = [[UIButton alloc]initWithFrame:CGRectMake(self.coplayerBack.frame.size.width * 0.9, 90, 20, 20)];
        [done setImage:[UIImage imageNamed:@"done.png"] forState:UIControlStateNormal];
        [done addTarget:self action:@selector(doneCoplayer) forControlEvents:UIControlEventTouchDown];
        [self.coplayerBack addSubview:done];
        
    }
}

-(void)doneCoplayer{
    self.taskTakerListStr = self.taskTaker.text;
    self.coplayerShow = NO;
    [self.coplayerBack removeFromSuperview];
}

#pragma mark - 部件-时间
- (IBAction)showSlide:(id)sender {
    //跳出滑块和两个按钮
    if (self.sliderShow == NO && self.calendarFlag == NO && self.coplayerShow == NO) {
        //新view
        self.sliderBack = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, self.lineTwo.clockButton.frame.origin.y + self.lineTwo.clockButton.frame.size.height + 65, self.view.frame.size.width * 0.9, 120)];
        [self.sliderBack setBackgroundColor:[UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]];
        [self.sliderBack.layer setShadowColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.12].CGColor];
        [self.sliderBack.layer setShadowOffset:CGSizeMake(2, 2)];
        [self.sliderBack.layer setShadowOpacity:1.0];
        [self.sliderBack setClipsToBounds:NO];
        [self.view addSubview:self.sliderBack];
        self.sliderShow = YES;
        
        //slider
        self.slideValue = [[UISlider alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, 20, self.sliderBack.frame.size.width * 0.9, 10)];
        self.slideValue.minimumTrackTintColor = [UIColor colorWithRed:255.0/255.0 green:64.0/255.0 blue:129.0/255.0 alpha:1.0];
        [self.slideValue addTarget:self action:@selector(setTime) forControlEvents:UIControlEventValueChanged];
        [self.sliderBack addSubview:self.slideValue];
        
        //取消和确定按钮
        UIButton *cancle = [[UIButton alloc]initWithFrame:CGRectMake(self.sliderBack.frame.size.width/4, 60, 120, 45)];
        UIButton *done = [[UIButton alloc]initWithFrame:CGRectMake(self.sliderBack.frame.size.width*0.75, 60, 120, 45)];
        cancle.center = CGPointMake(self.sliderBack.frame.size.width/4, 80);
        done.center = CGPointMake(self.sliderBack.frame.size.width*0.75, 80);
        [cancle addTarget:self action:@selector(cancleSlider) forControlEvents:UIControlEventTouchDown];
        [done addTarget:self action:@selector(doneSlider) forControlEvents:UIControlEventTouchDown];
        [cancle setBackgroundImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
        [done setBackgroundImage:[UIImage imageNamed:@"yes.png"] forState:UIControlStateNormal];
        [self.sliderBack addSubview:cancle];
        [self.sliderBack addSubview:done];
        
    }
}

-(void)cancleSlider{
    [self.lineTwo.taskTime setText:@""];
    self.sliderShow = NO;
    [self.sliderBack removeFromSuperview];
}

-(void)doneSlider{
    self.sliderShow = NO;
    [self.sliderBack removeFromSuperview];
}

-(void)setTime{
    NSInteger hour = floor(self.slideValue.value * 1439);
    hour = hour /60;
    NSInteger minute = floor(self.slideValue.value * 1439);
    minute = minute % 60;
    if(minute>=0 && minute<30){
        minute = 0;
    }else{
        minute = 30;
    }
    NSString *hourStr = [NSString stringWithFormat:@"%02ld", (long)hour];
    NSString *minuteStr = [NSString stringWithFormat:@"%02ld", (long)minute];
    self.lineTwo.taskTime.text = [NSString stringWithFormat:@"%@:%@",hourStr,minuteStr];
    self.defaultCellOne.stepTime.text = self.lineTwo.taskTime.text;
}

//#pragma mark - 部件-时间new
//- (IBAction)showSlideNew:(id)sender {
//    //跳出滑块和两个按钮
//    if (self.sliderShow == NO && self.calendarFlag == NO && self.coplayerShow == NO) {
//        //新view
//        self.sliderBack = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, self.lineTwo.clockButton.frame.origin.y + self.lineTwo.clockButton.frame.size.height + 65, self.view.frame.size.width * 0.9, 120)];
//        [self.sliderBack setBackgroundColor:[UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0]];
//        [self.sliderBack.layer setShadowColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.12].CGColor];
//        [self.sliderBack.layer setShadowOffset:CGSizeMake(2, 2)];
//        [self.sliderBack.layer setShadowOpacity:1.0];
//        [self.sliderBack setClipsToBounds:NO];
//        [self.view addSubview:self.sliderBack];
//        self.sliderShow = YES;
//        
//        //slider
//        self.slideValue = [[UISlider alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, 20, self.sliderBack.frame.size.width * 0.9, 10)];
//        self.slideValue.minimumTrackTintColor = [UIColor colorWithRed:255.0/255.0 green:64.0/255.0 blue:129.0/255.0 alpha:1.0];
//        [self.slideValue addTarget:self action:@selector(setTime) forControlEvents:UIControlEventValueChanged];
//        [self.sliderBack addSubview:self.slideValue];
//        
//        //取消和确定按钮
//        UIButton *cancle = [[UIButton alloc]initWithFrame:CGRectMake(self.sliderBack.frame.size.width/4, 60, 120, 45)];
//        UIButton *done = [[UIButton alloc]initWithFrame:CGRectMake(self.sliderBack.frame.size.width*0.75, 60, 120, 45)];
//        cancle.center = CGPointMake(self.sliderBack.frame.size.width/4, 80);
//        done.center = CGPointMake(self.sliderBack.frame.size.width*0.75, 80);
//        [cancle addTarget:self action:@selector(cancleSlider) forControlEvents:UIControlEventTouchDown];
//        [done addTarget:self action:@selector(doneSlider) forControlEvents:UIControlEventTouchDown];
//        [cancle setBackgroundImage:[UIImage imageNamed:@"no.png"] forState:UIControlStateNormal];
//        [done setBackgroundImage:[UIImage imageNamed:@"yes.png"] forState:UIControlStateNormal];
//        [self.sliderBack addSubview:cancle];
//        [self.sliderBack addSubview:done];
//        
//    }
//}
//
//-(void)cancleSliderNew{
//    [self.lineTwo.taskTime setText:@""];
//    self.sliderShow = NO;
//    [self.sliderBack removeFromSuperview];
//}
//
//-(void)doneSliderNew{
//    self.sliderShow = NO;
//    [self.sliderBack removeFromSuperview];
//}
//
//-(void)setTimeNew{
//    NSInteger hour = floor(self.slideValue.value * 1439);
//    hour = hour /60;
//    NSInteger minute = floor(self.slideValue.value * 1439);
//    minute = minute % 60;
//    if(minute>=0 && minute<30){
//        minute = 0;
//    }else{
//        minute = 30;
//    }
//    NSString *hourStr = [NSString stringWithFormat:@"%02ld", (long)hour];
//    NSString *minuteStr = [NSString stringWithFormat:@"%02ld", (long)minute];
//    self.lineTwo.taskTime.text = [NSString stringWithFormat:@"%@:%@",hourStr,minuteStr];
//}

#pragma mark - 部件-addContactDelegate
-(void)AddTaskTakerDidCancel:(AddTaskTakerTableViewController *)controller{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)AddTaskTakerViewController:(AddTaskTakerTableViewController *)controller didFinishAddingTaskTaker:(Contact *)contact{
    self.taskTaker.text = [NSString stringWithFormat:@"%@%@, ",self.taskTaker.text, contact.acceptorName];
    [self.taskTakerArray addObject:contact];
    [controller dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.stepNum + 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height;
    switch (indexPath.row) {
        case 0:
            height = 60;
            break;
        case 1:
            height = 60;
            break;
        default:
            if (indexPath.row == self.stepNum + 2) {
                height = 60;
            }else{
                height = 128;
            }
            break;
    }
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    switch (indexPath.row) {
        case 0:{
            self.lineOne = (LineOne *)[tableView dequeueReusableCellWithIdentifier:@"line1"];
            if (self.lineOne == nil) {
                self.lineOne = [[LineOne alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            [self.lineOne.taskName addTarget:self action:@selector(finishEditing:) forControlEvents:UIControlEventEditingDidEnd];
        }
            break;
        case 1:{
            self.lineTwo = [tableView dequeueReusableCellWithIdentifier:@"line2"];
            if (self.lineTwo == nil) {
                self.lineTwo = [[LineTwo alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
            }
            [self.lineTwo.taskDate setEnabled:NO];
            [self.lineTwo.taskTime setEnabled:NO];
            [self.lineTwo.calendarButton addTarget:self action:@selector(calendar:) forControlEvents:UIControlEventTouchDown];
            [self.lineTwo.contactButton addTarget:self action:@selector(showCoplayer:) forControlEvents:UIControlEventTouchDown];
            [self.lineTwo.clockButton addTarget:self action:@selector(showSlide:) forControlEvents:UIControlEventTouchDown];
            
            //添加任务和添加检查点之间阴影
            UIView *shadowView = [[UIView alloc]initWithFrame:CGRectMake(0, 58, self.view.frame.size.width, 2)];
            shadowView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0];
            [self.lineTwo addSubview:shadowView];
        }
            break;
        case 2:{
            self.defaultCellOne = [tableView dequeueReusableCellWithIdentifier:@"DefaultCellOne"];
            self.defaultCellOne.stepName.text = @"事件到期！";
            [self.defaultCellOne.stepName setEnabled:NO];
            [self.defaultCellOne.stepDate setEnabled:NO];
            [self.defaultCellOne.stepTime setEnabled:NO];
        }
            break;
        default:{
            if (indexPath.row == self.stepNum + 2) {
                self.justCell = [tableView dequeueReusableCellWithIdentifier:@"justCell"];
                //添加一步按钮
                self.addStep = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
                [self.addStep setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:69.0/255.0 blue:124.0/255.0 alpha:1.0]];
                [self.addStep setTitle:@"添加一步" forState:UIControlStateNormal];
                [self.addStep addTarget:self action:@selector(addOneStep:) forControlEvents:UIControlEventTouchDown];
                [self.view addSubview:self.addStep];
                [self.justCell addSubview:self.addStep];
            }else{
                self.newcell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCellOne"];
                self.newcell.tag = indexPath.row;
                self.newcell.stepName.text = @"新事件";
                
                UIButton *deleteStep = [[UIButton alloc]initWithFrame:CGRectMake(self.tableView.frame.size.width - 38, 45, 25, 25)];
                [deleteStep setBackgroundImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
                [deleteStep addTarget:self action:@selector(deleteOneStep:) forControlEvents:UIControlEventTouchDown];
                [self.newcell addSubview:deleteStep];
                
                UIButton *doneStep = [[UIButton alloc]initWithFrame:CGRectMake(self.tableView.frame.size.width - 38, 10, 25, 25)];
                [doneStep setBackgroundImage:[UIImage imageNamed:@"done.png"] forState:UIControlStateNormal];
                [doneStep addTarget:self action:@selector(doneOneStep:) forControlEvents:UIControlEventTouchDown];
                [self.newcell addSubview:doneStep];
            }
            
        }
            break;
            
    }
    //
    
    
    
    
    switch (indexPath.row) {
        case 0:
            return self.lineOne;
            break;
        case 1:
            return self.lineTwo;
            break;
        case 2:
            return self.defaultCellOne;
            break;
        default:
            if (indexPath.row == self.stepNum + 2){
                return self.justCell;
            }else{
                return self.newcell;
            }
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showContacts"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddTaskTakerTableViewController *controller = (AddTaskTakerTableViewController *)navigationController.topViewController;
        Contact *contact = [[Contact alloc]init];
        controller.contactList = [contact ContactNameList];
        controller.delegate = self;
    }
}

//删除最后一个tasktaker

- (IBAction)deleteOneTaker:(id)sender {
    [self.taskTakerArray removeLastObject];
    NSString *str = [[NSString alloc]init];
    
    for (int i = 0; i < self.taskTakerArray.count; i++) {
        Contact *ct = [self.taskTakerArray objectAtIndex:i];
        str = [NSString stringWithFormat:@"%@%@, ",str,ct.acceptorName];
    }
    self.taskTaker.text = str;
    self.taskTakerListStr = str;
}



- (IBAction)addContact:(id)sender {
    [self performSegueWithIdentifier:@"showContacts" sender:self];
}

- (IBAction)cancel{
    [self.delegate AddTaskTableViewControllerDidCancel:self];
}

- (IBAction)done{
    Task *newTask = [[Task alloc]init];
    
    newTask.taskName = self.taskname;
    NSLog(@"%@",self.lineOne.taskName.text);
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSLog(@"%@",self.lineTwo.taskTime.text);
    NSString *date = [self.lineTwo.taskDate.text stringByAppendingString:[NSString stringWithFormat:@" %@", self.lineTwo.taskTime.text]];
    
    newTask.deadLine = [self.dateFormatter dateFromString:date];
    [self sendLocalNotificationsWithDate:newTask.deadLine];
    newTask.taskTakerList = self.taskTakerArray;
    
    [newTask saveTaskWithTaskName:newTask.taskName deadLine:newTask.deadLine taskTakerList:newTask.taskTakerList];
    [self.delegate AddTaskTableViewController:self didFinishAddingTask:newTask];
}

#pragma mark - notifications
-(void)sendLocalNotificationsWithDate:(NSDate *)date{
    //1
    UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
    action.identifier = @"action";//按钮的标示
    action.title=@"Accept";//按钮的标题
    action.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
    //    action.authenticationRequired = YES;
    //    action.destructive = YES;
    
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];  //第二按钮
    action2.identifier = @"action2";
    action2.title=@"Reject";
    action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
    action.authenticationRequired = YES;//需要解锁才能处理，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
    action.destructive = YES;
    
    //2
    UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc] init];
    categorys.identifier = @"alert";//这组动作的唯一标示
    [categorys setActions:@[action,action2] forContext:(UIUserNotificationActionContextMinimal)];
    
    //3
    UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:[NSSet setWithObjects:categorys, nil]];
    
    //4
    [[UIApplication sharedApplication] registerUserNotificationSettings:uns];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    // Override point for customization after application launch.
    
    
    //5
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate=[NSDate dateWithTimeInterval:1320 sinceDate:date];
    notification.timeZone=[NSTimeZone defaultTimeZone];
    notification.alertBody=@"您有事件即将到期！";
    notification.category = @"alert";
    [[UIApplication sharedApplication]  scheduleLocalNotification:notification];
}
@end
