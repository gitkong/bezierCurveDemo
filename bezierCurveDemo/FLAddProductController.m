//
//  FLAddProductController.m
//  bezierCurveDemo
//
//  Created by 孔凡列 on 16/1/12.
//  Copyright © 2016年 czebd. All rights reserved.
//

#import "FLAddProductController.h"

@interface FLAddProductController ()

@end

@implementation FLAddProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    // 贝塞尔view
    self.cuteView = [[FLBezierCurveView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 55)];
    [self.view addSubview:_cuteView];
    
    // 添加购物车的view
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 55, self.view.frame.size.width, self.view.frame.size.height - 55)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}


@end
