//
//  LTSimpleTestOneVC.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/18.
//  Copyright © 2018年 LT. All rights reserved.
//

//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "LTSimpleTestOneVC.h"
#import "DavScrollview-Swift.h"

#define kIPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)

@interface LTSimpleTestOneVC () <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;

@end

@implementation LTSimpleTestOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    self.countNum=self.countNum?20:30;
#warning 重要 必须赋值
    self.glt_scrollView = self.tableView;
    
    __weak typeof(self) weakSelf = self;
   
    
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countNum;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行", indexPath.row + 1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"第 %ld 行", indexPath.row + 1);
}

- (UITableView *)tableView {
    if (!_tableView) {
        CGFloat H = kIPhoneX ? (self.view.bounds.size.height - 44 - 64 - 24 - 34) : self.view.bounds.size.height - 44 - 64;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, H=self.isSecond?H-56:H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
