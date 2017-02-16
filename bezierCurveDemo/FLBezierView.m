//
//  FLBezierView.m
//  testttt
//
//  Created by clarence on 17/2/16.
//  Copyright © 2017年 gitKong. All rights reserved.
//

#import "FLBezierView.h"
#import "UIBezierPath+FLUnits.h"
@implementation FLBezierView

// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    
    UIBezierPath.fl_bezierPath(^(FLBezierPathMaker *maker){
        maker.moveTo(0,20).addLineTo(30,50).stroke(^(FLBezierLineInfo *infoMaker){
            infoMaker.color([UIColor redColor]).lineWidth(5).lineCapStyle(kCGLineCapRound).lineJoinStyle(kCGLineJoinMiter);
        });
    });
    
    UIBezierPath.fl_bezierPath(^(FLBezierPathMaker *maker){
        maker.moveTo(30,50).addLineTo(100,80).stroke(^(FLBezierLineInfo *infoMaker){
            infoMaker.color([UIColor whiteColor]).lineWidth(1).lineCapStyle(kCGLineCapRound);
        });
    });
    
    UIBezierPath.fl_bezierPath(^(FLBezierPathMaker *maker){
        maker.moveTo(100,80).addQuadCurveTo(CGPointMake(300, 80),CGPointMake(200, 20)).stroke(^(FLBezierLineInfo *infoMaker){
            infoMaker.color([UIColor greenColor]).lineWidth(15).lineCapStyle(kCGLineCapButt);
        });
    });
    
    UIBezierPath.fl_bezierPath(^(FLBezierPathMaker *maker){
        maker.moveTo(300,80).addQuadCurveTo(CGPointMake(300, 160),CGPointMake(150, 120)).fill([UIColor grayColor]);
    });
    
}


@end
