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
   
//    [UIBezierPath fl_bezierPath:^(FLBezierPathMaker *maker) {
//        maker.moveTo(0,20).addLineTo(30,50).stroke();
//    }];
//    
//    UIBezierPath.fl_bezierPath(^(FLBezierPathMaker *maker) {
//        maker.moveTo(0,20).addLineTo(30,50).stroke();
//    });
    
    UIBezierPath.fl_path.maker.moveTo(0,20).addLineTo(30,50).appendPath(UIBezierPath.fl_path.maker.moveTo(40,60).addLineTo(100,30).color(UIColor.redColor).stroke()).stroke();
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 20)];
    [path addLineToPoint:CGPointMake(30, 50)];
    [path stroke];
    [path bezierPathByReversingPath];
    
    NSLog(@"system = %@",NSStringFromCGPoint([path bezierPathByReversingPath].currentPoint));
    
//    UIBezierPath.fl_path(^(FLBezierPathMaker *maker){
//        maker.moveTo(0,20).addLineTo(30,50).stroke(^(FLBezierLineInfo *infoMaker){
//            infoMaker.lineColor([UIColor redColor]).lineWidth(5).lineCapStyle(kCGLineCapRound).lineJoinStyle(kCGLineJoinMiter);
//        });
//    });
    
    
    
//    UIBezierPath.fl_path.maker.moveTo(0,20).addLineTo(30,50).stroke(^(FLBezierLineInfo *infoMaker){
//        infoMaker.color([UIColor redColor]).lineWidth(5).lineCapStyle(kCGLineCapRound).lineJoinStyle(kCGLineJoinMiter);
//    });
    
    NSLog(@"%@",NSStringFromCGPoint(UIBezierPath.fl_path.maker.moveTo(90,200).addLineTo(200,200).addLineTo(130,300).addLineTo(130,450).addLineTo(90,380).addLineTo(250,200).addLineTo(250,450).addLineTo(300,450).addLineTo(300,380).lineWidth(7).lineCapStyle(kCGLineCapRound).lineJoinStyle(kCGLineJoinRound).color(UIColor.redColor).stroke().currentPoint));
    /**
     *  @author gitKong
     *
     *  因为x-code 不提示，我最快的方法只能通过去h文件copy过来填写，参数太多，而且参数还带个block，太麻烦
     */
//    UIBezierPath.fl_arcCenter(CGPointMake(30, 30),30,0,60,YES,^(FLBezierPathMaker *maker){
//        maker.moveTo(0,20).addLineTo(30,50).stroke();
//    });
    
//    UIBezierPath.fl_path(^(FLBezierPathMaker *maker){
//        maker.moveTo(30,50).addLineTo(100,80).stroke(^(FLBezierLineInfo *infoMaker){
//            infoMaker.lineWidth(1).lineCapStyle(kCGLineCapRound);
//        });
//    });
//    
//    UIBezierPath.fl_path(^(FLBezierPathMaker *maker){
//        maker.moveTo(100,80).addQuadCurveTo(CGPointMake(300, 80),CGPointMake(200, 20)).stroke(^(FLBezierLineInfo *infoMaker){
//            infoMaker.color([UIColor greenColor]).lineWidth(15).lineCapStyle(kCGLineCapButt);
//        });
//    });
//    
//    UIBezierPath *path = UIBezierPath.fl_path(^(FLBezierPathMaker *maker){
//        maker.moveTo(300,80).addQuadCurveTo(CGPointMake(300, 160),CGPointMake(150, 120)).fill([UIColor grayColor]);
//    });
    
//    // fl_bezierPathWithRect 矩形；fl_bezierPathWithOvalInRect椭圆或圆形
//    UIBezierPath.fl_ovalInRect(CGRectMake(0, 200, 300, 200),^(FLBezierPathMaker *maker){
//        maker.moveTo(0,300).addCurveTo(CGPointMake(200,300),CGPointMake(50,200),CGPointMake(150,400)).closePath.appendPath(path).stroke(^(FLBezierLineInfo *infoMaker){
//            infoMaker.color([UIColor cyanColor]).lineWidth(2).lineCapStyle(kCGLineCapButt);
//        });
//    });
    
//    UIBezierPath.fl_bezierPath(^(FLBezierPathMaker *maker){
//        maker.addArcWith(CGPointMake(200, 600),100,0,60,YES).stroke(nil);
//    });
    
    // 画弧度，取消[]
//    [UIBezierPath.fl_bezierPathWithArcCenter(CGPointMake(200, 600),100,0,60,YES,nil) stroke];
//    UIBezierPath.fl_arcCenter(CGPointMake(200, 600),100,0,60,YES,nil).maker.stroke(nil);
//    
//    UIBezierPath.fl_arcCenter(CGPointMake(200, 600),100,60,120,YES,nil).maker.stroke(^(FLBezierLineInfo *infoMaker){
//        infoMaker.color([UIColor greenColor]);
//    });
}


@end
