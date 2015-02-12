//
//  ContactsListTableViewController.m
//  WeTaskByConcordia
//
//  Created by XN on 12/6/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "ContactsListTableViewController.h"
#import "APIUrl.h"
#import "Contact.h"

@interface ContactsListTableViewController ()

@property (nonatomic) NSMutableArray *dataSource;

@end

@implementation ContactsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Contact *contacts = [[Contact alloc]init];
    self.connections = [contacts ContactNameList];
    
    //改变索引的颜色
    self.tableView.sectionIndexColor = [UIColor blueColor];
    //改变索引选中的背景颜色
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor grayColor];
    //改变索引背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    
    self.a = [[NSMutableArray alloc]init];
    self.b = [[NSMutableArray alloc]init];
    self.c = [[NSMutableArray alloc]init];
    self.d = [[NSMutableArray alloc]init];
    self.e = [[NSMutableArray alloc]init];
    self.f = [[NSMutableArray alloc]init];
    self.g = [[NSMutableArray alloc]init];
    self.h = [[NSMutableArray alloc]init];
    self.i = [[NSMutableArray alloc]init];
    self.j = [[NSMutableArray alloc]init];
    self.k = [[NSMutableArray alloc]init];
    self.l = [[NSMutableArray alloc]init];
    self.m = [[NSMutableArray alloc]init];
    self.n = [[NSMutableArray alloc]init];
    self.o = [[NSMutableArray alloc]init];
    self.p = [[NSMutableArray alloc]init];
    self.q = [[NSMutableArray alloc]init];
    self.r = [[NSMutableArray alloc]init];
    self.s = [[NSMutableArray alloc]init];
    self.t = [[NSMutableArray alloc]init];
    self.u = [[NSMutableArray alloc]init];
    self.v = [[NSMutableArray alloc]init];
    self.w = [[NSMutableArray alloc]init];
    self.x = [[NSMutableArray alloc]init];
    self.y = [[NSMutableArray alloc]init];
    self.z = [[NSMutableArray alloc]init];
    self.sha = [[NSMutableArray alloc]init];
    
    
    for (NSString *conta in self.connections) {
        switch ([conta characterAtIndex:0]) {
            case 'A':
                [self.a addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'B':
                [self.b addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'C':
                [self.c addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'D':
                [self.d addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'E':
                [self.e addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'F':
                [self.f addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'G':
                [self.g addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'H':
                [self.h addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'I':
                [self.i addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'J':
                [self.j addObject:conta];
                NSLog(@"%@",conta);
                break;
            case 'K':
                [self.k addObject:conta];
                break;
            case 'L':
                [self.l addObject:conta];
                break;
            case 'M':
                [self.m addObject:conta];
                break;
            case 'N':
                [self.n addObject:conta];
                break;
            case 'O':
                [self.o addObject:conta];
                break;
            case 'P':
                [self.p addObject:conta];
                break;
            case 'Q':
                [self.q addObject:conta];
                break;
            case 'R':
                [self.r addObject:conta];
                break;
            case 'S':
                [self.s addObject:conta];
                break;
            case 'T':
                [self.t addObject:conta];
                break;
            case 'U':
                [self.u addObject:conta];
                break;
            case 'V':
                [self.v addObject:conta];
                break;
            case 'W':
                [self.w addObject:conta];
                break;
            case 'X':
                [self.x addObject:conta];
                break;
            case 'Y':
                [self.y addObject:conta];
                break;
            case 'Z':
                [self.z addObject:conta];
                break;
            case 'a':
                [self.a addObject:conta];
                break;
            case 'b':
                [self.b addObject:conta];
                break;
            case 'c':
                [self.c addObject:conta];
                break;
            case 'd':
                [self.d addObject:conta];
                break;
            case 'e':
                [self.e addObject:conta];
                break;
            case 'f':
                [self.f addObject:conta];
                break;
            case 'g':
                [self.g addObject:conta];
                break;
            case 'h':
                [self.h addObject:conta];
                break;
            case 'i':
                [self.i addObject:conta];
                break;
            case 'j':
                [self.j addObject:conta];
                break;
            case 'k':
                [self.k addObject:conta];
                break;
            case 'l':
                [self.l addObject:conta];
                break;
            case 'm':
                [self.m addObject:conta];
                break;
            case 'n':
                [self.n addObject:conta];
                break;
            case 'o':
                [self.o addObject:conta];
                break;
            case 'p':
                [self.p addObject:conta];
                break;
            case 'q':
                [self.q addObject:conta];
                break;
            case 'r':
                [self.r addObject:conta];
                break;
            case 's':
                [self.s addObject:conta];
                break;
            case 't':
                [self.t addObject:conta];
                break;
            case 'u':
                [self.u addObject:conta];
                break;
            case 'v':
                [self.v addObject:conta];
                break;
            case 'w':
                [self.w addObject:conta];
                break;
            case 'x':
                [self.x addObject:conta];
                break;
            case 'y':
                [self.y addObject:conta];
                break;
            case 'z':
                [self.z addObject:conta];
                break;
            default:
                [self.sha addObject:conta];
                break;
        }
    }
    
    
    //索引数组
    self.dataSource = [[NSMutableArray alloc] init] ;
    [self.dataSource addObject:@"最近的小伙伴"];
    
    //初始化数据
    for(char c = 'A'; c <= 'Z'; c++ )
    {
        [self.dataSource addObject:[NSString stringWithFormat:@"%c",c]];
    }
    
    [self.dataSource addObject:@"#"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//返回索引数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *indexTitle = [[NSMutableArray alloc]initWithArray:self.dataSource];
    [indexTitle removeObjectAtIndex:0];
    [indexTitle insertObject:@"常" atIndex:0];
    return indexTitle;
}

//响应点击索引时的委托方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger count = 0;
    
    
    for(NSString *character in _dataSource)
    {
        if([character isEqualToString:title])
        {
            return count;
        }
        count ++;
    }
    return 0;
}

//返回section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return [self.dataSource count];
}

//返回每个索引的内容
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSMutableArray *arr;
    switch (section) {
        case 0:
            arr = nil;
            break;
        case 1:
            arr = self.a;
            break;
        case 2:
            arr = self.b;
            break;
        case 3:
            arr = self.c;
            break;
        case 4:
            arr = self.d;
            break;
        case 5:
            arr = self.e;
            break;
        case 6:
            arr = self.f;
            break;
        case 7:
            arr = self.g;
            break;
        case 8:
            arr = self.h;
            break;
        case 9:
            arr = self.i;
            break;
        case 10:
            arr = self.j;
            break;
        case 11:
            arr = self.k;
            break;
        case 12:
            arr = self.l;
            break;
        case 13:
            arr = self.m;
            break;
        case 14:
            arr = self.n;
            break;
        case 15:
            arr = self.o;
            break;
        case 16:
            arr = self.p;
            break;
        case 17:
            arr = self.q;
            break;
        case 18:
            arr = self.r;
            break;
        case 19:
            arr = self.s;
            break;
        case 20:
            arr = self.t;
            break;
        case 21:
            arr = self.u;
            break;
        case 22:
            arr = self.v;
            break;
        case 23:
            arr = self.w;
            break;
        case 24:
            arr = self.x;
            break;
        case 25:
            arr = self.y;
            break;
        case 26:
            arr = self.z;
            break;
        case 27:
            arr = self.sha;
            break;
        default:
            break;
    }
    if (arr.count == 0) {
        return nil;
    }else{

        return [self.dataSource objectAtIndex:section];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredConnectArray count];
    } else {
        if (section == 0) {
            num = 0;
        }else{
            NSMutableArray *arr;
            switch (section) {
                case 0:
                    arr = nil;
                    break;
                case 1:
                    arr = self.a;
                    break;
                case 2:
                    arr = self.b;
                    break;
                case 3:
                    arr = self.c;
                    break;
                case 4:
                    arr = self.d;
                    break;
                case 5:
                    arr = self.e;
                    break;
                case 6:
                    arr = self.f;
                    break;
                case 7:
                    arr = self.g;
                    break;
                case 8:
                    arr = self.h;
                    break;
                case 9:
                    arr = self.i;
                    break;
                case 10:
                    arr = self.j;
                    break;
                case 11:
                    arr = self.k;
                    break;
                case 12:
                    arr = self.l;
                    break;
                case 13:
                    arr = self.m;
                    break;
                case 14:
                    arr = self.n;
                    break;
                case 15:
                    arr = self.o;
                    break;
                case 16:
                    arr = self.p;
                    break;
                case 17:
                    arr = self.q;
                    break;
                case 18:
                    arr = self.r;
                    break;
                case 19:
                    arr = self.s;
                    break;
                case 20:
                    arr = self.t;
                    break;
                case 21:
                    arr = self.u;
                    break;
                case 22:
                    arr = self.v;
                    break;
                case 23:
                    arr = self.w;
                    break;
                case 24:
                    arr = self.x;
                    break;
                case 25:
                    arr = self.y;
                    break;
                case 26:
                    arr = self.z;
                    break;
                case 27:
                    arr = self.sha;
                    break;
                default:
                    break;
            }
            num = arr.count;
        }
        
        return num;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *CellIdentifier = @"Cell";
     
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
     }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = self.filteredConnectArray[indexPath.row];
    } else {
        
        if (indexPath.section == 0) {
        }else{
            NSMutableArray *arr;
            switch (indexPath.section) {
                case 0:
                    arr = nil;
                    break;
                case 1:
                    arr = self.a;
                    break;
                case 2:
                    arr = self.b;
                    break;
                case 3:
                    arr = self.c;
                    break;
                case 4:
                    arr = self.d;
                    break;
                case 5:
                    arr = self.e;
                    break;
                case 6:
                    arr = self.f;
                    break;
                case 7:
                    arr = self.g;
                    break;
                case 8:
                    arr = self.h;
                    break;
                case 9:
                    arr = self.i;
                    break;
                case 10:
                    arr = self.j;
                    break;
                case 11:
                    arr = self.k;
                    break;
                case 12:
                    arr = self.l;
                    break;
                case 13:
                    arr = self.m;
                    break;
                case 14:
                    arr = self.n;
                    break;
                case 15:
                    arr = self.o;
                    break;
                case 16:
                    arr = self.p;
                    break;
                case 17:
                    arr = self.q;
                    break;
                case 18:
                    arr = self.r;
                    break;
                case 19:
                    arr = self.s;
                    break;
                case 20:
                    arr = self.t;
                    break;
                case 21:
                    arr = self.u;
                    break;
                case 22:
                    arr = self.v;
                    break;
                case 23:
                    arr = self.w;
                    break;
                case 24:
                    arr = self.x;
                    break;
                case 25:
                    arr = self.y;
                    break;
                case 26:
                    arr = self.z;
                    break;
                case 27:
                    arr = self.sha;
                    break;
                default:
                    break;
            }
            cell.textLabel.text = [arr objectAtIndex:indexPath.row];
        }
    }
    [cell setBackgroundColor:[UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1]];
     
     return cell;
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
    if ([segue.identifier isEqualToString:@"AddContact"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ContactViewController *controller = (ContactViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.contactToEdit = nil;
    }
}


#pragma mark - get users contacts list

-(NSString *)sendHttpRequestIDToUrl:(NSURL *)url withParam:(NSString *)params{
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
        return @"";
    }else{
        NSString* newStr = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
        return newStr;
    }
    
    //[self APIRegister:JSON];
    
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

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredConnectArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd] %@",searchText];
    self.filteredConnectArray = [NSMutableArray arrayWithArray:[self.connections filteredArrayUsingPredicate:predicate]];
}

#pragma mark - ContactViewController Delegate

- (void)ContactViewControllerDidCancel:(ContactViewController *)controller{
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)ContactViewController:(ContactViewController *)controller didFinishAddingContact:(Contact *)contact{
    Contact *contacts = [[Contact alloc]init];
    self.connections = [contacts ContactNameList];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)ContactViewController:(ContactViewController *)controller didFinishEditingContact:(Contact *)contact{
}

@end
