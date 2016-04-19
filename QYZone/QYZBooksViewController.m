//
//  QYZBooksViewController.m
//  QYZone
//
//  Created by MWY on 16/4/18.
//  Copyright © 2016年 Zhoufu@Xiaoke. All rights reserved.
//

#import "QYZBooksViewController.h"

@interface QYZBooksViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstCheckLab;
@property (weak, nonatomic) IBOutlet UILabel *recheckLab;

@end

@implementation QYZBooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1];
    
    
    //设置初审提示数字圆角
    self.firstCheckLab.layer.cornerRadius = 10.0f;
    self.firstCheckLab.clipsToBounds = YES;
    [self addObserver:self forKeyPath:@"firstCheckNum" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    if (self.firstCheckNum) {
        self.firstCheckLab.hidden = NO;
        self.firstCheckLab.text = self.firstCheckNum;
    }else{
        self.firstCheckLab.hidden = YES;
    }
    //设置初审提示数字圆角
    self.recheckLab.layer.cornerRadius = 10.0f;
    self.recheckLab.clipsToBounds = YES;
    [self addObserver:self forKeyPath:@"recheckNum" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    if (self.recheckNum) {
        self.recheckLab.hidden = NO;
        self.recheckLab.text = self.recheckNum;
    }else{
        self.recheckLab.hidden = YES;
    }
    
    /**测试所用**/
    self.firstCheckNum = @"12";
    self.recheckNum = @"53";
    /**测试所用**/
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"firstCheckNum"] && change[@"new"]) {
        _firstCheckLab.hidden = NO;
        _firstCheckLab.text = change[@"new"];
    }else if ([keyPath isEqualToString:@"recheckNum"] && change[@"new"])
    {
        _recheckLab.text = change[@"new"];
        _recheckLab.hidden = NO;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)firstCheckButtonClick:(UIButton *)sender {
    NSLog(@"*****  初审  *****");
}
- (IBAction)recheckButtonClick:(UIButton *)sender {
    NSLog(@"*****  复审  *****");
}

@end
