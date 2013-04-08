//
//  Grid.m
//  GameGrid
//
//  Created by MAC on 4/7/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Grid.h"

int localValue = 0;
NSMutableArray *arrayGrid;
int countCheck = 0;


@interface Grid() {
    
}

@end

@implementation Grid
-(id) init {
    if (self = [super init]) {
        
        self.gridView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        UIImage *star = [UIImage imageNamed:@"question.jpg"];
        
        self.frontOfGridImageView = [[UIImageView alloc] initWithImage:star];
        [self.frontOfGridImageView setFrame:CGRectMake(0, 0, 50, 50)];
        [self.behindOfGridImageView setFrame:CGRectMake(0, 0, 50, 50)];
        [self makeGridCool:self.frontOfGridImageView];
        
        self.tapForGrid = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip)];
        self.gridView.userInteractionEnabled = YES;
        [self.gridView addGestureRecognizer:self.tapForGrid];
        
        self.status = FRONT;
        [self.gridView addSubview:self.frontOfGridImageView];
        
        
        
    }
    return self;
}

-(void) flip {
    if (self.status == FRONT) {
        
            [UIView transitionWithView:self.gridView duration:0.8f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
                    self.frontOfGridImageView.tag = 1;
                    [[self.gridView viewWithTag:self.frontOfGridImageView.tag] removeFromSuperview];
                    [self.gridView addSubview:self.behindOfGridImageView];
                                
        
                }completion:^(BOOL finished) {
                    self.status = BEHIND;
                    localValue++;
                    if (localValue == 1) {
                        arrayGrid = [NSMutableArray new];
                    }
                    [self checkCompareGrid];
                }];
        
            }else if (self.status == BEHIND) {
                [UIView transitionWithView:self.gridView duration:0.8f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
                    self.behindOfGridImageView.tag = 2;
                    [[self.gridView viewWithTag:self.behindOfGridImageView.tag] removeFromSuperview];
                    [self.gridView addSubview:self.frontOfGridImageView];
        
                }completion:^(BOOL finished) {
                    self.status = FRONT;
                }];
            }
}

-(void) createGrid : (UIImage *) imageForBehindImageView {
    self.behindOfGridImageView = [[UIImageView alloc] initWithImage:imageForBehindImageView];
    [self.behindOfGridImageView setBackgroundColor:[UIColor yellowColor]];
    [self makeGridCool:self.behindOfGridImageView];
    [self.behindOfGridImageView.layer setBorderColor:[UIColor yellowColor].CGColor];

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

-(void) checkCompareGrid {
    if (localValue == 1) {
        
        [arrayGrid addObject:self];
        
    }
    
    if (localValue == 2) {
        
        localValue = 0;

        [arrayGrid addObject:self];
        
        Grid *grid1 = [arrayGrid objectAtIndex:0];
        Grid *grid2 = [arrayGrid objectAtIndex:1];
        
        if ((grid1.tag != grid2.tag) && (grid1.status == BEHIND) && grid2.status == BEHIND) {
            
            [UIView transitionWithView:grid1.gridView duration:1.0f options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                
                [grid1.gridView addSubview:grid1.frontOfGridImageView];
                
            }completion:^(BOOL finished) {
                grid1.status = FRONT;
            }];
            
            [UIView transitionWithView:grid2.gridView duration:1.0f options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                
                [grid2.gridView addSubview:grid2.frontOfGridImageView];
                
            }completion:^(BOOL finished) {
                grid2.status = FRONT;
            }];
            
        }
        else {
            
            [grid1.gridView removeFromSuperview];
            [grid2.gridView removeFromSuperview];
            
            [arrayGrid removeAllObjects];
            
            countCheck = countCheck + 2;
            // check count of view
            if (countCheck == self.level && ([arrayGrid count] == 0)) {
                
                [UIView transitionWithView:self.view duration:1.0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
                    
                    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"girlB.jpg"]];
                    [self.view addSubview:imageView];
                    
                }completion:^(BOOL finished) {
                    
                    UIAlertView *alertView = [[UIAlertView alloc]
                                              initWithTitle:@"Information"
                                              message:@"You win ... "
                                              delegate:self
                                              cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                    [alertView show];
                    
                }];

            }
            
        }
        
       
    }
}

@end
