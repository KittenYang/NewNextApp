//
//  WBHomeViewController.m
//  Weibo
//
//  Created by SKY on 15/5/25.
//  Copyright (c) 2015年 Sky. All rights reserved.
//

#import "WBHomeViewController.h"
#import "WBTableViewCell.h"
#import "WBTableView.h"


static NSString *kidentifier=@"WBTableViewCell";


@interface WBHomeViewController ()

@property(strong,nonatomic)WBTableView *tableView;
@property(assign,nonatomic)NSInteger page;
@property(strong,nonatomic)NSMutableArray *weiboArray;
@end

@implementation WBHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title=@"微博首页";
    self.page=1;
    self.weiboArray=[[NSMutableArray alloc]init];
    
    self.tableView=[[WBTableView alloc]init];
    self.tableView.backgroundColor=RGBCOLOR(242,242,242);
    [self.view addSubview:self.tableView];
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:ALEdgeInsetsZero];
    
    
    //上拉下拉刷新
    WeakSelf(weakSelf,self);
    [self.tableView addLegendHeaderWithRefreshingBlock:^
    {
        weakSelf.page=1;
        weakSelf.tableView.footer.hidden=YES;
        [weakSelf loadData:YES];
    }];
    
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [weakSelf loadData:NO];
    }];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    WBSession *session=[[WBSession alloc]init];
    if ([session hasUser])
    {
        [self.tableView.header beginRefreshing];
    }
    else
    {
        WBLoginViewController *loginViewController=[[WBLoginViewController alloc]init];
        [self presentViewController:loginViewController animated:YES completion:^{
            
        }];
    }
}


#pragma 加载数据
-(void)loadData:(BOOL)isHeader
{
    [[WBManage shardWBManage] requestWeiBo:self.page requestResult:^(BOOL result, NSMutableArray *array)
     {
         if (result)
         {
             if (isHeader)
             {
                 self.weiboArray=array;
             }
             else
             {
                [self.weiboArray addObjectsFromArray:array];
             }
             self.page++;
             
             if (array.count>=100)
             {
                 self.tableView.footer.hidden=NO;
             }
             else
             {
                 self.tableView.footer.hidden=YES;
             }
         }
         else
         {
             [SVProgressHUD showErrorWithStatus:@"失败"];
         }
         
         if (isHeader)
         {
             [self.tableView.header endRefreshing];
         }
         else
         {
             [self.tableView.footer endRefreshing];
         }
         self.tableView.weiboArray = self.weiboArray;
         [self.tableView reloadData];
     }];
}



-(void)dealloc
{
    debugLog(@"释放");
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
