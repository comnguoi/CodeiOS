//
//  GameManager.m
//  ReGameGrid
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "GameManager.h"

int levelLocal = 0;

@interface GameManager()

@property (nonatomic) NSMutableArray *_arrayGrid;
@property (nonatomic) NSMutableArray *_arrayImageName;
@property (nonatomic) NSArray *_position;


@end

@implementation GameManager

@synthesize _arrayGrid, _gameLevel, _arrayImageName;
@synthesize _audioPlayerFlip,
            _audioBackground;
@synthesize _position, countGrid;

-(void) initGameManager {
    
//    _gameLevel = 1;
    _arrayGrid = [[NSMutableArray alloc] init];
    _arrayImageName = [NSMutableArray arrayWithObjects:
                       @"an01.png", @"an02.png", @"an03.png", @"an04.png",
                       @"an05.png", @"an06.png", @"an07.png", @"an08.png",
                       @"an09.png", @"an10.png", @"im01.png", @"im02.png",
                       @"star.png", @"im04.png", @"im05.png", @"im06.png", nil];
    
    
    
    [self playMusic];
    
}


-(void) addGridToView : (UIViewController *) viewController {
    
    NSArray *position1 = [NSArray arrayWithObjects:
                          @"130", @"210",
                          @"130", @"270",
                          @"190", @"210",
                          @"190", @"270",nil];
    
    NSArray *position4 = [NSArray arrayWithObjects:
                          @"70", @"150", @"130", @"150",
                          @"130", @"210", @"130", @"330",
                          @"190", @"210", @"190", @"150",
                          @"250", @"150", @"190", @"270",
                          @"250", @"270", @"70", @"210",
                          @"190", @"330", @"70", @"270",
                          @"130", @"270", @"250", @"210",
                          @"70", @"330", @"250", @"330",nil];
    
    NSArray *position2 = [NSArray arrayWithObjects:
                          @"130", @"150", @"190", @"270",
                          @"190", @"150", @"130", @"210",
                          @"130", @"270", @"190", @"210",
                          @"130", @"330", @"190", @"330",nil];
    
    NSArray *position3 = [NSArray arrayWithObjects:
                          @"160", @"150", @"130", @"210",
                          @"190", @"210", @"70", @"240",
                          @"250", @"240", @"130", @"270",
                          @"190", @"270", @"160", @"330",nil];
    
    NSArray *position5 = [NSArray arrayWithObjects:
                          @"130", @"150", @"190", @"270",
                          @"190", @"150", @"130", @"210",
                          @"130", @"270", @"190", @"210",
                          @"130", @"330", @"190", @"330",nil];
    //play music background
    [_audioBackground play];
    
    switch (_gameLevel) {
        case 1:
            countGrid = 4;
            _position = position1;
            break;
        case 2:
            countGrid = 8;
            _position = position2;
            break;
        case 3:
            countGrid = 8;
            _position = position3;
            break;
        case 4:
            countGrid = 16;
            _position = position4;
            break;
        case 5:
            countGrid = 20;
            _position = position5;
            break;
        default:
            break;
    }

    // tao cac grid roi add vao array grid
    for (int i = 0; i < countGrid/2; i++) {
        Grid *grid1 = [Grid new];
        grid1.tag = i;
        Grid *grid2 = [Grid new];
        grid2.tag = i;
        [_arrayGrid addObject:grid1];
        [_arrayGrid addObject:grid2];
    }

    // khoi tao anh
    for (int i = 0; i < [_arrayGrid count]; i += 2) {
        [[_arrayGrid objectAtIndex:i] initWithStatus:INSIDE withImageName:@"question.jpg" withImageForFlipGridName:_arrayImageName[i]];
        
        [[_arrayGrid objectAtIndex:i + 1] initWithStatus:INSIDE withImageName:@"question.jpg" withImageForFlipGridName:_arrayImageName[i]];
    }

    // add vao vi tri
    int temp = 0;
    for(int i = 0; i < [_arrayGrid count]; i++) {
        [viewController.view addSubview:[_arrayGrid objectAtIndex:i]];
        
        ((Grid *)[_arrayGrid objectAtIndex:i]).center = CGPointMake([_position[temp] floatValue], [_position[temp + 1] floatValue]);
        temp = temp + 2;
    }
    
}

-(void) playMusic {

    NSString* filePathFlip = [[NSBundle mainBundle] pathForResource:@"flip" ofType:@"mp3"];
    NSString* filePathBackground = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"];
    

    NSURL *urlFlip = [NSURL fileURLWithPath:filePathFlip];
    NSURL *urlBackGround = [NSURL fileURLWithPath:filePathBackground];
    
    NSError *error;
    
    _audioPlayerFlip = [[AVAudioPlayer alloc] initWithContentsOfURL:urlFlip error: &error];
    _audioBackground = [[AVAudioPlayer alloc] initWithContentsOfURL:urlBackGround error: &error];
    
    if (error) {
        NSLog(@"Error %@", error.description);
        
        return;
        
    }
    
    _audioBackground.volume = 0.1;
//    _audioBackground.
    
    [_audioPlayerFlip prepareToPlay];
    [_audioBackground prepareToPlay];
    
}


@end
