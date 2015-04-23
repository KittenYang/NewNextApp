//
//  HomeTableViewController.m
//  UnNamedWeibo
//
//  Created by Kitten Yang on 2/13/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "HomeTableViewController.h"
#import "KYCell.h"
#import "Utils.h"
#import "SKSplashIcon.h"



@interface HomeTableViewController ()

@property (strong, nonatomic) SKSplashView *splashView;

@end

@implementation HomeTableViewController{
    NSArray *array;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(prepareToLoadWeibo) name:kWeiboAuthSuccessNotification object:nil];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kWeiboAuthSuccessNotification object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self twitterSplash];

    
    //登录按钮
    UIButton *authBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    authBtn.frame = CGRectMake(260, 20, 50, 30);
    [authBtn setTitle:@"登录" forState:UIControlStateNormal];
    [authBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [authBtn addTarget:self action:@selector(authWeibo) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *authItem =[[UIBarButtonItem alloc]initWithCustomView:authBtn];
    self.navigationItem.rightBarButtonItem=authItem;

    [self loadWeibo];
 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- 启动动画
- (void) twitterSplash
{

    //Twitter style splash
    SKSplashIcon *twitterSplashIcon = [[SKSplashIcon alloc] initWithImage:[UIImage imageNamed:@"twitter.png"] animationType:SKIconAnimationTypeBounce];
    UIColor *twitterColor = [UIColor colorWithRed:0.25098 green:0.6 blue:1.0 alpha:1.0];
    _splashView = [[SKSplashView alloc] initWithSplashIcon:twitterSplashIcon backgroundColor:twitterColor animationType:SKSplashAnimationTypeBounce];
    _splashView.delegate = self; //Optional -> if you want to receive updates on animation beginning/end
    _splashView.animationDuration = 2; //Optional -> set animation duration. Default: 1s
    [self.tabBarController.view addSubview:_splashView];
    [_splashView startAnimation];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.weibos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    KYCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeiboCell" forIndexPath:indexPath];
    
    WeiboModel *model = [self.data objectAtIndex:indexPath.row];
    cell.weiboModel = model;
    [self updateCellContentView:cell withWeiboModel:model];
    
    return cell;
}


//填充数据
-(void)updateCellContentView:(KYCell *)cell withWeiboModel:(WeiboModel *)model{

    //----------微博内容--------------
    cell.cellView.weiboView.weiboText.text = model.text;
        
}

#pragma  mark - 微博登录
-(void)authWeibo{

    WBAuthorizeRequest *authrequest = [WBAuthorizeRequest request];
    authrequest.redirectURI = kWeiboRedirectURI;
    authrequest.scope = @"all";
    authrequest.userInfo = @{@"SSO_From": @"HomeTableViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:authrequest];

}


-(void)prepareToLoadWeibo{
    
    if ( [Utils WEIBOTOKEN] == nil || [[Utils WEIBOTOKEN]  isEqualToString:@""]) {
    }else{
        NSDate *nowDate = [NSDate date];
        if([nowDate compare:[Utils WEIBOEXDATE]] == NSOrderedAscending){

            [self loadWeibo];
            
        }else{
        }
    }
}


-(void)loadWeibo{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"100" forKey:@"count"];
    
    [WBHttpRequest requestWithAccessToken:[Utils WEIBOTOKEN] url:WB_home  httpMethod:@"GET" params:params delegate:self withTag:@"load"];
}



#pragma mark  - WBHttpRequestDelegate

- (void)request:(WBHttpRequest *)request didFinishLoadingWithDataResult:(NSData *)data{
    if ([request.tag isEqual: @"load"]) {
        NSError *error;
        NSDictionary *WEIBOJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error]; // 100条JSON，一个statuses对应一个WeiboModel
        NSDictionary *WEIBOMODELS = [WEIBOJSON objectForKey:@"statuses"]; //100条微博
        NSMutableArray *WEIBOS = [NSMutableArray arrayWithCapacity:WEIBOMODELS.count];
        for (NSDictionary *_wbmodel in WEIBOMODELS) {
            WeiboModel *wbmodel = [[WeiboModel alloc]initWithWeiboDic:_wbmodel];
            [WEIBOS addObject:wbmodel];
        }
        
        self.data = WEIBOS;
        self.weibos = WEIBOS;
        [self.tableView reloadData];
//        [self.tableView layoutIfNeeded];
    }
}


#pragma mark -- 
- (void) splashView:(SKSplashView *)splashView didBeginAnimatingWithDuration:(float)duration
{
    NSLog(@"Started animating from delegate");
    //To start activity animation when splash animation starts
    

//    [UIView animateKeyframesWithDuration:duration delay:1 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//        _splashView.alpha = 0;
//    } completion:nil];
    
    
}


@end


















