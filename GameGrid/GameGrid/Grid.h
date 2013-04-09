//
//  Grid.h
//  GameGrid
//
//  Created by MAC on 4/7/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CALayer.h>
#import "GameManager.h"

#define FRONT 0
#define BEHIND 1
#define REMOVE 2

@interface Grid : NSObject
@property (nonatomic) UIView *gridView;
@property (nonatomic) UIImageView *frontOfGridImageView;
@property (nonatomic) UIImageView *behindOfGridImageView;
@property (nonatomic) UITapGestureRecognizer *tapForGrid;
@property CGPoint pointAddGridView;
@property int tag;
@property int status;
@property int level;
@property UIView *view;


-(void) createGrid : (UIImage *) imageForBehindImageView;

@end
