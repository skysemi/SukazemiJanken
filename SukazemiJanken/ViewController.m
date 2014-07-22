//
//  ViewController.m
//  SukazemiJanken
//
//  Created by なごみ on 2014/07/21.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

const int JANKEN_MAX = 3;
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *enemyImage;
@property (strong, nonatomic) IBOutlet UILabel *jankenStatus;
@property (strong, nonatomic) IBOutlet UILabel *enemyJakenHand;
@property (strong, nonatomic) NSArray *guResultArray;
@property (strong, nonatomic) NSArray *tyokiResultArray;
@property (strong, nonatomic) NSArray *paResultArray;
typedef enum {
    GU = 0,
    TYOKI = 1,
    PA = 2,
} JANKEN;
@end

@implementation ViewController
- (IBAction)guButton:(UIButton *)sender {
	[self janken:GU];
}
- (IBAction)tyokiButton:(UIButton *)sender {
	[self janken:TYOKI];
}
- (IBAction)paButton:(UIButton *)sender {
	[self janken:PA];
}
- (void) janken : (int)myJanken{
	int enemyResult = [self getEnemyJanken];
	
	switch(enemyResult){
		case GU:
			self.enemyJakenHand.text = @"ぐー";
			self.jankenStatus.text = self.guResultArray[myJanken];
			self.enemyImage.image = [UIImage imageNamed:@"janken_gu.png"];
			
			break;
		case TYOKI:
			self.enemyJakenHand.text = @"ちょき";
			self.jankenStatus.text = self.tyokiResultArray[myJanken];
			self.enemyImage.image = [UIImage imageNamed:@"janken_choki.png"];
			break;
		case PA:
			self.enemyJakenHand.text = @"ぱー";
			self.jankenStatus.text = self.paResultArray[myJanken];
			self.enemyImage.image = [UIImage imageNamed:@"janken_pa.png"];
			break;
	}
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.guResultArray = @[@"あいこです",@"まけです",@"かちです"];
	self.tyokiResultArray = @[@"かちです",@"あいこです",@"まけです"];
	self.paResultArray = @[@"まけです",@"かちです",@"あいこです"];
}
- (int) getEnemyJanken{
	int result = arc4random() % JANKEN_MAX;
	return result;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
