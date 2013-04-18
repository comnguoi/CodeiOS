//
//  DetailTableViewController.m
//  BongDaEuro2013
//
//  Created by MAC on 4/15/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailTableViewController.h"
#import "MemberViewController.h"


#define ROW_HEIGHT 200
#define ROW_NUM 4

@interface DetailTableViewController () 

@property NSMutableArray *_arrayTeamFootball;
@property NSArray *_arrayBackGround;

@end

@implementation DetailTableViewController

@synthesize _memberViewController;

@synthesize tagTable, _arrayTeamFootball, _arrayBackGround;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor grayColor]];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = @"Back";
        self.navigationItem.backBarButtonItem = backButton;
        
        _arrayBackGround = [NSArray arrayWithObjects:
                            @"scrollviewimage1.png",
                            @"scrollviewimage2.jpeg",
                            @"scrollviewimage3.jpg",
                            @"scrollviewimage4.jpeg", nil];
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.tagTable == 0) {
        self.title = @"Bảng A";
    }
    else if (self.tagTable == 1) {
        self.title = @"Bảng B";
    }
    else if (self.tagTable == 2) {
        self.title = @"Bảng C";
    }
    else if (self.tagTable == 3) {
        self.title = @"Bảng D";
    }
    
    [self loadDetailTables];

}

-(void) loadView {
    [super loadView];
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, ROW_HEIGHT * ROW_NUM);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"danhsachdoibong" ofType:@"plist"];
    _arrayTeamFootball = [NSMutableArray arrayWithContentsOfFile:path];
    
}


-(void) loadDetailTables {
    
    for (int i = 0; i < 4; i++) {
        
        DetailTable *detailTable = [[DetailTable alloc] init];
        detailTable.frame = CGRectMake(0, ROW_HEIGHT * i, 320, ROW_HEIGHT);
        detailTable.tag = i;
 
        UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_arrayBackGround[i]]];
        background.frame = CGRectMake(0, 0, 320, 200);
        
        UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_arrayTeamFootball[self.tagTable * 4 + i] valueForKey:@"logo"]]];
        logo.frame = CGRectMake(10, 10, 90, 90);
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 197, 320, 3)];
        [line setBackgroundColor:[UIColor blackColor]];
        
        
        UILabel *footballName = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 100, 30)];
        footballName.text = [_arrayTeamFootball[self.tagTable * 4 + i] valueForKey:@"tendoibong"];
        [footballName setTextAlignment:NSTextAlignmentCenter];
        [footballName setBackgroundColor:[UIColor clearColor]];
        
        
        UILabel *trainer = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 240, 40)];
        NSString *_string = [NSString stringWithFormat:@"Coach : %@", [_arrayTeamFootball[self.tagTable * 4 + i] valueForKey:@"huanluyenvien"]];
        trainer.text = _string;
        [trainer setBackgroundColor:[UIColor clearColor]];
        
        UILabel *rank = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 240, 40)];
        _string = [NSString stringWithFormat:@"Rank : %@", [_arrayTeamFootball[self.tagTable * 4 + i] valueForKey:@"xephang"]];
        rank.text = _string;
        [rank setBackgroundColor:[UIColor clearColor]];
        
        UILabel *establish = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, 240, 40)];
        _string = [NSString stringWithFormat:@"Establish : %@", [_arrayTeamFootball[self.tagTable * 4 + i] valueForKey:@"namthanhlap"]];
        establish.text = _string;
        [establish setBackgroundColor:[UIColor clearColor]];
        
        UIButton *buttonDetailTeamFootball = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        buttonDetailTeamFootball.frame = CGRectMake(150, 150, 150, 30);
        [buttonDetailTeamFootball setTitle:@"View Member" forState:UIControlStateNormal];
//        [buttonDetailTeamFootball setBackgroundImage:[UIImage imageNamed:@"green.jpg"] forState:UIControlStateNormal];
        [buttonDetailTeamFootball addTarget:self action:@selector(viewMember:) forControlEvents:UIControlEventTouchUpInside];
        
        [detailTable addSubview:background];
        [detailTable addSubview: logo];
        [detailTable addSubview:footballName];
        [detailTable addSubview:trainer];
        [detailTable addSubview:rank];
        [detailTable addSubview:establish];
        [detailTable addSubview:buttonDetailTeamFootball];
        [detailTable addSubview:line];
        
        detailTable.contentMode = UIViewContentModeScaleAspectFit;
        
        [_scrollView addSubview:detailTable];
    }
    
    UILabel *lineStart = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 3)];
    [lineStart setBackgroundColor:[UIColor blackColor]];
    
    [_scrollView addSubview:lineStart];

}

-(void) viewMember : (id) sender {
    if (!_memberViewController) {
        _memberViewController = [[MemberViewController alloc] initWithNibName:@"MemberViewController" bundle:nil];
    }
    
    
    _memberViewController.tableIndex = tagTable;
    _memberViewController.teamIndex = [sender superview].tag;
    
    [self.navigationController pushViewController:_memberViewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
