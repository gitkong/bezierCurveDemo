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

@property (nonatomic,copy)FLBezierLineInfo *(^lineColor)(UIColor *color);
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

@property (nonatomic,copy,readonly)FLBezierPathMaker *(^color)(UIColor *color);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^lineWidth)(CGFloat lineWidth);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^lineCapStyle)(CGLineCap lineCapStyle);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^lineJoinStyle)(CGLineJoin lineJoinStyle);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^miterLimit)(CGFloat miterLimit);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^flatness)(CGFloat flatness);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^usesEvenOddFillRule)(BOOL usesEvenOddFillRule);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^setLineDash)(CGFloat *pattern,NSInteger count,CGFloat phase);
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^getLineDash)(CGFloat *pattern,NSInteger *count,CGFloat *phase);

/**
 *  @author gitKong
 *
 *  起点，可多次设置
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
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^addQuadCurveTo)(CGPoint endPoint,CGPoint controlPoint);
/**
 *  @author gitKong
 *
 *  三次贝塞尔
 */
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^addCurveTo)(CGPoint endPoint,CGPoint controlPoint1,CGPoint controlPoint2);
/**
 *  @author gitKong
 *
 *  这段圆弧的中心，半径，开始角度，结束角度，是否顺时针方向。
 */
@property (nonatomic,copy,readonly)FLBezierPathMaker *(^addArcWith)(CGPoint centerPoint,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise);

@property (nonatomic,copy,readonly)FLBezierPathMaker *closePath;

@property (nonatomic,copy,readonly)FLBezierPathMaker *(^appendPath)(UIBezierPath *bezierPath);

@property (nonatomic,copy,readonly)FLBezierPathMaker *removeAllPoints;
/**
 *  @author gitKong
 *
 *  默认颜色为blackColor
 */
//@property (nonatomic,copy,readonly)void (^stroke)(void(^lineInfoMaker)(FLBezierLineInfo *lineInfo));

//@property (nonatomic,copy,readonly)UIBezierPath *stroke;
/**
 *  @author gitKong
 *
 *  默认绘制颜色为UIColor.blackColor
 */
@property (nonatomic,copy,readonly)void (^stroke)();

@property (nonatomic,copy,readonly)void (^fill)();

@end

@interface UIBezierPath (FLUnits)
/**
 *  @author gitKong
 *
 *  对外提供的 中间类对象，设置中间类的对象属性
 */
@property (nonatomic,strong,readonly)FLBezierPathMaker *maker;
/**
 *  @author gitKong
 *
 *  类属性，创建UIBezierPath实例
 */
@property (class,nonatomic,strong,readonly)UIBezierPath *fl_path;



/**
 *  @author gitKong
 *
 *  回调通过 maker 初始化中间类信息
 */
//+ (instancetype)fl_bezierPath:(void(^)(FLBezierPathMaker *maker))makeOperation;

+ (instancetype)fl_bezierPathWithRect:(CGRect) rect makeOperation:(void(^)(FLBezierPathMaker *maker))makeOperation;

/**
 *  @author gitKong
 *
 *  通过添加 class 修饰，就是类属性
 
 *  fl_bezierPath：参数：maker（block）；返回值：UIBezierPath *
 
 *  maker（block）：参数：FLBezierPathMaker *；返回值：void
 
 */
@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_bezierPath)(void(^makeOperation)(FLBezierPathMaker *));





/**
 *  @author gitKong
 *
 *  绘制矩形
 */
@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_rect)(CGRect rect,void(^maker)(FLBezierPathMaker *));
/**
 *  @author gitKong
 *
 *  绘制圆形或者椭圆形（取决于传入的rect）
 */
@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_ovalInRect)(CGRect rect,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_roundedRect)(CGRect rect,CGFloat cornerRadius,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_roundingCorners)(CGRect rect,UIRectCorner corners,CGSize cornerRadii,void(^maker)(FLBezierPathMaker *));
/**
 *  @author gitKong
 *
 *  绘制圆弧
 */
@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_arcCenter)(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise,void(^maker)(FLBezierPathMaker *));

@property (class,nonatomic,copy,readonly)UIBezierPath *(^fl_CGPath)(CGPathRef CGPath,void(^maker)(FLBezierPathMaker *));

@end
