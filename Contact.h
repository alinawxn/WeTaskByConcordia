//
//  Contact.h
//  WeTaskByConcordia
//
//  Created by XN on 12/7/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic) NSString *acceptor;
@property (nonatomic) NSString *acceptorName;

-(NSString *)saveContactWithAcceptor:(NSString *)acceptor acceptorName:(NSString *)acceptorName;
-(NSMutableArray *)ContactNameList;
-(NSMutableArray *)ContactNumberList;

@end
