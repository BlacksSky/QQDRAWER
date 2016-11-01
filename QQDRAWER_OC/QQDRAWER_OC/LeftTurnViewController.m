//
//  LeftTurnViewController.m
//  QQDRAWER_OC
//
//  Created by zzy on 2016/10/27.
//  Copyright © 2016年 BlackSky. All rights reserved.
//

#import "LeftTurnViewController.h"

@interface LeftTurnViewController ()<UIWebViewDelegate>
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UIView *lineView;
@end

@implementation LeftTurnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.lineView];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
}

#pragma mark - UIWebViewDelegate
/// 网页开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.view addSubview:self.label];
}

/// 网页完成加载
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.label removeFromSuperview];
    self.label = nil;
    // 获取h5的标题
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

/// 网页加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    self.label.text = @"加载失败。。。";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"正在加载。。。";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
        _label.center = self.view.center;
    }
    return _label;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 300, 1)];
        _lineView.backgroundColor = [UIColor purpleColor];
    }
    return _lineView;
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
