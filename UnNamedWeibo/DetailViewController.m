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
    [self.showIndexes removeAllObjects];
    [self.detailWeiboView setUpDetailWeibo:self.model];
//    self.detailWeiboView.frame = CGRectMake(0, 0,SCREENWIDTH , 0);
//    self.detailWeiboView.height = 200;
    
    self.tableView.tableHeaderView = self.detailWeiboView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详细";
    super.timeScroller.hidden =  YES;
    self.isNeedScrollBarIndicator = NO;

//    UIButton *authBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    authBtn.frame = CGRectMake(260, 20, 50, 30);
//    [authBtn setTitle:@"登录" forState:UIControlStateNormal];
//    [authBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [authBtn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *authItem =[[UIBarButtonItem alloc]initWithCustomView:authBtn];
//    self.navigationItem.rightBarButtonItem = authItem;
    
}


-(void)pop{
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark -- UITableView Delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSNumber *row = [NSNumber numberWithInteger:indexPath.row];
    //cell进入动画：
    if (![self.showIndexes containsObject:row]) {
        [self.showIndexes addObject:row];
        
        CGPoint offsetPositioning = CGPointMake(0, 150);
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y , 0.0);
        cell.layer.transform = transform;
        
//        KYCell *kycell_ = (KYCell *)cell;
//        kycell_.avator.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//        kycell_.avator.layer.transform = CATransform3DRotate(kycell_.avator.layer.transform, -180 * (M_PI / 180), 0, 0, 1);
        
        [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
//            kycell_.avator.layer.transform = CATransform3DIdentity;
            cell.layer.transform = CATransform3DIdentity;
            
        } completion:nil];
    }

    
}


@end
