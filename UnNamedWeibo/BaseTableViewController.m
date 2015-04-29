//
//  BaseTableViewController.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//



#define jellyHeaderHeight 300


#import "BaseTableViewController.h"
#import "KYCell.h"
#import "Utils.h"
#import "JellyView.h"
#import "MainTabViewController.h"


@interface BaseTableViewController ()<ACTimeScrollerDelegate>


@property (nonatomic,strong ) CADisplayLink *displayLinkToPull;
@property (nonatomic,strong ) JellyView     *jellyView;

@end


@implementation BaseTableViewController

-(void)viewWillAppear:(BOOL)animated{
    //时间滚动条
    if (self.isNeedScrollBarIndicator == YES  && _timeScroller == nil) {
        _timeScroller = [[ACTimeScroller alloc] initWithDelegate:self];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollsToTop = YES;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 250;

    
    //去除黑线
//    self.navigationController.navigationBar.clipsToBounds = YES;
    
    
//    UIImage* logo = [UIImage imageNamed:@"Woohu"];
//    CGRect frameimg = CGRectMake(0, 0, 70, 30);
//    UIButton *logoButton = [[UIButton alloc] initWithFrame:frameimg];
//    [logoButton setImage:logo forState:UIControlStateNormal];
//    logoButton.imageEdgeInsets = UIEdgeInsetsMake(0, -6, 4, 0);
//    logoButton.adjustsImageWhenHighlighted = NO;
//    
//    UIBarButtonItem *logoItem =[[UIBarButtonItem alloc] initWithCustomView:logoButton];
//    self.navigationItem.leftBarButtonItem=logoItem;

    
    //状态条底色
//    UIView *statusView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 568, 20)];
//    [self.navigationController.view addSubview:statusView];
//    statusView.backgroundColor = [UIColor redColor];

    //保存indexpath的数组
    _showIndexes = [NSMutableArray array];
    _afterRemovedshowIndexes = [NSMutableArray array];
    

    //是否是第一次加载
    self.isFirstTime = YES;
    //初始化的时候让self.showIndexes默认包含所有微博，也就是说重新打开微博的情况下默认所有微博都是看过的
    for (NSInteger i = 99; i >= 0; i--) {
        NSNumber *intnumber = [NSNumber numberWithInteger:i];
        [self.showIndexes addObject:intnumber];
    }

    
    //下拉刷新
    
}


- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - TimeScollDelegate
- (UITableView *)tableViewForTimeScroller:(ACTimeScroller *)timeScroller
{
    return self.tableView;
}

- (NSDate *)timeScroller:(ACTimeScroller *)timeScroller dateForCell:(UITableViewCell *)cell
{
    KYCell *kycell = (KYCell *)cell;
    NSString *createDate = kycell.weiboModel.createDate;
    NSString *formate = @"EEE MMM d HH:mm:ss Z yyyy";
    NSDate *scrollBarDate = [Utils dateFromFomate:createDate formate:formate];

    return scrollBarDate;
}



#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(KYCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

//    [cell.cellView.weiboView.reWeiboView.reWeiboImageCollectionView reloadData];
//    [cell.cellView.weiboView.weiboImageCollectionView reloadData];
    
//    NSNumber *row = [NSNumber numberWithInteger:indexPath.row];

    
    //cell进入动画：
//    if (![self.showIndexes containsObject:row]) {
//        [self.showIndexes insertObject:row atIndex:[self.afterRemovedshowIndexes count]];
//        NSLog(@"加入：%@",self.showIndexes);
//        
//        CGPoint offsetPositioning = CGPointMake(0, 150);
//        CATransform3D transform = CATransform3DIdentity;
//        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y , 0.0);
//        KYCell *kycell_ = (KYCell *)cell;
//        cell.layer.transform = transform;
//        
//        kycell_.avator.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//        kycell_.avator.layer.transform = CATransform3DRotate(kycell_.avator.layer.transform, -180 * (M_PI / 180), 0, 0, 1);
//        
//        [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//
//            kycell_.avator.layer.transform = CATransform3DIdentity;
//            cell.layer.transform = CATransform3DIdentity;
//
//        } completion:nil];
//    }

}

