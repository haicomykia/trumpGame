//
//  TrumpViewController.m
//  TrumpGame
//
//  Created by 清水 凌 on 2015/11/11.
//  Copyright © 2015年 group-b. All rights reserved.
//

#import "TrumpViewController.h"
#import "Player.h"
#import "gameoverViewController.h"

@interface TrumpViewController ()<UIAlertViewDelegate>{
    Player *you;
    Player *com;
    Player *com2;
    Player *com3;
    NSArray *players;
}
//手札
@property (weak, nonatomic) IBOutlet UIButton *yourhand01;
@property (weak, nonatomic) IBOutlet UIButton *yourhand02;
@property (weak, nonatomic) IBOutlet UIButton *yourhand03;
@property (weak, nonatomic) IBOutlet UIButton *yourhand04;
@property (weak, nonatomic) IBOutlet UIButton *yourhand05;
@property (weak, nonatomic) IBOutlet UIButton *yourhand06;
@property (weak, nonatomic) IBOutlet UIButton *yourhand07;
@property (weak, nonatomic) IBOutlet UIButton *yourhand08;
@property (weak, nonatomic) IBOutlet UIButton *yourhand09;
@property (weak, nonatomic) IBOutlet UIButton *yourhand10;
@property (weak, nonatomic) IBOutlet UIButton *yourhand11;
@property (weak, nonatomic) IBOutlet UIButton *yourhand12;

//カードの表示
@property (weak, nonatomic) IBOutlet UIImageView *c01;
@property (weak, nonatomic) IBOutlet UIImageView *d01;
@property (weak, nonatomic) IBOutlet UIImageView *h01;
@property (weak, nonatomic) IBOutlet UIImageView *s01;

@property (weak, nonatomic) IBOutlet UIImageView *c02;
@property (weak, nonatomic) IBOutlet UIImageView *d02;
@property (weak, nonatomic) IBOutlet UIImageView *h02;
@property (weak, nonatomic) IBOutlet UIImageView *s02;

@property (weak, nonatomic) IBOutlet UIImageView *c03;
@property (weak, nonatomic) IBOutlet UIImageView *d03;
@property (weak, nonatomic) IBOutlet UIImageView *h03;
@property (weak, nonatomic) IBOutlet UIImageView *s03;

@property (weak, nonatomic) IBOutlet UIImageView *c04;
@property (weak, nonatomic) IBOutlet UIImageView *d04;
@property (weak, nonatomic) IBOutlet UIImageView *h04;
@property (weak, nonatomic) IBOutlet UIImageView *s04;

@property (weak, nonatomic) IBOutlet UIImageView *c05;
@property (weak, nonatomic) IBOutlet UIImageView *d05;
@property (weak, nonatomic) IBOutlet UIImageView *h05;
@property (weak, nonatomic) IBOutlet UIImageView *s05;

@property (weak, nonatomic) IBOutlet UIImageView *c06;
@property (weak, nonatomic) IBOutlet UIImageView *d06;
@property (weak, nonatomic) IBOutlet UIImageView *h06;
@property (weak, nonatomic) IBOutlet UIImageView *s06;

@property (weak, nonatomic) IBOutlet UIImageView *c07;
@property (weak, nonatomic) IBOutlet UIImageView *d07;
@property (weak, nonatomic) IBOutlet UIImageView *h07;
@property (weak, nonatomic) IBOutlet UIImageView *s07;

@property (weak, nonatomic) IBOutlet UIImageView *c08;
@property (weak, nonatomic) IBOutlet UIImageView *d08;
@property (weak, nonatomic) IBOutlet UIImageView *h08;
@property (weak, nonatomic) IBOutlet UIImageView *s08;

@property (weak, nonatomic) IBOutlet UIImageView *c09;
@property (weak, nonatomic) IBOutlet UIImageView *d09;
@property (weak, nonatomic) IBOutlet UIImageView *h09;
@property (weak, nonatomic) IBOutlet UIImageView *s09;

@property (weak, nonatomic) IBOutlet UIImageView *c10;
@property (weak, nonatomic) IBOutlet UIImageView *d10;
@property (weak, nonatomic) IBOutlet UIImageView *h10;
@property (weak, nonatomic) IBOutlet UIImageView *s10;

@property (weak, nonatomic) IBOutlet UIImageView *c11;
@property (weak, nonatomic) IBOutlet UIImageView *d11;
@property (weak, nonatomic) IBOutlet UIImageView *h11;
@property (weak, nonatomic) IBOutlet UIImageView *s11;

@property (weak, nonatomic) IBOutlet UIImageView *c12;
@property (weak, nonatomic) IBOutlet UIImageView *d12;
@property (weak, nonatomic) IBOutlet UIImageView *h12;
@property (weak, nonatomic) IBOutlet UIImageView *s12;

