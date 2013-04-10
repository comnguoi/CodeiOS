//
//  HomeViewController.m
//  ReGameGrid
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic) AVAudioPlayer *playMusicBackGround;
@property GameViewController *gameViewController;
@end

@implementation HomeViewController

@synthesize gameViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)startGame:(id)sender {

    gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    
    [self.navigationController pushViewController:gameViewController animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
