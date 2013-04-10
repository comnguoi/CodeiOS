//
//  GameViewController.h
//  ReGameGrid
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *sliderTime;
@property (nonatomic) GameManager *gameManager;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelLevel;
@property NSTimer *timerForSlider;
@end
