//
//  DetailViewController.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 3/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "DetailViewController.h"
#import "UIView+Extra.h"
#import "CONST.h"


@interface DetailViewController ()

@end

@implementation DetailViewController


-(void)viewWillAppear:(BOOL)animated{
    self.detailWeiboView = [[[NSBundle mainBundle]loadNibNamed:@"DetailWeiboView" owner:self options:nil]firstObject];
    [self.detailWeiboView setUpDetailWeibo:self.model];
//    self.detailWeiboView.frame = CGRectMake(0, 0,SCREENWIDTH , 0);
//    self.detailWeiboView.height = 200;
    
    self.tableView.tableHeaderView = self.detailWeiboView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedScrollBarIndicator = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma  mark -- UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    return commentCell;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



@end
