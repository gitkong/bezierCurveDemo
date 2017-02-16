/*
 * author gitKong
 *
 * 个人博客 https://gitKong.github.io
 * gitHub https://github.com/gitkong
 * cocoaChina http://code.cocoachina.com/user/
 * 简书 http://www.jianshu.com/users/fe5700cfb223/latest_articles
 * QQ 279761135
 * 微信公众号 原创技术分享
 * 喜欢就给个like 和 star 喔~
 */

#import <UIKit/UIKit.h>

typedef struct pathInfo{
//    UIColor *lineColor;
    CGFloat lineWidth;
}pathInfo;

@interface FLBezierLineInfo : NSObject
@property (nonatomic,weak,readonly)UIBezierPath *path;
@property (nonatomic,strong,readonly)UIColor *lineColor;

@property (nonatomic,copy)FLBezierLineInfo *(^color)(UIColor *color);
@property (nonatomic,copy)FLBezierLineInfo *(^lineWidth)(CGFloat lineWidth);
@property (nonatomic,copy)FLBezierLineInfo *(^lineCapStyle)(CGLineCap lineCapStyle);
@property (nonatomic,copy)FLBezierLineInfo *(^lineJoinStyle)(CGLineJoin lineJoinStyle);
@property (nonatomic,copy)FLBezierLineInfo *(^miterLimit)(CGFloat miterLimit);
@property (nonatomic,copy)FLBezierLineInfo *(^flatness)(CGFloat flatness);
@property (nonatomic,copy)FLBezierLineInfo *(^usesEvenOddFillRule)(BOOL usesEvenOddFillRule);
@property (nonatomic,copy)FLBezierLineInfo *(^setLineDash)(CGFloat *pattern,NSInteger count,CGFloat phase);
@property (nonatomic,copy)FLBezierLineInfo *(^getLineDash)(CGFloat *pattern,NSInteger *count,CGFloat *phase);

@end

@interface FLBezierPathMaker : NSObject

@property (nonatomic,weak,readonly)UIBezierPath *path;
/**
 *  @author gitKong
 *
 *  每个path的起点，可多次设置
 */
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^moveTo)(CGFloat x,CGFloat y);
/**
 *  @author gitKong
 *
 *  添加线
 */
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^addLineTo)(CGFloat x,CGFloat y);
/**
 *  @author gitKong
 *
 *  二次贝塞尔
 */
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^addCurveTo)(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2);
/**
 *  @author gitKong
 *
 *  一次贝塞尔
 */
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^addQuadCurveTo)(CGPoint endPoint,CGPoint controlPoint);

@property (nonatomic,copy,readonly)FLBezierPathMaker *(^addArcWith)(CGPoint centerPoint,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);

@property (nonatomic,copy,readonly)FLBezierPathMaker *(^close)();

@property (nonatomic,copy,readonly)FLBezierPathMaker *(^appendPath)(UIBezierPath *bezierPath);

@property (nonatomic,copy,readonly)FLBezierPathMaker *(^removeAllPoints)();

@property (nonatomic,copy,readonly)void (^stroke)(void(^lineInfoMaker)(FLBezierLineInfo *lineInfo));

@property (nonatomic,copy,readonly)void (^fill)(UIColor *color);

@end

@interface UIBezierPath (FLUnits)

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPath)(void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPathWithRect)(CGRect rect,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPathWithOvalInRect)(CGRect rect,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPathWithRoundedRect)(CGRect rect,CGFloat cornerRadius,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPathWithRoundedRectByRoundingCorners)(CGRect rect,UIRectCorner corners,CGSize cornerRadii,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPathWithArcCenter)(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPathWithCGPath)(CGPathRef CGPath,void(^maker)(FLBezierPathMaker *));

@end
