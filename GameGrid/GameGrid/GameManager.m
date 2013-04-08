//
//  GameManager.m
//  GameGrid
//
//  Created by MAC on 4/7/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "GameManager.h"

int countGridOfLevel;

@interface GameManager() {
    
//    int countGridOfLevel;
    Grid *grid;

}
@property (nonatomic) NSArray *imageLevel1, *imageLevel2, *imageLevel3;
@property (nonatomic) NSArray *position1, *position2, *position3;
@end

@implementation GameManager

-(id) init {
    if (self = [super init]) {
        self.arrayGrid = [[NSMutableArray alloc] init];
        self.level = 1;
        self.status = UPSIDEDOWN;


        self.imageLevel1 = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"im01.png"],
                            [UIImage imageNamed:@"im02.png"],
                            [UIImage imageNamed:@"im04.png"],
                            [UIImage imageNamed:@"star.png"],
                            [UIImage imageNamed:@"im05.png"],
                            [UIImage imageNamed:@"im06.png"],
                            [UIImage imageNamed:@"an01.png"],
                            [UIImage imageNamed:@"an02.png"],
                            [UIImage imageNamed:@"an03.png"],
                            [UIImage imageNamed:@"an04.png"],
                            [UIImage imageNamed:@"an05.png"],
                            [UIImage imageNamed:@"an06.png"],
                            [UIImage imageNamed:@"an07.png"],
                            [UIImage imageNamed:@"an08.png"],
                            [UIImage imageNamed:@"an09.png"],
                            [UIImage imageNamed:@"an10.png"],
                            nil];
        
        self.position1 = [NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:135],
                          [NSNumber numberWithFloat:140],
                          [NSNumber numberWithFloat:235],
                          [NSNumber numberWithFloat:90],
                          [NSNumber numberWithFloat:135],
                          [NSNumber numberWithFloat:190],
                          [NSNumber numberWithFloat:185],
                          [NSNumber numberWithFloat:140],
                          [NSNumber numberWithFloat:285],
                          [NSNumber numberWithFloat:90],
                          [NSNumber numberWithFloat:160],
                          [NSNumber numberWithFloat:90],
                          [NSNumber numberWithFloat:185],
                          [NSNumber numberWithFloat:240],
                          [NSNumber numberWithFloat:285],
                          [NSNumber numberWithFloat:140],
                          [NSNumber numberWithFloat:85],
                          [NSNumber numberWithFloat:190],
                          [NSNumber numberWithFloat:235],
                          [NSNumber numberWithFloat:240],
                          [NSNumber numberWithFloat:35],
                          [NSNumber numberWithFloat:340],
                          [NSNumber numberWithFloat:285],
                          [NSNumber numberWithFloat:240],
                          [NSNumber numberWithFloat:285],
                          [NSNumber numberWithFloat:340],
                          [NSNumber numberWithFloat:235],
                          [NSNumber numberWithFloat:190],
                          [NSNumber numberWithFloat:35],
                          [NSNumber numberWithFloat:390],
                          [NSNumber numberWithFloat:85],
                          [NSNumber numberWithFloat:290],
                          [NSNumber numberWithFloat:35],
                          [NSNumber numberWithFloat:240],
                          [NSNumber numberWithFloat:85],
                          [NSNumber numberWithFloat:390],
                          [NSNumber numberWithFloat:135],
                          [NSNumber numberWithFloat:290],
                          [NSNumber numberWithFloat:285],
                          [NSNumber numberWithFloat:390],
                          [NSNumber numberWithFloat:185],
                          [NSNumber numberWithFloat:290],
                          [NSNumber numberWithFloat:235],
                          [NSNumber numberWithFloat:390],
                          [NSNumber numberWithFloat:85],
                          [NSNumber numberWithFloat:240],
                          [NSNumber numberWithFloat:185],
                          [NSNumber numberWithFloat:190],
                          [NSNumber numberWithFloat:35],
                          [NSNumber numberWithFloat:140],
                          [NSNumber numberWithFloat:135],
                          [NSNumber numberWithFloat:240],
                          [NSNumber numberWithFloat:185],
                          [NSNumber numberWithFloat:340],
                          [NSNumber numberWithFloat:85],
                          [NSNumber numberWithFloat:90],
                          [NSNumber numberWithFloat:160],
                          [NSNumber numberWithFloat:390],
                          [NSNumber numberWithFloat:235],
                          [NSNumber numberWithFloat:290],
                          [NSNumber numberWithFloat:35],
                          [NSNumber numberWithFloat:90],
                          [NSNumber numberWithFloat:135],
                          [NSNumber numberWithFloat:340],
                          nil];        
    }
    return self;
}

-(void) addGridToView : (UIViewController *) viewController {
//    switch (self.level) {
//        case 1:
//            self.imageGrid = self.imageLevel1;
//            countGridOfLevel = 4;
//            self.position = self.position1;
//            break;
//        case 2:
//            self.imageGrid = self.imageLevel1;
//            countGridOfLevel = 6;
//            self.position = self.position2;
//            break;
//        case 3:
//            self.imageGrid = self.imageLevel2;
//            countGridOfLevel = 8;
//            self.position = self.position3;
//            break;
//        default:
//            break;
//    }
    
    self.imageGrid = self.imageLevel1;
    countGridOfLevel = 32;
    self.position = self.position1;
    
    for (int i = 0; i < countGridOfLevel/2; i++) {
        Grid *grid1 = [Grid new];
        [grid1 createGrid:self.imageGrid[i]];
        grid1.tag = i;
        grid1.level = countGridOfLevel;
        grid1.view = viewController.view;
        
        Grid *grid2 = [Grid new];
        [grid2 createGrid:self.imageGrid[i]];
        grid2.tag = i;
        grid2.level = countGridOfLevel;
        grid2.view = viewController.view;
        
        [self.arrayGrid addObject:grid1];
        [self.arrayGrid addObject:grid2];
  
    }
    
    int flag = 0;
    
//    NSLog(@"%d", [self.arrayGrid count]);
//    NSLog(@"%d", [self.position count]);
    
    for (int i = 0; i < countGridOfLevel; i++) {
    
        [viewController.view addSubview:[self.arrayGrid[i] gridView]];
        
        [self.arrayGrid[i] gridView].center = CGPointMake([self.position[flag] floatValue], [self.position[flag + 1] floatValue]);
        flag = flag + 2;

    }

}



@end
