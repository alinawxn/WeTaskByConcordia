//
//  DefaultCellOne.h
//  WeTaskByConcordia
//
//  Created by XN on 1/8/15.
//  Copyright (c) 2015 Concordia InforTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefaultCellOne : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
@property (weak, nonatomic) IBOutlet UIButton *clockButton;
@property (weak, nonatomic) IBOutlet UIButton *contactButton;
@property (weak, nonatomic) IBOutlet UITextField *stepDate;
@property (weak, nonatomic) IBOutlet UITextField *stepTime;
@property (weak, nonatomic) IBOutlet UITextField *stepName;

@end
