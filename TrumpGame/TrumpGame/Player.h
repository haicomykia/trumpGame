//
//  Player.h
//  TrumpGame
//
//  Created by 清水 凌 on 2015/11/14.
//  Copyright © 2015年 group-b. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject{
    
}

@property NSString *name;
@property NSMutableArray *hands;
@property int handsNum;
@property bool isPass;
@property int passCnt;

@end
