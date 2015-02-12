//
//  AddTaskTakerTableViewController.m
//  taskExpert
//
//  Created by XN on 11/13/14.
//  Copyright (c) 2014 iakworkshop. All rights reserved.
//

#import "AddTaskTakerTableViewController.h"

@interface AddTaskTakerTableViewController ()

@end

@implementation AddTaskTakerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.title = @"选择小伙伴";
    self.contact = [[Contact alloc]init];
    self.contactList = [self.contact ContactNameList];
    self.contactNumberList = [self.contact ContactNumberList];
    [self.tableView reloadData];
    self.selectedContactList = [[NSMutableArray alloc]init];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark view

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contactList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.contactList[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact *contact = [[Contact alloc]init];
    contact.acceptorName = self.contactList[indexPath.row];
    contact.acceptor = self.contactNumberList[indexPath.row];
    [self.delegate AddTaskTakerViewController:self didFinishAddingTaskTaker:contact];
}

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
}


-(IBAction)cancel{
    
    if (self.delegate == nil) {
        NSLog(@"no delegate");
    }
    [self.delegate AddTaskTakerDidCancel:self];
}
@end
