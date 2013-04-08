//
//  ViewController.h
//  GameGrid
//
//  Created by MAC on 4/7/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UIButton *buttonStart;
@property (weak, nonatomic) IBOutlet UISlider *sliderTime;
@property (nonatomic) NSTimer *timerForSlider;
@property (nonatomic) GameManager *game;
@end
