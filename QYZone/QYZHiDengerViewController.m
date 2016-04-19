//
//  QYZHiDengerViewController.m
//  QYZone
//
//  Created by MWY on 16/4/18.
//  Copyright © 2016年 Zhoufu@Xiaoke. All rights reserved.
//

#import "QYZHiDengerViewController.h"

@interface QYZHiDengerViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMent;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QYZHiDengerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1];
    
    self.dataSourceArr = [NSMutableArray array];
    for (int i = 0; i< 10; i++)
    {
        NSDictionary *item = @{@"key1":@"营业执照",@"key2":@"张三",@"key3":@"2013/09/21 08:23:11",@"key4":@"wzgImage"};
        [_dataSourceArr addObject:item];
    }
}
- (IBAction)segmentValueChanged:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        NSLog(@"*****  全部  *****");
    }else if (sender.selectedSegmentIndex == 1)
    {
        NSLog(@"*****  已整改  *****");
    }else if (sender.selectedSegmentIndex == 2)
    {
        NSLog(@"*****  未整改  *****");
    }else
    {
        NSLog(@"*****  整改中  *****");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"YHCELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }else
    {
        cell.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1];
    }
    NSDictionary *item = _dataSourceArr[indexPath.row];
    
    
    
    UILabel *lab1 = (UILabel *)[cell viewWithTag:99801];//营业执照对应Lab
    lab1.text = item[@"key1"];
    //巡查人对应Lab   eg: 巡查人:张三
    UILabel *lab2 = (UILabel *)[cell viewWithTag:99802];
    lab2.text = [NSString stringWithFormat:@"巡查人:%@",item[@"key2"]];
    //时间对应的Lab  eg: 2015/09/09 10:09:12
    UILabel *lab3 = (UILabel *)[cell viewWithTag:99803];
    lab3.text = item[@"key3"];
    
    //整改类型对应的图片  eg： 整改中
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:99804];
    imageView.image = [UIImage imageNamed:item[@"key4"]];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"***** 选中: %ld 行 *****",(long)indexPath.row);
}
@end
