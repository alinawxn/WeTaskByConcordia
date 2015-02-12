//
//  ContactsListTableViewController.h
//  WeTaskByConcordia
//
//  Created by XN on 12/6/14.
//  Copyright (c) 2014 Concordia InforTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactViewController.h"

@interface ContactsListTableViewController : UITableViewController<UISearchBarDelegate, UISearchDisplayDelegate, ContactViewControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic) NSMutableArray *connectionsID;
@property (nonatomic) NSMutableArray *connections;
@property (strong,nonatomic) NSMutableArray *filteredConnectArray;
@property (weak, nonatomic) IBOutlet UISearchBar *ConnectionSearchBar;
@property (nonatomic) NSInteger alphCount;
@property (nonatomic) NSMutableArray *alph;

@property (nonatomic) NSMutableArray *a;
@property (nonatomic) NSMutableArray *b;
@property (nonatomic) NSMutableArray *c;
@property (nonatomic) NSMutableArray *d;
@property (nonatomic) NSMutableArray *e;
@property (nonatomic) NSMutableArray *f;
@property (nonatomic) NSMutableArray *g;
@property (nonatomic) NSMutableArray *h;
@property (nonatomic) NSMutableArray *i;
@property (nonatomic) NSMutableArray *j;
@property (nonatomic) NSMutableArray *k;
@property (nonatomic) NSMutableArray *l;
@property (nonatomic) NSMutableArray *m;
@property (nonatomic) NSMutableArray *n;
@property (nonatomic) NSMutableArray *o;
@property (nonatomic) NSMutableArray *p;
@property (nonatomic) NSMutableArray *q;
@property (nonatomic) NSMutableArray *r;
@property (nonatomic) NSMutableArray *s;
@property (nonatomic) NSMutableArray *t;
@property (nonatomic) NSMutableArray *u;
@property (nonatomic) NSMutableArray *v;
@property (nonatomic) NSMutableArray *w;
@property (nonatomic) NSMutableArray *x;
@property (nonatomic) NSMutableArray *y;
@property (nonatomic) NSMutableArray *z;
@property (nonatomic) NSMutableArray *sha;


@property (nonatomic) NSString *phoneNumber;

@end
