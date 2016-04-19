//
//  QYZHiDengerViewController.h
//  QYZone
//
//  Created by MWY on 16/4/18.
//  Copyright © 2016年 Zhoufu@Xiaoke. All rights reserved.
//

#import "QYZBaseViewController.h"

@interface QYZHiDengerViewController : QYZBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *dataSourceArr;
@end
