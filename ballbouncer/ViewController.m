//
//  ViewController.m
//  ballbouncer
//
//  Created by Vinay Raj on 26/07/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // When No add, when YES Subtract
    
    [self setUp];
}

-(void)setUp
{
    score = 0;
    xFlag = NO;
    yFlag = NO;
    gameStarted = NO;
    life = 3;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Taptheballselector:(id)sender {
 
    if(gameStarted)
        score = score+5;
 self.lblscore.text = [NSString stringWithFormat:@"SCORE = %d", score];

}

- (IBAction)BallTapMissed:(id)sender {
    
    if( gameStarted )
        life--;
    
    self.lbllife.text = [NSString stringWithFormat:@"LIFE = %d", life];
    
    if( life == 0 )
       [self endGame];
}


- (IBAction)tryAgainClicked:(id)sender {
    [self.btnTryAgain setHidden:YES];
    [self setUp];
        [self startingTheGame];
}

-(void)endGame
{
    [self.timer invalidate];
    self.timer = nil;
    
    gameStarted = NO;
    self.imgVwBall.center = CGPointMake(160, self.view.frame.size.height/2);
    
    [self.btnTryAgain setHidden:NO];
}

- (IBAction)btnstart:(id)sender {
    
    [self startingTheGame];
}

-(void)startingTheGame
{
    gameStarted = YES;
    self.lblscore.text = [NSString stringWithFormat:@"SCORE= %d", 0];
    self.lbllife.text = [NSString stringWithFormat:@"LIFE= %d", 3];
    [self.btnstart setHidden:YES ];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(animateBall) userInfo:nil repeats:YES];
}


-(void)animateBall
{
    if( xFlag )
    {
        self.imgVwBall.center = CGPointMake(self.imgVwBall.center.x - 3,self.imgVwBall.center.y);
        
    }
    else
    {
       self.imgVwBall.center = CGPointMake(self.imgVwBall.center.x + 3,self.imgVwBall.center.y);
    }

    if(self.imgVwBall.center.x + (self.imgVwBall.frame.size.width/2) > 320)
    {
        xFlag = YES;
    }
    
    if(self.imgVwBall.center.x + (self.imgVwBall.frame.size.width/2) <= self.imgVwBall.frame.size.width)
    {
        xFlag = NO;
 }
    
    if(yFlag)
    {
        self.imgVwBall.center = CGPointMake(self.imgVwBall.center.x,self.imgVwBall.center.y-3);
    }
    else
    {
        self.imgVwBall.center = CGPointMake(self.imgVwBall.center.x,self.imgVwBall.center.y+3);
    }

    if(self.imgVwBall.center.y + (self.imgVwBall.frame.size.height/2)>568 )
    {
        yFlag=YES;
    }
    
    if((self.imgVwBall.center.y - (self.imgVwBall.frame.size.height/2)) <= self.lblvw.frame.origin.y + self.lblvw.frame.size.height )
    {
        yFlag=NO;
    }
    
}
@end