@property (weak, nonatomic) IBOutlet UIImageView *c13;
@property (weak, nonatomic) IBOutlet UIImageView *d13;
@property (weak, nonatomic) IBOutlet UIImageView *h13;
@property (weak, nonatomic) IBOutlet UIImageView *s13;

@property (weak, nonatomic) IBOutlet UILabel *com1Label;
@property (weak, nonatomic) IBOutlet UILabel *com2Label;
@property (weak, nonatomic) IBOutlet UILabel *com3Label;

@property (weak, nonatomic) IBOutlet UILabel *passLabel;

@end

@implementation TrumpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初期化＆準備
    [self initCards];
    
    _cardnum = 12;
    
    you = [[Player alloc] init];
    com= [[Player alloc] init];
    com2 = [[Player alloc] init];
    com3 = [[Player alloc] init];
    
    you.name = @"あなた";
    
    players = @[you,com,com2,com3];
    
    for (int i=0; i<players.count; i++) {
        Player *pl = players[i];
        pl.handsNum = _cardnum;
    }
    
    you = players[0];
    [self setCards:you.hands handsNum:you.handsNum];
    
    for (int j=1; j<players.count; j++) {
        Player *pl = players[j];
        [self setCards:pl.hands handsNum:pl.handsNum];
        pl.name =  [@"Com" stringByAppendingString:[NSString stringWithFormat:@"%d",j]];
    }
    
    [self printHand:you.hands size:you.handsNum];
    
    [self gameInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) initCards{
    _allCards = [NSMutableArray array];
    //すべてのカードの状態を格納する配列の初期化 0=配られていない,1=配られた
    for (int i=0; i<52; i++) {
        [_allCards addObject:@0];       //末尾に要素を追加
    }
    _trumpCards = @[@"c01.png",@"c02.png",@"c03.png",@"c04.png",@"c05.png",@"c06.png",@"c07.png",@"c08.png",@"c09.png",@"c10.png",@"c11.png",@"c12.png",@"c13.png",
                    @"d01.png",@"d02.png",@"d03.png",@"d04.png",@"d05.png",@"d06.png",@"d07.png",@"d08.png",@"d09.png",@"d10.png",@"d11.png",@"d12.png",@"d13.png",
                    @"h01.png",@"h02.png",@"h03.png",@"h04.png",@"h05.png",@"h06.png",@"h07.png",@"h08.png",@"h09.png",@"h10.png",@"h11.png",@"h12.png",@"h13.png",
                    @"s01.png",@"s02.png",@"s03.png",@"s04.png",@"s05.png",@"s06.png",@"s07.png",@"s08.png",@"s09.png",@"s10.png",@"s11.png",@"s12.png",@"s13.png"
        ];
    //カード置き場のimage view
    _putCards = @[
                  self.c01,self.c02, self.c03,self.c04, self.c05,self.c06, self.c07,self.c08, self.c09,self.c10, self.c11,self.c12,self.c13,
                  self.d01,self.d02, self.d03,self.d04, self.d05,self.d06, self.d07,self.d08, self.d09,self.d10, self.d11,self.d12,self.d13,
                  self.h01,self.h02, self.h03,self.h04, self.h05,self.h06, self.h07,self.h08, self.h09,self.h10, self.h11,self.h12,self.h13,
                  self.s01,self.s02, self.s03,self.s04, self.s05,self.s06, self.s07,self.s08, self.s09,self.s10, self.s11,self.s12,self.s13,
    ];
    _handBtns = @[
                  self.yourhand01,self.yourhand02,self.yourhand03,self.yourhand04,self.yourhand05,self.yourhand06,self.yourhand07,self.yourhand08,self.yourhand09,self.yourhand10,self.yourhand11,self.yourhand12
    ];
}

-(void) setCards:(NSMutableArray *)hands handsNum:(int) size{
    int cardCounter = 0;
    while (cardCounter < size) {
        //乱数発生。カードは0~52の通し番号で管理する（ジョーカーはない）
        int index  = ((int)(arc4random_uniform(52)));
        if(index%13==6) continue;           //7は配らない
        //index番目のカードが配れていなければカードを配る
        if ([self.allCards[index]  isEqual: @0]) {
            self.allCards[index] = [NSNumber numberWithInt:1];
            hands[cardCounter] = [NSNumber numberWithInteger:index];
            cardCounter++;
        }
    }
}

