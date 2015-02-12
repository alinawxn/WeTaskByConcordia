//
//  LineTwo.h
//  WeTaskByConcordia
//
//  Created by XN on 1/8/15.
//  Copyright (c) 2015 Concordia InforTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineTwo : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *contactButton;
@property (weak, nonatomic) IBOutlet UITextField *taskDate;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
@property (weak, nonatomic) IBOutlet UITextField *taskTime;
@property (weak, nonatomic) IBOutlet UIButton *clockButton;

@end
