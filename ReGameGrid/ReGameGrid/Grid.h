//
//  Grid.h
//  ReGameGrid
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CALayer.h>
#import <AVFoundation/AVFoundation.h>

#define INSIDE 0
#define FLIP   1
#define REMOVE 2

@interface Grid : UIView

@property int status;
@property (nonatomic) UIImageView *imageBeforeFlipGrid;
@property (nonatomic) UIImageView *imageAfterFlipGrid;
@property (nonatomic) UITapGestureRecognizer *tapForGrid;

-(void) initWithStatus : (int) status withImageName : (NSString *) imageName withImageForFlipGridName : (NSString *) imageForFlipGridName;
@end
