//
//  FLPopoverPresentationController.m
//  bezierCurveDemo
//
//  Created by 孔凡列 on 16/1/13.
//  Copyright © 2016年 czebd. All rights reserved.
//

#import "FLPopoverPresentationController.h"

@implementation FLPopoverPresentationController


- (void)presentationTransitionWillBegin{
    // 添加手势
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToClose)];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualView = [[UIVisualEffectView alloc] initWithEffect:blur];
    visualView.frame = self.containerView.bounds;
    visualView.alpha = 0.4;
    visualView.backgroundColor = [UIColor clearColor];
    [self.containerView addSubview: visualView];
    [self.containerView addGestureRecognizer:tapG];
}


/**
 *  布局
 */
- (void)containerViewWillLayoutSubviews{
    [super containerViewWillLayoutSubviews];
    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
    CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
    self.presentedView.frame = CGRectMake(0, windowH - 300, windowW, 300);
    self.presentedView.backgroundColor = [UIColor clearColor];
}

- (void)tapToClose{
    // 发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FLModalDismiss" object:nil];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