#pragma mark - UIScrollViewDelegate
#pragma mark - Show/Hide the Label Using UIScrollViewDelegate Callbacks

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timeScroller scrollViewWillBeginDragging];
    MainTabViewController *mainTabVC =  (MainTabViewController *)self.tabBarController;
    mainTabVC.isTop = NO;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    [_timeScroller scrollViewDidScroll];
    if (scrollView.contentOffset.y > -64.5) {
        if (self.jellyView.isLoading == NO) {
            [self.jellyView removeFromSuperview];
            self.jellyView = nil;
            [self.displayLinkToPull invalidate];
            self.displayLinkToPull = nil;
        }
        return;
    }
    
    if (!self.jellyView.isFirstTime && self.displayLinkToPull == nil && (-scrollView.contentOffset.y - 64.5) > 0) {
//        self.jellyView.isFirstTime = YES;
        self.jellyView = [[JellyView alloc]initWithFrame:CGRectMake(0, -jellyHeaderHeight - 30 , [UIScreen mainScreen].bounds.size.width, jellyHeaderHeight)];
        self.jellyView.backgroundColor = [UIColor clearColor];
        [self.view insertSubview:self.jellyView aboveSubview:self.tableView];
        
        
        self.displayLinkToPull = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkActionToDrawPullToRefresh:)];
        [self.displayLinkToPull addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }else if ((-scrollView.contentOffset.y - 64.5) < 0){
        [self.jellyView removeFromSuperview];
        self.jellyView = nil;
        [self.displayLinkToPull invalidate];
        self.displayLinkToPull = nil;
    }
    
    CGFloat offset = -scrollView.contentOffset.y - 64.5;
    if (offset >= 100) {
        self.jellyView.ballView.image = [UIImage imageNamed:@"sun_smile"];
    }else{
        self.jellyView.ballView.image = [UIImage imageNamed:@"sun"];
    }
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (self.jellyView.isLoading) {
        return;
    }
    CGFloat offset = -scrollView.contentOffset.y - 64.5;
    if (offset >= 100) {
        
        self.jellyView.isLoading = YES;
        
        [UIView animateWithDuration:0.3 delay:0.0f usingSpringWithDamping:0.4f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            self.jellyView.controlPoint.center = CGPointMake(self.jellyView.userFrame.size.width / 2, jellyHeaderHeight);
            
            self.tableView.contentInset = UIEdgeInsetsMake(150+64.5, 0, 0, 0);
        } completion:nil];
        
        if ([self.loademoredelegate respondsToSelector:@selector(pullDown)]) {
            [self.loademoredelegate pullDown];
        }
    }
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [_timeScroller scrollViewDidEndDecelerating];
    
    if (self.jellyView.isLoading == NO) {
        [self.jellyView removeFromSuperview];
        self.jellyView = nil;
        [self.displayLinkToPull invalidate];
        self.displayLinkToPull = nil;
    }
}



//跳到顶部复原的方法
-(void)backToTop{
    [self.jellyView.layer removeAnimationForKey:@"rotationAnimation"];
    [UIView animateWithDuration:0.3 animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(64.5, 0, 0, 0);
    } completion:^(BOOL finished) {
        [self.displayLinkToPull invalidate];
        self.displayLinkToPull = nil;
//        [self.jellyView removeAnimator];
        self.jellyView.isLoading = NO;
        [self.jellyView removeFromSuperview];
        self.jellyView = nil;

    }];
}

//持续刷新屏幕的计时器
-(void)displayLinkActionToDrawPullToRefresh:(CADisplayLink *)dis{
    
//    CALayer *layer = (CALayer *)[self.jellyView.controlPoint.layer presentationLayer];
    
    if (dis != nil) {
        self.jellyView.controlPointOffset = (self.jellyView.isLoading == NO)? (-self.tableView.contentOffset.y - 64.5) : (self.jellyView.controlPoint.layer.position.y - self.jellyView.userFrame.size.height);
        
        [self.jellyView drawRectInJellyView];
    }
}


@end
