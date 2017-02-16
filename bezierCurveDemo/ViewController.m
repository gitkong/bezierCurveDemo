//
//  ViewController.m
//  bezierCurveDemo
//
//  Created by 孔凡列 on 16/1/12.
//  Copyright © 2016年 czebd. All rights reserved.
//

#import "ViewController.h"
#import "FLPopoverPresentationController.h"
#import "FLAddProductController.h"
#import "UIBezierPath+FLUnits.h"
#import "FLBezierView.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.image = [UIImage imageNamed:@"banner"];
//    [self.view addSubview:imageView];
    FLBezierView *beView = [[FLBezierView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    [self.view addSubview:beView];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    FLAddProductController *addProductVc = [[FLAddProductController alloc] init];
    addProductVc.modalPresentationStyle = UIModalPresentationCustom;
    addProductVc.transitioningDelegate = self;
    [self presentViewController:addProductVc animated:YES completion:^{
        [addProductVc.cuteView curveAnimationWithDuration:0.2 curveY:-100];
    }];
    
}

#pragma mark - UIViewControllerTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    return [[FLPopoverPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
