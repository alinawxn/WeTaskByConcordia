//
//  TaskCell.m
//  WeTaskByConcordia
//
//  Created by XN on 12/25/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)completeTask:(id)sender {
}

- (IBAction)completeCheckpoint:(id)sender {
    if ([self.smallCircle.titleLabel.text  isEqual: @"○"]) {
        [self.smallCircle setTitle:@"◉" forState:UIControlStateNormal];
    }
}
@end
