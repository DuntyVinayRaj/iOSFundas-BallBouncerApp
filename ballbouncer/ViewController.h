//
//  ViewController.h
//  ballbouncer
//
//  Created by Vinay Raj on 26/07/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL xFlag;
    BOOL yFlag;
    int score, life;
    BOOL gameStarted;
}

@property (weak, nonatomic) IBOutlet UILabel *lbllife;
@property (weak, nonatomic) IBOutlet UILabel *lblscore;
@property (weak, nonatomic) IBOutlet UIButton *btnstart;
@property (weak, nonatomic) IBOutlet UIImageView *imgVwBall;
@property (weak, nonatomic) IBOutlet UIView *lblvw;
@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *btnTryAgain;

@end
