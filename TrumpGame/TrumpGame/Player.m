//
//  Player.m
//  TrumpGame
//
//  Created by 清水 凌 on 2015/11/14.
//  Copyright © 2015年 group-b. All rights reserved.
//

#import "Player.h"

@implementation Player
- (id) init{
    if (self = [super init]) {
        self.hands = [NSMutableArray array];
        self.handsNum = 0;
        self.name = @"";
        self.isPass = false;
        self.passCnt = 4;
    }
    return  self;

}
@end
