//
//  LTSimpleManagerDemo.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/18.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "LTSimpleManagerDemo.h"
#import "LTSimpleTestOneVC.h"
#import "DavScrollview-Swift.h"
#import "TfViewController.h"
#import "WebViewVc.h"
#import "LTSimpleManagerDemom.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)

@interface LTSimpleManagerDemo () <LTSimpleScrollViewDelegate>

@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;
@property(copy, nonatomic) NSArray <NSString *> *titles;
@property(strong, nonatomic) LTLayout *layout;
@property(strong, nonatomic) LTSimpleManager *managerView;
@property(nonatomic,assign)BOOL isFirst;
@end

@implementation LTSimpleManagerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupSubViews];
}


-(void)setupSubViews {
    
    [self.view addSubview:self.managerView];

    __weak typeof(self) weakSelf = self;
    
    //配置headerView
    [self.managerView configHeaderView:^UIView * _Nullable{
        return [weakSelf setupHeaderView];
    }];
    
    //pageView点击事件
    [self.managerView didSelectIndexHandle:^(NSInteger index) {
        NSLog(@"点击了 -> %ld", index);
    }];
    
    //控制器刷新事件
    [self.managerView refreshTableViewHandle:^(UIScrollView * _Nonnull scrollView, NSInteger index) {
       
    }];
    
}

-(UILabel *)setupHeaderView {
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 185)];
    headerView.backgroundColor = [UIColor grayColor];
    headerView.text = @"点击响应事件";
    headerView.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [headerView addGestureRecognizer:gesture];
    return headerView;
}

-(void)tapGesture:(UITapGestureRecognizer *)gesture {
    NSLog(@"tapGesture");
}

-(void)glt_scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"---> %lf", scrollView.contentOffset.y);
}

-(LTSimpleManager *)managerView {
    if (!_managerView) {
        CGFloat Y = kIPhoneX ? 64 + 24.0 : 64.0;
        CGFloat H = kIPhoneX ? (self.view.bounds.size.height - Y - 34) : self.view.bounds.size.height - Y;
        _managerView = [[LTSimpleManager alloc] initWithFrame:CGRectMake(0, Y, self.view.bounds.size.width, H) viewControllers:self.viewControllers titles:self.titles currentViewController:self layout:self.layout];
        _managerView.delegate = self;
    }
    return _managerView;
}


-(LTLayout *)layout {
    if (!_layout) {
        _layout = [[LTLayout alloc] init];
        _layout.titleViewBgColor = [UIColor whiteColor];
        _layout.pageBottomLineColor = [UIColor whiteColor];
        _layout.bottomLineColor = [UIColor greenColor];
        _layout.isNeedScale=NO;
        _layout.titleMargin=100;
    }
    return _layout;
}


- (NSArray <NSString *> *)titles {
    if (!_titles) {
        _titles = @[@"热门事件", @"精彩推荐", @"科技控见"];
    }
    return _titles;
}


-(NSArray <UIViewController *> *)viewControllers {                                                                                                                                             
    if (!_viewControllers) {
        _viewControllers = [self setupViewControllers];
    }
    return _viewControllers;
}


-(NSArray <UIViewController *> *)setupViewControllers {
    NSMutableArray <UIViewController *> *testVCS = [NSMutableArray arrayWithCapacity:0];
    [testVCS removeAllObjects];
    [self.titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if (idx==0) {
            WebViewVc*vc=[WebViewVc new];
            [testVCS addObject:vc];
        }
       else if (idx==1) {
            LTSimpleTestOneVC*vc=[LTSimpleTestOneVC new];
            [testVCS addObject:vc];
        }else{
            LTSimpleManagerDemom*vc=[LTSimpleManagerDemom new];
                    [testVCS addObject:vc];
           
        }
    }];
    return testVCS.copy;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
