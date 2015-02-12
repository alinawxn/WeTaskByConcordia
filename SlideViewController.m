//
//  SlideViewController.m
//  WeTaskByConcordia
//
//  Created by XN on 12/30/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "SlideViewController.h"

@interface SlideViewController ()

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    self.leftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
//    self.rightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightViewController"];
//    self.bottomViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"bottomViewController"];
    
    self.swipeDelegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Swipe delegate

- (void)swipeController:(RNSwipeViewController *)swipeController willShowController:(UIViewController *)controller {
    NSLog(@"will show");
}

- (void)swipeController:(RNSwipeViewController *)swipeController didShowController:(UIViewController *)controller {
    NSLog(@"did show");
}

@end
