//
//  Grid.m
//  ReGameGrid
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Grid.h"

int indexGrid = 0;
NSMutableArray *arrayProcessGrid;

@interface Grid() {
    NSString *_imageName, *_imageForFlipGridName;
}
@property (nonatomic) AVAudioPlayer *_audioPlayerBeep,
                                    *_audioPlayerError,
                                    *_audioPlayerEmpty;
@end

@implementation Grid

@synthesize _audioPlayerBeep, _audioPlayerError, _audioPlayerEmpty;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) initWithStatus : (int) status
         withImageName : (NSString *) imageName
withImageForFlipGridName : (NSString *) imageForFlipGridName {
    
    self.status = status;
    _imageName = imageName;
    _imageForFlipGridName = imageForFlipGridName;
    
    // constructor
    self.frame = CGRectMake(0, 0, 50, 50);
    
    self.imageBeforeFlipGrid = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageName]];
    [self makeGridCool:self.imageBeforeFlipGrid];
    self.imageAfterFlipGrid = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageForFlipGridName]];
    [self makeGridCool:self.imageAfterFlipGrid];
    
    UITapGestureRecognizer *tapForGrid = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipGrid)];
    
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:tapForGrid];
    
    if (self.status == INSIDE) {
        [self addSubview:self.imageBeforeFlipGrid];
    }
    
    [self playMusic];
    
}


-(void) flipGrid {
    // insert code when tap for grid
    
    if (self.status == INSIDE) {
        
        [UIView transitionWithView:self duration:0.3f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
            [_audioPlayerBeep play];
            [self addSubview:self.imageAfterFlipGrid];
            [self.imageAfterFlipGrid setBackgroundColor:[UIColor grayColor]];
            
        }completion:^(BOOL finished) {
            
            self.status = FLIP;
            indexGrid++;
            if (indexGrid == 1) {
                arrayProcessGrid = [NSMutableArray new];
            }
            [self checkCompareGrid];
            
        }];
        
    }
    else if (self.status == FLIP) {
        
        [UIView transitionWithView:self duration:0.3f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            
            [self addSubview:self.imageBeforeFlipGrid];
            
        }completion:^(BOOL finished) {
            
            self.status = INSIDE;
            
        }];
    }
}

-(void) checkCompareGrid {

        if (indexGrid == 1) {
            [arrayProcessGrid addObject:self];
        }
        
        if (indexGrid == 2) {
            indexGrid = 0;
            [arrayProcessGrid addObject:self];
            Grid *grid1 = [arrayProcessGrid objectAtIndex:0];
            Grid *grid2 = [arrayProcessGrid objectAtIndex:1];
            
            if ((grid1.tag != grid2.tag) && (grid1.status == FLIP) && (grid2.status == FLIP)) {
                
                [_audioPlayerError play];
                [UIView transitionWithView:grid1 duration:0.4f options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                    
                    [grid1 addSubview:grid1.imageBeforeFlipGrid];
                    
                }completion:^(BOOL finished) {
                    grid1.status = INSIDE;
                }];
                
                [UIView transitionWithView:grid2 duration:0.4f options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                    
                        [grid2 addSubview:grid2.imageBeforeFlipGrid];
                    
                }completion:^(BOOL finished) {
                    grid2.status = INSIDE;
                }];
                
            }
            else {
                

                [UIView animateWithDuration:0.01f animations:^{
                    [_audioPlayerEmpty play];                       
                }];
                
                [UIView animateWithDuration:0.1f animations:^{
                    grid1.center = CGPointMake(grid1.center.x - 5, grid1.center.y - 5);
                    grid2.center = CGPointMake(grid2.center.x - 5, grid2.center.y - 5);
                }completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1f animations:^{
                        grid1.center = CGPointMake(grid1.center.x + 5, grid1.center.y + 5);
                        grid2.center = CGPointMake(grid2.center.x + 5, grid2.center.y + 5);
                    }completion:^(BOOL finished) {
                        [grid1 removeFromSuperview];
                        [grid2 removeFromSuperview];
                    }];
                }];

                [arrayProcessGrid removeAllObjects];
                
            }
        }
}

-(void) makeGridCool : (UIImageView *) imageView{
    
    imageView.layer.masksToBounds = YES;
    
    UIRectCorner corner = UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerTopRight;
    CGSize radii = CGSizeMake(15.0, 15.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:corner cornerRadii:radii];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    [maskLayer setPath:path.CGPath];
    imageView.layer.mask = maskLayer;
    
}

-(void) playMusic {
    NSString* filePathBeep = [[NSBundle mainBundle] pathForResource:@"beep" ofType:@"mp3"];
    NSString* filePathError = [[NSBundle mainBundle] pathForResource:@"error" ofType:@"mp3"];
    NSString* filePathEmpty = [[NSBundle mainBundle] pathForResource:@"empty" ofType:@"aif"];
    
    NSURL *urlBeep = [NSURL fileURLWithPath:filePathBeep];
    NSURL *urlError = [NSURL fileURLWithPath:filePathError];
    NSURL *urlEmpty = [NSURL fileURLWithPath:filePathEmpty];
    
    NSError *error;
    
    _audioPlayerBeep = [[AVAudioPlayer alloc] initWithContentsOfURL:urlBeep error: &error];
    _audioPlayerError = [[AVAudioPlayer alloc] initWithContentsOfURL:urlError error: &error];
    _audioPlayerEmpty = [[AVAudioPlayer alloc] initWithContentsOfURL:urlEmpty error: &error];
    
    if (error) {
        NSLog(@"Error %@", error.description);
        
        return;
        
    }
    
    _audioPlayerEmpty.volume = 0.9;
    _audioPlayerError.volume = 0.9;
    
    [_audioPlayerBeep prepareToPlay];
    [_audioPlayerError prepareToPlay];
    [_audioPlayerEmpty prepareToPlay];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
