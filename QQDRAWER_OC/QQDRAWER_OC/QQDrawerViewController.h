//
//  QQDrawerViewController.h
//  QQDRAWER_OC
//
//  Created by zzy on 2016/10/27.
//  Copyright © 2016年 BlackSky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QQDrawerViewController : UIViewController
+ (instancetype)drawerWithLeftViewController:(UIViewController *)leftViewController andMainViewController:(UIViewController *)mainViewController andMaxWidth:(CGFloat)maxWidth;

+ (instancetype)shareDrawerViewController;

/**
 打开抽屉效果
 */
- (void)openDrawerWithOpenDuration:(CGFloat)openDuration;

/**
 关闭抽屉效果
 */
- (void)closeDrawerWithOpenDuration:(CGFloat)openDuration;

/**
 选择左侧控制器后进行跳转
 */
- (void)switchViewController:(UIViewController *)viewController;

/**
 跳回主控制器
 */
- (void)swithToMainViewController;

@end
