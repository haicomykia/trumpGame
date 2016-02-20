//
//  TrumpViewController.h
//  TrumpGame
//
//  Created by 清水 凌 on 2015/11/11.
//  Copyright © 2015年 group-b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrumpViewController : UIViewController
    //すべてのカード
    @property (readwrite) NSMutableArray *allCards;
    //先頭と末尾のカード
    @property(readwrite) NSMutableArray *topEnd;
    //Image View
    @property(readonly) NSArray *putCards;
    //トランプの画像（クローバー、ダイヤ、ハート、スペード）
    @property (readonly) NSArray *trumpCards;
    //ボタン（手札）
    @property(readonly) NSArray *handBtns;
    //手札の枚数
    @property (readonly) int cardnum;
@end

