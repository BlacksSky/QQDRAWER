//
//  QQMainTabBarController.m
//  QQDRAWER_OC
//
//  Created by zzy on 2016/10/27.
//  Copyright © 2016年 BlackSky. All rights reserved.
//

#import "QQMainTabBarController.h"
#import "QQDrawerViewController.h"
#import "QQMessageViewController.h"
#import "QQFriendViewController.h"
#import "QQDynamicsViewController.h"

@interface QQMainTabBarController ()

@property (nonatomic, strong)UIBarButtonItem *openDrawerIcon;

@end

@implementation QQMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    
    return self;
}

- (void)setUpUI{
    QQMessageViewController *messageViewController = [[QQMessageViewController alloc]init];
    [self addChildViewController:messageViewController andTabTitle:@"消息" andDefaultImageName:@"tab_recent_nor" andSelectedImageName:@"tab_recent_press"];
    QQFriendViewController *friendViewController = [[QQFriendViewController alloc]init];
    [self addChildViewController:friendViewController andTabTitle:@"联系人" andDefaultImageName:@"tab_buddy_nor" andSelectedImageName:@"tab_buddy_press"];
    QQDynamicsViewController *dynamicsViewController = [[QQDynamicsViewController alloc]init];
    [self addChildViewController:dynamicsViewController andTabTitle:@"动态" andDefaultImageName:@"tab_qworld_nor" andSelectedImageName:@"tab_qworld_press"];
}


/**
 根据传入的标题和图片创建子控制器

 @param childController   要添加的子控制器
 @param title             标题
 @param defaultImageName  tabBarItem的默认图片
 @param selectedImageName tabBarItem的选中图片
 */
-(void)addChildViewController:(UIViewController *)childController andTabTitle:(NSString *)title andDefaultImageName:(NSString *)defaultImageName andSelectedImageName:(NSString *)selectedImageName{
    
    UINavigationController *NAVNC = [[UINavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:NAVNC];
    
    if ([title isEqualToString:@"消息"]) {
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"消息",@"电话",nil]];
        segmentedControl.tintColor = [UIColor purpleColor];
        segmentedControl.backgroundColor = [UIColor whiteColor];
        segmentedControl.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.5 - 80, 20, 160, 30);
        childController.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@""];
        segmentedControl.selected = YES;
        segmentedControl.selectedSegmentIndex = 0;
        childController.navigationItem.titleView = segmentedControl;
        
        childController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"run10"] style:UIBarButtonItemStylePlain target:self action:@selector(openDrawer)];
    }
    childController.navigationItem.title = title;
    childController.tabBarItem.title = title;
    [childController.tabBarItem setImage:[UIImage imageNamed:defaultImageName]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImageName]];
}


/**
 打开抽屉
 */
- (void)openDrawer{
    [[QQDrawerViewController shareDrawerViewController] openDrawerWithOpenDuration:0.2];
}


/**
 关闭抽屉
 */
- (void)closeDrawer{
    [[QQDrawerViewController shareDrawerViewController] closeDrawerWithOpenDuration:0.2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



