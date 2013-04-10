//
//  GameViewController.m
//  ReGameGrid
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

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
    
    self.gameManager = [GameManager new];
    [self start];
}

-(void) start {
    if ((self.gameManager._gameLevel != 0) && (self.gameManager._gameLevel < 5)) {
        self.gameManager._gameLevel = self.gameManager._gameLevel + 1;
    }
    else if (self.gameManager._gameLevel == 0) {
        
        self.gameManager._gameLevel = 1;
    }
    
    if (self.gameManager._gameLevel == 5) {
        
        exit(0);
    }
    
    [self.gameManager initGameManager];
    [self.gameManager addGridToView:self];
    [self initGame];
    [self updateSlider];
}


-(void) initGame {
    self.sliderTime.minimumValue = 0;
    
    if (self.gameManager._gameLevel == 1) {
        self.sliderTime.maximumValue = 10;
    }
    else if (self.gameManager._gameLevel == 2) {
        self.sliderTime.maximumValue = 30;
    }
    else if (self.gameManager._gameLevel == 3) {
        self.sliderTime.maximumValue = 30;
    }
    else if (self.gameManager._gameLevel == 4) {
        self.sliderTime.maximumValue = 50;
    }
    else if (self.gameManager._gameLevel == 5) {
        self.sliderTime.maximumValue = 50;
    }
    
    float levelValue = self.gameManager._gameLevel;
    NSString *string = [NSString stringWithFormat:@"%3.0f", levelValue];
    [self.labelLevel setText:string];
    
    self.sliderTime.value = self.sliderTime.maximumValue;
    self.timerForSlider = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
}

-(void) updateSlider {
    
//    NSLog(@"%d", [[self.view subviews] count]);
    
    if (self.sliderTime.value > 0) {
        
        self.sliderTime.value = self.sliderTime.value - 1;
        float value = [self.sliderTime value];
        NSString *string = [NSString stringWithFormat:@"%3.0f", value];
        [self.labelTime setText:string];
        
        int count = 0;
        for (UIView *ele in [self.view subviews]) {
            if ([ele isKindOfClass:[Grid class]]) {
                count ++;
            }
        }
        
        if ((count == 0) && (self.sliderTime.value > 0)) {
            
            [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                
                [self.timerForSlider invalidate];
                
                UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                buttonBack.frame = CGRectMake(10, 30, 80, 30);
                [buttonBack setTitle:@"Continue" forState:UIControlStateNormal];
                [self.view addSubview:buttonBack];
                [buttonBack addTarget:self action:@selector(continueGame) forControlEvents:UIControlEventTouchUpInside];
                                
            }completion:^(BOOL finished) {
                
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Information"
                                          message:@"You win ... "
                                          delegate:self
                                          cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                [alertView show];
                
            }];
            
        }
        else if (self.sliderTime.value == 0) {
            
            [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                
                UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
                [self.view addSubview:imageView];
            
                UIButton *buttonBack = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                buttonBack.frame = CGRectMake(10, 30, 50, 30);
                [buttonBack setTitle:@"Back" forState:UIControlStateNormal];
                [self.view addSubview:buttonBack];
                [buttonBack addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
                
            }completion:^(BOOL finished) {
                
                UIAlertView *alertView = [[UIAlertView alloc]
                                          initWithTitle:@"Information"
                                          message:@"You loss ... "
                                          delegate:self
                                          cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                [alertView show];
                
            }];
        }
    }
    
}

-(void) continueGame {
    [self.gameManager._audioBackground stop];
    
    for (UIView *ele in [self.view subviews]) {
        if ([ele isKindOfClass:[Grid class]]) {
            ele.tag = 1;
            [[self.view viewWithTag:ele.tag] removeFromSuperview];
        }
    }
    
    [self start];

}

-(void) backViewController {
    
    [self.gameManager._audioBackground stop];
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
