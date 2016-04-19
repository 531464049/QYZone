//
//  QYZLoginViewController.m
//  QYZone
//
//  Created by MWY on 16/4/18.
//  Copyright © 2016年 Zhoufu@Xiaoke. All rights reserved.
//

#import "QYZLoginViewController.h"

#import "QYZMainViewController.h"
#import "QYZMoreViewController.h"
#import "QYZHiDengerViewController.h"
#import "QYZBooksViewController.h"

@interface QYZLoginViewController ()

@end

@implementation QYZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}
#pragma mark - 点击登录按钮
- (IBAction)loginButtonClick:(UIButton *)sender
{
    UITabBarController *tabbarControl = [[UITabBarController alloc]init];
    tabbarControl.delegate = self;
    
     UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:tabbarControl];
    tabbarControl.navigationItem.title = @"xxx公司";//设置下一个页面的标题
    
    //设置bar的背景颜色
    UIColor *bgcolor = [UIColor colorWithRed:54.0f/255.0f green:180.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    [tabbarControl.navigationController.navigationBar setBarTintColor:bgcolor];
    
    //设置bar上的字体颜色
    [tabbarControl.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    
    
    QYZMainViewController *mainVc = [self.storyboard instantiateViewControllerWithIdentifier:@"QYZMainViewController"];
    mainVc.tabBarItem.title = @"首页";//tabbar 上的标题
    mainVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbarMainSelect"];  //选中图标
    mainVc.tabBarItem.image = [UIImage imageNamed:@"tabbarMainDef"];//默认图标
    [tabbarControl addChildViewController:mainVc];
    
    
    QYZHiDengerViewController *hidenger = [self.storyboard instantiateViewControllerWithIdentifier:@"QYZHiDengerViewController"];
    hidenger.tabBarItem.title = @"隐患";
    hidenger.tabBarItem.image = [UIImage imageNamed:@"hidenDengerDef"];
    hidenger.tabBarItem.selectedImage = [UIImage imageNamed:@"hidenDengerSelect"];
    [tabbarControl addChildViewController:hidenger];
    
    
    QYZBooksViewController *bookVc = [self.storyboard instantiateViewControllerWithIdentifier:@"QYZBooksViewController"];
    bookVc.tabBarItem.image = [UIImage imageNamed:@"tabbarBookDef"];
    bookVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbarBookSelect"];
    bookVc.tabBarItem.title = @"文书";
    [tabbarControl addChildViewController:bookVc];
    
    
    QYZMoreViewController *moreVc = [self.storyboard instantiateViewControllerWithIdentifier:@"QYZMoreViewController"];
    moreVc.tabBarItem.image = [UIImage imageNamed:@"tabbarMoreDef"];
    moreVc.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbarMoreSelect"];
    moreVc.tabBarItem.title = @"更多";
    [tabbarControl addChildViewController:moreVc];
    
    
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[QYZMainViewController class]])
    {
        tabBarController.navigationItem.title = @"xxx公司";
    }
    else if ([viewController isKindOfClass:[QYZHiDengerViewController class]])
    {
        tabBarController.navigationItem.title = @"隐患";
    }
    else if ([viewController isKindOfClass:[QYZBooksViewController class]])
    {
        tabBarController.navigationItem.title = @"巡查文书";
    }
    else
    {
       tabBarController.navigationItem.title = @"更多";
    }
}
@end
