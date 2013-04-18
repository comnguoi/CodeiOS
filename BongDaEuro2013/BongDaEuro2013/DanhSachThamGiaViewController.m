//
//  DanhSachThamGiaViewController.m
//  BongDaEuro2013
//
//  Created by MAC on 4/14/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DanhSachThamGiaViewController.h"
#import "DetailTableViewController.h"

#define ROW_HEIGHT 120
#define ROW_NUM    4

@interface DanhSachThamGiaViewController ()

@end

@implementation DanhSachThamGiaViewController

@synthesize _detailTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Bảng bốc thăm";
        [self.view setBackgroundColor:[UIColor grayColor]];

        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = @"Back";
        self.navigationItem.backBarButtonItem = backButton;
        
    }
    return self;
}

-(void) loadView {
    [super loadView];
    
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, ROW_HEIGHT * ROW_NUM);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"team" ofType:@"plist"];
    NSArray *arrayTeam = [NSArray arrayWithContentsOfFile:path];
    
    for (int i = 0; i < ROW_NUM; i++) {
        TeamTable *team = [[TeamTable alloc] init];
        team.frame = CGRectMake(0, ROW_HEIGHT * i, 320, ROW_HEIGHT);
        team.tag = i;
        
        UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"imagebackground.jpeg"]];
        background.frame = CGRectMake(0, 0, 320, 120);
        
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 115, 320, 2)];
        [line setBackgroundColor:[UIColor redColor]];
        
        
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[arrayTeam[i] valueForKey:@"name"]]];
        image.frame = CGRectMake(10, 0, 60, 60);
    
        UILabel *labelImageName = [[UILabel alloc] initWithFrame:CGRectMake(10,70, 100, 20)];
        [labelImageName setBackgroundColor:[UIColor clearColor]];
        labelImageName.text = [arrayTeam[i] valueForKey:@"tablename"];
        
        NSArray *arrayName = [arrayTeam[i] valueForKey:@"listteam"];
        
        UILabel *label01 = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 190, 30)];
        label01.text = arrayName[0];
        [label01 setBackgroundColor:[UIColor clearColor]];
        [label01 setTextColor:[UIColor redColor]];
        
        
        UILabel *label02 = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, 190, 60)];
        label02.text = arrayName[1];
        [label02 setBackgroundColor:[UIColor clearColor]];
        [label02 setTextColor:[UIColor purpleColor]];

        UILabel *label03 = [[UILabel alloc] initWithFrame:CGRectMake(210, 10, 320, 30)];
        label03.text = arrayName[2];
        [label03 setBackgroundColor:[UIColor clearColor]];
        [label03 setTextColor:[UIColor blueColor]];

        UILabel *label04 = [[UILabel alloc] initWithFrame:CGRectMake(210, 40, 320, 60)];
        label04.text = arrayName[3];
        [label04 setBackgroundColor:[UIColor clearColor]];
        [label04 setTextColor:[UIColor blackColor]];
        

        [team addSubview:background];
        [team addSubview: image];

        [team addSubview:labelImageName];
        [team addSubview:label01];
        [team addSubview:label02];
        [team addSubview:label03];
        [team addSubview:label04];
        [team addSubview:line];
        
        team.contentMode = UIViewContentModeScaleAspectFit;
        
        [_scrollView addSubview:team];
    }
    
    
    for (TeamTable *ele in _scrollView.subviews) {
        UITapGestureRecognizer *tapForView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapForTeam:)];
        [ele addGestureRecognizer:tapForView];

    }
    
}


-(void) tapForTeam : (id) sender {
    
    if (!_detailTableViewController) {
         _detailTableViewController = [[DetailTableViewController alloc] initWithNibName:@"DetailTableViewController" bundle:nil];
    }
    
    _detailTableViewController.tagTable = [sender view].tag;
    
    [self.navigationController pushViewController:_detailTableViewController animated:YES];
    

    
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
