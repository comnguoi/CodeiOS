//
//  GameManager.h
//  GameGrid
//
//  Created by MAC on 4/7/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grid.h"

#define UPSIDEDOWN 0
#define DELETEGRID 1
#define USERWIN    2 

@interface GameManager : NSObject

@property (nonatomic) NSMutableArray *arrayGrid;
@property int level;
@property (nonatomic) NSArray *imageGrid;
@property (nonatomic) UIView *viewGame;
@property (nonatomic) NSArray *position;
@property int status;

-(void) addGridToView : (UIViewController *) viewController;

@end
