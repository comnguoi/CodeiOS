//
//  KetQuaViewController.m
//  BongDaEuro2013
//
//  Created by MAC on 4/14/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "KetQuaViewController.h"
#import "Result.h"

#define ROW_HEIGHT 150
#define ROW_NUM    8

@interface KetQuaViewController ()

@end

@implementation KetQuaViewController

@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Kết quả";
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
        backButton.title = @"Back";
        self.navigationItem.backBarButtonItem = backButton;
    }
    return self;
}

-(void) loadView {
    [super loadView];
    
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, ROW_HEIGHT * ROW_NUM);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"danhsachdoibong" ofType:@"plist"];
    NSArray *_arrayTeam = [NSArray arrayWithContentsOfFile:path];
    
    
    int j = 0;
    for (int i = 0; i < [_arrayTeam count]/2; i++) {
        
        Result *result = [[Result alloc] init];
        result.frame = CGRectMake(0, ROW_HEIGHT * i, 320, ROW_HEIGHT);
        result.tag = i;
    
        
        UIImageView *imageLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_arrayTeam[j] valueForKey:@"logo"]]];
        UIImageView *imageRight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_arrayTeam[j + 1] valueForKey:@"logo"]]];
        imageLeft.frame = CGRectMake(20, 10, 80, 80);
        imageRight.frame = CGRectMake(220, 10, 80, 80);
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 320, 2)];
        [line setBackgroundColor:[UIColor redColor]];
        
        UILabel *timeLeft = [[UILabel alloc] initWithFrame:CGRectMake(130, 30, 120, 30)];
        timeLeft.text = [_arrayTeam[j] valueForKey:@"count"];
        [timeLeft setBackgroundColor:[UIColor clearColor]];
        [timeLeft setTextColor:[UIColor redColor]];
        
        UILabel *timeRight = [[UILabel alloc] initWithFrame:CGRectMake(160, 30, 100, 30)];
        timeRight.text = [_arrayTeam[j + 1] valueForKey:@"count"];
        [timeRight setBackgroundColor:[UIColor clearColor]];
        [timeRight setTextColor:[UIColor redColor]];
        
        UILabel *teamLeft = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 110, 30)];
        teamLeft.text = [_arrayTeam[j] valueForKey:@"tendoibong"];
        [teamLeft setBackgroundColor:[UIColor clearColor]];
        [teamLeft setTextAlignment:NSTextAlignmentCenter];
        //        [teamLeft setTextColor:[UIColor redColor]];
        
        UILabel *teamRight = [[UILabel alloc] initWithFrame:CGRectMake(200, 100, 110, 30)];
        teamRight.text = [_arrayTeam[j + 1] valueForKey:@"tendoibong"];
        [teamRight setBackgroundColor:[UIColor clearColor]];
        [teamRight setTextAlignment:NSTextAlignmentCenter];
        //        [teamRight setTextColor:[UIColor redColor]];
        
        
        //        [playCalendar addSubview:background];
        [result addSubview:imageLeft];
        [result addSubview:imageRight];
        [result addSubview:timeLeft];
        [result addSubview:timeRight];
        [result addSubview:teamLeft];
        [result addSubview:teamRight];
        [result addSubview:line];
        
        result.contentMode = UIViewContentModeScaleAspectFill;
        
        [scrollView addSubview:result];
        
        
        j = j + 2;
    }

    
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
