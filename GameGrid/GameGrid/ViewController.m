//
//  ViewController.m
//  GameGrid
//
//  Created by MAC on 4/7/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // clear color
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.game = [GameManager new];

    float value = [self.sliderTime value];
    NSString *string = [NSString stringWithFormat:@"%3.0f", value];
    [self.labelTime setText:string];
    [self playMusic];

}

-(void) playMusic {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"];
    
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
    
    if (error) {
        
        NSLog(@"Error %@", error.description);
        
        return;
   
    }
    
    [self.audioPlayer prepareToPlay];
}
- (IBAction)start:(id)sender {
    
    [self.audioPlayer play];
    
    [self.game addGridToView:self];
    [self.buttonStart setTitle:@"" forState:UIControlStateNormal];

    self.timerForSlider = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];

    
}

-(void) updateSlider {
    if (self.sliderTime.value > 0) {
        self.sliderTime.value = self.sliderTime.value - 1;
        float value = [self.sliderTime value];
        NSString *string = [NSString stringWithFormat:@"%3.0f", value];
        [self.labelTime setText:string];
        if (self.sliderTime.value == 0) {
            
            [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                
                UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
                [self.view addSubview:imageView];
                
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