-(void)printHand:(NSMutableArray *)hands size:(int)size{
    for (int i=0;i<size; i++) {
        UIButton *btn = _handBtns[i];
        int num = [hands[i] intValue];
        btn.tag = i;
        [btn setBackgroundImage:[UIImage imageNamed:_trumpCards[num]] forState:UIControlStateNormal];
    }
    for (int j=size; j<_handBtns.count; j++) {
        UIButton *btn = _handBtns[j];
        btn.enabled = NO;
        btn.hidden = YES;
    }
}

-(void) gameInit{
    _topEnd = [NSMutableArray array];
    int i;
    for (i=0; i<4; i++) {
        NSArray *mk = @[@6,@6];
        NSMutableArray *mkRow = [@[@6,@6] mutableCopy];
        [_topEnd addObject:mkRow];
    }
    [self showPassCnt:you.passCnt];
}

-(void) showPassCnt:(int)cnt{
    NSString *passCnt = [NSString stringWithFormat:@"%d",cnt];
    self.passLabel.text =  [passCnt stringByAppendingString:@"回パスできます。"];
}

-(bool) putHand:(Player *)nowpl index:(NSInteger) handIndex{
    bool ret  =true;
    int index  = (int)(handIndex);
    
    int cardNumber = [nowpl.hands[index] intValue];
    
    int num = cardNumber%13;
    int mk;
    
    if (cardNumber<=12) {
        mk = 0;                         //クローバー
    }else if (cardNumber<=25){
        mk=1;                           //ダイヤ
    }else if (cardNumber<=38){
        mk=2;                           //ハート
    }else{
        mk=3;                           //スペード
    }
    
    NSMutableArray *nowMk = _topEnd[mk];
    
    int top = [nowMk[0] intValue];
    int end = [nowMk[1] intValue];
    
    if (num==top-1) {
        nowMk[0] = [NSNumber numberWithInt:top-1];
    }else if (num==end+1){
        nowMk[1] = [NSNumber numberWithInt:end+1];
    }else{
        ret = false;
    }
    
    if (ret) {
        for (int i=index+1; i<nowpl.handsNum; i++) {
            nowpl.hands[i-1] =[NSNumber numberWithInt:[nowpl.hands[i] intValue]];
        }
        [_putCards[cardNumber] setImage:[UIImage imageNamed:_trumpCards[cardNumber]]];
        nowpl.handsNum--;
    }
    
    NSLog(@"%@の手札は%d枚",nowpl.name,nowpl.handsNum);
    return ret;
}

-(void)putComHands{
    for (int i=1; i<4; i++) {
        Player *compl = players[i];
        compl.isPass = true;
        for (int j=0; j<_cardnum; j++) {
            int rnd = arc4random()%_cardnum;
            if ([self putHand:compl index:rnd]) {
                compl.isPass = false;
                break;
            }
        }
        if ([self isWin:compl]) {
            return;
        }
    }
}

-(bool)isWin:(Player *)pl{
    bool isWin = false;
    //文字列結合
    NSString *winner = [pl.name stringByAppendingString:@"が勝ちました"];
    if (pl.handsNum<=0) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"ゲーム終了！" message:winner delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil
        ];
        [alert show];
        isWin = true;
    }
    return isWin;
}

- (IBAction)selectHands:(id)sender {
    puts("-----------------------------------");
    Player *pl = players[0];
    pl.isPass = false;
    int tag = (int)[sender tag];
    if (![self putHand:pl index:tag]) {
        return;                             //出せないカードをクリックした時の処理
    }
    
    [self printHand:pl.hands size:pl.handsNum];
    
    if ([self isWin:pl]) {
        return;
    }
    
    [self putComHands];
    
    [self showComsHandsNum];
}

-(void) showComsHandsNum{
    self.com1Label.text = [NSString stringWithFormat:@"Com1の手札:%d",com.handsNum];
    self.com2Label.text = [NSString stringWithFormat:@"Com2の手札:%d",com2.handsNum];
    self.com3Label.text = [NSString stringWithFormat:@"Com3の手札:%d",com3.handsNum];
}

- (IBAction)passBtn:(id)sender {
    Player *obj = players[0];
    obj.isPass = true;
    obj.passCnt--;
    if (obj.passCnt<=0) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"ゲームオーバー" message:@"4回パスしました。失格です。" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil
                              ];
        [alert show];
    }else{
        [self showPassCnt:obj.passCnt];
        [self putComHands];
        [self showComsHandsNum];
    }
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self performSegueWithIdentifier:@"gameoverSeuge" sender:nil];
 }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    gameoverViewController *nextVC = segue.destinationViewController;
    nextVC.player1Remaincards = you.handsNum;
    nextVC.player2Remaincards = com.handsNum;
    nextVC.player3Remaincards = com2.handsNum;
    nextVC.player4Remaincards = com3.handsNum;
    
}

@end
