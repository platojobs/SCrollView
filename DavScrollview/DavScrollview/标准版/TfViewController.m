//
//  TfViewController.m
//  OCExample
//
//  Created by edz on 2018/5/9.
//  Copyright © 2018年 LT. All rights reserved.
//

#import "TfViewController.h"
#import "LTSimpleTestOneVC.h"
@interface TfViewController ()

@end

@implementation TfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(UIButton *)sender {
    NSLog(@"jhjhhk");
  [self.navigationController pushViewController:[LTSimpleTestOneVC new] animated:YES];
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
