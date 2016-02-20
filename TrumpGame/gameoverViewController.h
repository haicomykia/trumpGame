//
//  gameoverViewController.h
//  TrumpGame
//
//  Created by 清水 凌 on 2015/11/15.
//  Copyright © 2015年 group-b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gameoverViewController : UIViewController{
    int player1Remaincards;
    int player2Remaincards;
    int player3Remaincards;
    int player4Remaincards;
}

@property int player1Remaincards;           //プロパティに配列は使えない
@property int player2Remaincards;
@property int player3Remaincards;
@property int player4Remaincards;

@end
