//
//  gameoverViewController.m
//  TrumpGame
//
//  Created by 清水 凌 on 2015/11/15.
//  Copyright © 2015年 group-b. All rights reserved.
//

#import "gameoverViewController.h"
@interface gameoverViewController()
@property (weak, nonatomic) IBOutlet UILabel *yourResultLabel;
@property (weak, nonatomic) IBOutlet UILabel *com1ResultLabel;
@property (weak, nonatomic) IBOutlet UILabel *com2ResultLabel;
@property (weak, nonatomic) IBOutlet UILabel *com3ResultLabel;

@end

@implementation gameoverViewController

@synthesize player1Remaincards;
@synthesize player2Remaincards;
@synthesize player3Remaincards;
@synthesize player4Remaincards;

-(void) viewWillAppear:(BOOL)animated{
    
    int rankdata[4] = {player1Remaincards,player2Remaincards,player3Remaincards,player4Remaincards};
    int rank[4] = {1,1,1,1};
    
    //順位付け
    for (int i=0;i<3;i++) {
        for (int j=i+1; j<4; j++) {
            if (rankdata[i]>rankdata[j]) {
                rank[i]++;
            }else if (rankdata[i]<=rankdata[j]){
                rank[j]++;
            }
        }
    }
    
    self.yourResultLabel.text = [NSString stringWithFormat:@"あなたの順位は%d位です。",rank[0]];
    self.com1ResultLabel.text = [NSString stringWithFormat:@"Com1の順位は%d位です。",rank[1]];
    self.com2ResultLabel.text = [NSString stringWithFormat:@"Com2の順位は%d位です。",rank[2]];
    self.com3ResultLabel.text = [NSString stringWithFormat:@"Com3の順位は%d位です。",rank[3]];
    
    for (int i=0; i<4; i++) {
        NSLog(@"%d",rankdata[i]);
    }
    
}
@end
