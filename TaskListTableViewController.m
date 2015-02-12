//
//  TaskListTableViewController.m
//  WeTaskByConcordia
//
//  Created by XN on 12/11/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "TaskListTableViewController.h"
#import "TaskList.h"
#import "TaskCell.h"
@import UIKit;

@interface TaskListTableViewController ()

@end

@implementation TaskListTableViewController{
    UIView* loadingView;
    UIActivityIndicatorView *activityView;
}

-(void)viewWillAppear:(BOOL)animated{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    TaskList *taskList = [[TaskList alloc]init];
    self.taskList = [taskList getTaskList];
    [self seperate];
    
    self.sec1open = YES;
    self.sec2open = YES;
    self.sec3open = NO;
    self.sec4open = NO;
    self.sec5open = YES;
    
    [self.tabBarController.tabBar setSelectedImageTintColor:[UIColor colorWithRed:62.0/255.0 green:80.0/255.0 blue:169.0/255.0 alpha:1.0]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 5;
}

//section header 高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}


//在section里加展开的按钮
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * mySectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    mySectionView.backgroundColor = [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1];
    
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 32, self.view.frame.size.width, 3)];
    shadowView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    [mySectionView addSubview:shadowView];
    UIButton * myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myButton.frame = CGRectMake(0, 0, 320, 50);
    myButton.tag = 100 + section;
    
    //添加section header按钮事件
    switch (section) {
        case 0:
            [myButton addTarget:self action:@selector(pressOne) forControlEvents:UIControlEventTouchDown];
            break;
        case 1:
            [myButton addTarget:self action:@selector(pressTwo) forControlEvents:UIControlEventTouchDown];
            break;
        case 2:
            [myButton addTarget:self action:@selector(pressThree) forControlEvents:UIControlEventTouchDown];
            break;
        case 3:
            [myButton addTarget:self action:@selector(pressFour) forControlEvents:UIControlEventTouchDown];
            break;
        case 4:
            [myButton addTarget:self action:@selector(pressFive) forControlEvents:UIControlEventTouchDown];
            break;
            
        default:
            break;
    }
    
    [mySectionView addSubview:myButton];
    
    //section header标题
    UILabel * myLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,-mySectionView.frame.size.height/4, 300, 50)];
    myLabel.backgroundColor = [UIColor clearColor];
    myLabel.textColor = [UIColor darkGrayColor];
    
    switch (section) {
        case 0:
            if (self.sec1open == YES) {
                myLabel.text = @"调整 ▼";
            }else{
                myLabel.text = @"调整 ▲";
            }
            break;
        case 1:
            if (self.sec2open == YES) {
                myLabel.text = @"今天 ▼";
            }else{
                myLabel.text = @"今天 ▲";
            }
            
            break;
        case 2:
            if(self.sec3open == YES){
                myLabel.text = @"明天 ▼";
            }else{
                myLabel.text = @"明天 ▲";
            }
            break;
        case 3:
            if (self.sec4open == YES) {
                myLabel.text = @"未来 ▼";
            }else{
                myLabel.text = @"未来 ▲";
            }
            break;
        case 4:
            if (self.sec5open == YES) {
                myLabel.text = @"完成 ▼";
            }else{
                myLabel.text = @"完成 ▲";
            }
            break;
        default:
            break;
    }

    [myButton addSubview:myLabel];
    
    return mySectionView;
}

