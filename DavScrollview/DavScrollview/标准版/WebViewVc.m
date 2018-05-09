//
//  WebViewVc.m
//  DavScrollview
//
//  Created by edz on 2018/5/9.
//  Copyright © 2018年 ManMeng. All rights reserved.
//

#import "WebViewVc.h"

@interface WebViewVc ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    // Do any additional setup after loading the view from its nib.
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
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
