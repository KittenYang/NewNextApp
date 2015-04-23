//
//  BaseTableViewController.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "KYCell.h"

@interface BaseTableViewController ()

@property (strong, nonatomic) NSMutableSet *showIndexes;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 250;
    
    UIImage* logo = [UIImage imageNamed:@"Woohu"];
    CGRect frameimg = CGRectMake(0, 0, 70, 30);
    UIButton *logoButton = [[UIButton alloc] initWithFrame:frameimg];
    [logoButton setImage:logo forState:UIControlStateNormal];
    logoButton.imageEdgeInsets = UIEdgeInsetsMake(0, -6, 4, 0);
    logoButton.adjustsImageWhenHighlighted = NO;
    
    UIBarButtonItem *logoItem =[[UIBarButtonItem alloc] initWithCustomView:logoButton];
    self.navigationItem.leftBarButtonItem=logoItem;
    
    UIView *statusView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    statusView.backgroundColor = [UIColor redColor];
    [self.navigationController.view addSubview:statusView];
    
    _showIndexes = [NSMutableSet set];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - Table view data source

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 200;
//}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //动画1：
    if (![self.showIndexes containsObject:indexPath]) {
        [self.showIndexes addObject:indexPath];
        CGFloat rotationAngleDegrees = -30;
        CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/ 180);
        CGPoint offsetPositioning = CGPointMake(-20, -20);
        
        
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotationAngleRadians, 0.0,  0.0, 1.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y , 0.0);
        cell.layer.transform = transform;
        cell.alpha = 0.7;
                
        KYCell *kycell = (KYCell *)cell;
        kycell.avator.layer.opacity = 0;
        kycell.avator.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
        kycell.avator.layer.transform = CATransform3DRotate(kycell.avator.layer.transform, -180 * (M_PI / 180), 0, 0, 1);

        [UIView animateWithDuration:1 delay:0.0 usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            kycell.avator.layer.opacity = 1;
            kycell.avator.layer.transform = CATransform3DIdentity;
            cell.layer.transform = CATransform3DIdentity;
            cell.layer.opacity = 1;
        } completion:nil];
    }
}


#pragma mark - TableViewDelegate





@end
