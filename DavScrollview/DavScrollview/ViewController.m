//
//  ViewController.m
//  DavScrollview
//
//  Created by edz on 2018/5/9.
//  Copyright © 2018年 ManMeng. All rights reserved.
//

#import "ViewController.h"
#import "DavScrollview-Swift.h"
#import "LTSimpleManagerDemo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)cvjcj:(UIButton *)sender {
    
    LTSimpleManagerDemo *simpleVc = [[LTSimpleManagerDemo alloc] init];
   
    [self.navigationController pushViewController:simpleVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
