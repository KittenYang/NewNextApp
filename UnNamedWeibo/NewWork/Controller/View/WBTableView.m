//
//  WBTableView.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 5/27/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//


static NSString *kidentifier=@"WBTableViewCell";

#import "WBTableView.h"
#import "WBTableViewCell.h"


@interface WBTableView()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation WBTableView{
    
    

}


-(id)init{
    self = [super init];
    if (self) {
        
        self.dataSource=self;
        self.delegate=self;
        self.separatorStyle=UITableViewCellSeparatorStyleNone;
        [self registerClass:[WBTableViewCell class] forCellReuseIdentifier:kidentifier];
        
    }
    return self;
}

////用户触摸时第一时间加载内容
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//
//    [self loadContent];
//
//    return [super hitTest:point withEvent:event];
//}
//
//- (void)loadContent{
//
//    if (self.indexPathsForVisibleRows.count<=0) {
//        return;
//    }
//    if (self.visibleCells&&self.visibleCells.count>0) {
//        for (id temp in [self.visibleCells copy]) {
//            WBTableViewCell *cell = (WBTableViewCell *)temp;
//            NSInteger i = [self indexPathForCell:cell].row;
//            cell.homeCellViewModel=self.weiboArray[i];
//        }
//    }
//}


#pragma UITableView - dataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weiboArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kidentifier];
    [cell clear];
    
    WBHomeCellViewModel *homeCellViewModel=[self.weiboArray objectAtIndex:indexPath.row];
    cell.homeCellViewModel=homeCellViewModel;
    
    return cell;
}



#pragma  UITableView －delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WBHomeCellViewModel *homeCellViewModel=[self.weiboArray objectAtIndex:indexPath.row];
    return [WBTableViewCell getHeight:homeCellViewModel];
}


@end
