//
//  ViewController.m
//  ShakeMeGame
//
//  Created by Jason Williams on 2016-01-20.
//  Copyright © 2016 Screaming Goat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    countInt = 10;
    scoreInt = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGame:(id)sender {
    
    if (scoreInt == 0) {
        countInt = 10;
        modeInt = 1;
        
        self.timerLabel.text = [NSString stringWithFormat:@"%i", countInt];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
        
        self.startButton.enabled = NO;
    }
    
    if (countInt == 0) {
        scoreInt = 0;
        countInt = 10;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        self.timerLabel.text = [NSString stringWithFormat:@"%i", countInt];
        
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];


    }
}

-(void)startCounter {
    
    countInt -= 1;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%i", countInt];
    
    if (countInt == 0) {
        [timer invalidate];
        
        modeInt = 2;
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
        self.startButton.enabled = YES;
    }

}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) {
        if (modeInt == 1) {
            scoreInt += 1;
            self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];

        }
    }
}
@end
