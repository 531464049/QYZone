//
//  QYZMoreViewController.m
//  QYZone
//
//  Created by MWY on 16/4/18.
//  Copyright © 2016年 Zhoufu@Xiaoke. All rights reserved.
//

#import "QYZMoreViewController.h"

@interface QYZMoreViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;//退出系统按钮
@property (weak, nonatomic) IBOutlet UILabel *remandLab;//提示数字label

@end

@implementation QYZMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1];
    //设置退出按钮圆角
    self.logoutButton.layer.cornerRadius = 8.0f;
    self.logoutButton.clipsToBounds = YES;
    
    //设置提示数字圆角
    self.remandLab.layer.cornerRadius = 10.0f;
    self.remandLab.clipsToBounds = YES;
    [self addObserver:self forKeyPath:@"remindNum" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    if (self.remindNum) {
        self.remandLab.hidden = NO;
        self.remandLab.text = self.remindNum;
    }else{
        self.remandLab.hidden = YES;
    }
    
    /**测试所用**/
//self.remindNum = @"99+";
    /**测试所用**/
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"remindNum"] && change[@"new"]) {
        self.remandLab.hidden = NO;
        self.remandLab.text= change[@"new"];
    }
}
#pragma mark - 点击退出按钮
- (IBAction)logoutButtonClick:(UIButton *)sender {
    NSLog(@"*****  安全退出  *****");
}
#pragma mark - 点击我的信息按钮
- (IBAction)myMessageButtonClick:(UIButton *)sender {
}
#pragma mark - 点击了使用帮助按钮
- (IBAction)helpButtonClick:(UIButton *)sender {
}
#pragma mark - 点击了意见反馈按钮
- (IBAction)suggestButtonClick:(UIButton *)sender {
}
#pragma mark - 点击了检查更新按钮
- (IBAction)checkButtonClick:(UIButton *)sender {
}
-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"remindNum"];
}
@end
