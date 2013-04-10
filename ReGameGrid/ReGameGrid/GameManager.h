//
//  GameManager.h
//  ReGameGrid
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Grid.h"

@interface GameManager : NSObject

@property int countGrid;
@property int _gameLevel;
@property (nonatomic) AVAudioPlayer *_audioPlayerFlip, *_audioBackground;

-(void) initGameManager;
-(void) addGridToView : (UIViewController *) viewController;
@end
