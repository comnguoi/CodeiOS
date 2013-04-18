//
//  DetailTableViewController.h
//  BongDaEuro2013
//
//  Created by MAC on 4/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTable.h"
#import "MemberViewController.h"

@interface DetailTableViewController : UIViewController

@property MemberViewController *_memberViewController;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property int tagTable;

@end