- (void)pressOne{
    if(self.sec1open == YES){
        self.sec1open = NO;
    }else{
        self.sec1open = YES;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)pressTwo{
    if (self.sec2open == YES) {
        self.sec2open = NO;
    }else{
        self.sec2open = YES;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)pressThree{
    if (self.sec3open == YES) {
        self.sec3open = NO;
    }else{
        self.sec3open = YES;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)pressFour{
    if (self.sec4open == YES) {
        self.sec4open = NO;
    }else{
        self.sec4open = YES;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)pressFive{
    if (self.sec5open == YES) {
        self.sec5open = NO;
    }else{
        self.sec5open = YES;
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:4] withRowAnimation:UITableViewRowAnimationAutomatic];
}



//每个section的cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count;
    switch (section) {
        case 0:
            if (self.sec1open == YES) {
                
                count = [self.pastTask count];
            }else{
                count = 0;
            }
            break;
        case 1:
            if (self.sec2open == YES) {
                count = [self.todayTask count];
            }else{
                count = 0;
            }
            break;
        case 2:
            if (self.sec3open == YES) {
                count = [self.tomorrowTask count];
            }else{
                count = 0;
            }
            break;
        case 3:
            if (self.sec4open == YES) {
                count = [self.futureTask count];
            }else{
                count = 0;
            }
            break;
        case 4:
            if (self.sec5open == YES) {
                count = [self.finishedTask count];
            }else{
                count = 0;
            }
            break;
            
            
        default:
            break;
    }
    return count;
}

//cell height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

//cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    TaskCell *cell = (TaskCell *)[tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    if (cell == nil) {
        cell = [[TaskCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    Task *task;
    UIColor *cellColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    
    
    switch (indexPath.section) {
        case 0:
            task = self.pastTask[indexPath.row];
            [cell setBackgroundColor:cellColor];
            [cell.bigCircle setTitle:@"○" forState:UIControlStateNormal];
            [cell.smallCircle setTitle:@"○" forState:UIControlStateNormal];
            break;
        case 1:
            [cell.bigCircle setTitle:@"○" forState:UIControlStateNormal];
            [cell.smallCircle setTitle:@"○" forState:UIControlStateNormal];
            task = self.todayTask[indexPath.row];
            [cell setBackgroundColor:cellColor];
            break;
        case 2:
            [cell.bigCircle setTitle:@"○" forState:UIControlStateNormal];
            [cell.smallCircle setTitle:@"○" forState:UIControlStateNormal];
            task = self.tomorrowTask[indexPath.row];
            [cell setBackgroundColor:cellColor];
            break;
        case 3:
            [cell.bigCircle setTitle:@"○" forState:UIControlStateNormal];
            [cell.smallCircle setTitle:@"○" forState:UIControlStateNormal];
            task = self.futureTask[indexPath.row];
            [cell setBackgroundColor:cellColor];
            break;
        case 4:
            task = self.finishedTask[indexPath.row];
            [cell setBackgroundColor:cellColor];
            [cell.bigCircle setTitle:@"◉" forState:UIControlStateNormal];
            [cell.smallCircle setTitle:@"◉" forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    cell.cellTask = task;
    NSString *bigTitleDate = [dateFormatter stringFromDate:task.deadLine];
    [self sendLocalNotificationSoonWithDate:task.deadLine];
    [self sendLocalNotificationAlreadyWithDate:task.deadLine];
    cell.bigTitle.text = task.taskName;
    cell.bigDate.text = bigTitleDate;
    cell.bigCircle.tag = indexPath.row;
    if ([task.taskFinished  isEqual: @"no"]) {
        [self.bigCircle setTitle:@"○" forState:UIControlStateNormal];
    }else{
        [self.bigCircle setTitle:@"◉" forState:UIControlStateNormal];
    }
    switch (indexPath.section) {
        case 0:
            [cell.bigCircle addTarget:self action:@selector(completeTaskOne:) forControlEvents:UIControlEventTouchDown];
            break;
        case 1:
            [cell.bigCircle addTarget:self action:@selector(completeTaskTwo:) forControlEvents:UIControlEventTouchDown];
            break;
        case 2:
            [cell.bigCircle addTarget:self action:@selector(completeTaskThree:) forControlEvents:UIControlEventTouchDown];
            break;
        case 3:
            [cell.bigCircle addTarget:self action:@selector(completeTaskFour:) forControlEvents:UIControlEventTouchDown];
            break;
        case 4:
            [cell.bigCircle addTarget:self action:@selector(completeTaskFive:) forControlEvents:UIControlEventTouchDown];
            break;
        default:
            break;
    }
    
    UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(0,self.tableView.rowHeight - 3, self.view.frame.size.width, 3)];
    barView.backgroundColor = [UIColor lightGrayColor];
    int rand = arc4random()%((int)self.view.frame.size.width+12);
    UIView *jinduBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.tableView.rowHeight - 3, rand, 3)];
    jinduBarView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:80.0/255.0 blue:129.0/255.0 alpha:1];
    [cell.contentView addSubview:barView];
    [cell.contentView addSubview:jinduBarView];
    
    return cell;
}

-(IBAction)completeTaskOne:(id)sender{
    UIButton* cellBigCircle = (UIButton*)sender;
    
    Task *task = [self.pastTask objectAtIndex:cellBigCircle.tag];
    if (([task.taskFinished  isEqual: @"no"])) {
        task.taskFinished = @"yes";
        [task changeTaskWithTask:task];
    }
    
    TaskList *taskList = [[TaskList alloc]init];
    self.taskList = [taskList getTaskList];
    [self seperate];
    [cellBigCircle removeTarget:self action:@selector(completeTaskOne:) forControlEvents:UIControlEventTouchDown];
    
    [self.tableView reloadData];
}

-(IBAction)completeTaskTwo:(id)sender{
    UIButton* cellBigCircle = (UIButton*)sender;
    
    Task *task = [self.todayTask objectAtIndex:cellBigCircle.tag];
    if (([task.taskFinished  isEqual: @"no"])) {
        task.taskFinished = @"yes";
        [task changeTaskWithTask:task];
    }
    
    TaskList *taskList = [[TaskList alloc]init];
    self.taskList = [taskList getTaskList];
    [self seperate];
    [cellBigCircle removeTarget:self action:@selector(completeTaskTwo:) forControlEvents:UIControlEventTouchDown];
    
    [self.tableView reloadData];
}

-(IBAction)completeTaskThree:(id)sender{
    UIButton* cellBigCircle = (UIButton*)sender;
    
    Task *task = [self.tomorrowTask objectAtIndex:cellBigCircle.tag];
    if (([task.taskFinished  isEqual: @"no"])) {
        task.taskFinished = @"yes";
        [task changeTaskWithTask:task];
    }
    
    TaskList *taskList = [[TaskList alloc]init];
    self.taskList = [taskList getTaskList];
    [self seperate];
    [cellBigCircle removeTarget:self action:@selector(completeTaskThree:) forControlEvents:UIControlEventTouchDown];
    
    [self.tableView reloadData];
}

-(IBAction)completeTaskFour:(id)sender{
    UIButton* cellBigCircle = (UIButton*)sender;
    
    Task *task = [self.futureTask objectAtIndex:cellBigCircle.tag];
    if (([task.taskFinished  isEqual: @"no"])) {
        task.taskFinished = @"yes";
        [task changeTaskWithTask:task];
    }
    
    TaskList *taskList = [[TaskList alloc]init];
    self.taskList = [taskList getTaskList];
    [self seperate];
    [cellBigCircle removeTarget:self action:@selector(completeTaskFour:) forControlEvents:UIControlEventTouchDown];
    
    [self.tableView reloadData];
}

-(IBAction)completeTaskFive:(id)sender{
    
    UIButton* cellBigCircle = (UIButton*)sender;
    Task *task = [self.finishedTask objectAtIndex:cellBigCircle.tag];
    if (([task.taskFinished  isEqual: @"no"])) {
        task.taskFinished = @"yes";
        [task changeTaskWithTask:task];
    }
    
    TaskList *taskList = [[TaskList alloc]init];
    self.taskList = [taskList getTaskList];
    [self seperate];
    
    [self.tableView reloadData];
}


//编辑cell
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你确定要删除该任务吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        NSLog(@"DELETE");
    } else {
        NSLog(@"NO");
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
    if ([segue.identifier isEqualToString:@"AddTask"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddTaskTableViewController *controller = (AddTaskTableViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.taskToEdit = nil;
    }

}


#pragma mark - Delegate
- (void)AddTaskTableViewControllerDidCancel:(AddTaskTableViewController *)controller{
    [self.tableView reloadData];
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)AddTaskTableViewController:(AddTaskTableViewController *)controller didFinishAddingTask:(Task *)task{
    TaskList *taskList = [[TaskList alloc]init];
    self.taskList = [taskList getTaskList];
    [self seperate];
    [self.tableView reloadData];
    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (void)AddTaskTableViewController:(AddTaskTableViewController *)controller didFinishEditingTask:(Task *)task{
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - seperate into 4 task arrays according to time
-(void)seperate{
    self.pastTask = [[NSMutableArray alloc]init];
    self.todayTask = [[NSMutableArray alloc]init];
    self.tomorrowTask = [[NSMutableArray alloc]init];
    self.futureTask = [[NSMutableArray alloc]init];
    self.finishedTask = [[NSMutableArray alloc]init];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *todayComponents = [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:[NSDate date]];
    NSInteger theDay = [todayComponents day];
    NSInteger theMonth = [todayComponents month];
    NSInteger theYear = [todayComponents year];
    
    // now build a NSDate object for yourDate using these components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:theDay];
    [components setMonth:theMonth];
    [components setYear:theYear];
    NSDate *thisDate = [gregorian dateFromComponents:components];
    
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:1];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:thisDate options:0];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSDate *todayDate = [NSDate date];
    NSString *todayStr = [dateFormatter stringFromDate:todayDate];
    NSString *tomorrowStr = [dateFormatter stringFromDate:nextDate];
    for (int i = 0; i < self.taskList.count; i++) {
        Task *task = [self.taskList objectAtIndex:i];
        NSString *selectedStr = [dateFormatter stringFromDate:task.deadLine];
        if ([task.taskFinished  isEqual: @"yes"]) {
            [self.finishedTask addObject:task];
        }else if ([todayStr isEqualToString:selectedStr]) {
            [self.todayTask addObject:task];
        }
        else if ([todayDate compare:task.deadLine] == NSOrderedAscending) {
            if ([tomorrowStr isEqualToString:selectedStr]){
                [self.tomorrowTask addObject:task];
            }else{
                [self.futureTask addObject:task];
            }
            
        }else{//today比选定时间早
            [self.pastTask addObject:task];
        }
    }
    
}

#pragma mark activityIndicator
- (void) loadActivityIndicator{
    CGSize screenSize = [[UIScreen mainScreen]bounds].size;
    
    loadingView = [[UIView alloc]initWithFrame:CGRectMake(screenSize.width/2-40, screenSize.height/2-40, 80, 80)];
    loadingView.backgroundColor = [UIColor colorWithWhite:0. alpha:0.6];
    loadingView.layer.cornerRadius = 5;
    
    activityView =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.center = CGPointMake(loadingView.frame.size.width / 2.0, 35);
    [activityView startAnimating];
    [loadingView addSubview:activityView];
    
    UILabel* lblLoading = [[UILabel alloc]initWithFrame:CGRectMake(0, 48, 80, 30)];
    lblLoading.text = @"Loading...";
    lblLoading.textColor = [UIColor whiteColor];
    lblLoading.font = [UIFont fontWithName:lblLoading.font.fontName size:15];
    lblLoading.textAlignment = NSTextAlignmentCenter;
    [loadingView addSubview:lblLoading];
    
    [self.view addSubview:loadingView];
    [self.view bringSubviewToFront:loadingView];
}

- (void) dismissActivityIndicator{
    [activityView stopAnimating];
    [loadingView removeFromSuperview];
}

#pragma mark - notifications
-(void)sendLocalNotificationSoonWithDate:(NSDate *)date{
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
    notification.fireDate=[NSDate dateWithTimeInterval:-900 sinceDate:date];
    notification.timeZone=[NSTimeZone defaultTimeZone];
    notification.alertBody=@"您有事件即将到期！";
    notification.category = @"alert";
    [[UIApplication sharedApplication]  scheduleLocalNotification:notification];
}

-(void)sendLocalNotificationAlreadyWithDate:(NSDate *)date{
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
    notification.fireDate=[NSDate dateWithTimeInterval:0 sinceDate:date];
    notification.timeZone=[NSTimeZone defaultTimeZone];
    notification.alertBody=@"您有事件已经到期！";
    notification.category = @"alert";
    [[UIApplication sharedApplication]  scheduleLocalNotification:notification];
}
@end
