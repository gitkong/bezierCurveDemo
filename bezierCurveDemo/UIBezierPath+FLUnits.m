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

#import "UIBezierPath+FLUnits.h"

@interface FLBezierLineInfo ()
@property (nonatomic,weak)UIBezierPath *path;
@property (nonatomic,strong)UIColor *lineColor;
@end

@implementation FLBezierLineInfo


- (FLBezierLineInfo *(^)(UIColor *))color{
    return ^(UIColor *color){
        self.lineColor = color;
        return self;
    };
}

- (FLBezierLineInfo *(^)(CGFloat))lineWidth{
    return ^(CGFloat lineWidth){
        self.path.lineWidth = lineWidth;
        return self;
    };
}

- (FLBezierLineInfo *(^)(CGLineCap))lineCapStyle{
    return ^(CGLineCap lineCapStyle){
        self.path.lineCapStyle = lineCapStyle;
        return self;
    };
}

- (FLBezierLineInfo *(^)(CGLineJoin))lineJoinStyle{
    return ^(CGLineJoin lineJoinStyle){
        self.path.lineJoinStyle = lineJoinStyle;
        return self;
    };
}

- (FLBezierLineInfo *(^)(CGFloat))miterLimit{
    return ^(CGFloat miterLimit){
        self.path.miterLimit = miterLimit;
        return self;
    };
}

- (FLBezierLineInfo *(^)(CGFloat))flatness{
    return ^(CGFloat flatness){
        self.path.flatness = flatness;
        return self;
    };
}

- (FLBezierLineInfo *(^)(BOOL))usesEvenOddFillRule{
    return ^(BOOL usesEvenOddFillRule){
        self.path.usesEvenOddFillRule = usesEvenOddFillRule;
        return self;
    };
}

- (FLBezierLineInfo *(^)(CGFloat *, NSInteger, CGFloat))setLineDash{
    return ^(CGFloat *pattern,NSInteger count,CGFloat phase){
        [self.path setLineDash:pattern count:count phase:phase];
        return self;
    };
}

- (FLBezierLineInfo *(^)(CGFloat *, NSInteger *, CGFloat *))getLineDash{
    return ^(CGFloat *pattern,NSInteger *count,CGFloat *phase){
        [self.path getLineDash:pattern count:count phase:phase];
        return self;
    };
}

- (void)setLineDash:(const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase{
    [self.path setLineDash:pattern count:count phase:phase];
}
- (void)getLineDash:(CGFloat *)pattern count:(NSInteger *)count phase:(CGFloat *)phase{
    [self.path getLineDash:pattern count:count phase:phase];
}
@end

@interface FLBezierPathMaker ()
@property (nonatomic,weak)UIBezierPath *path;
@end

@implementation FLBezierPathMaker

- (FLBezierPathMaker *(^)(CGFloat x, CGFloat y))moveTo{
    return ^(CGFloat x, CGFloat y){
        [self.path moveToPoint:CGPointMake(x, y)];
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGFloat, CGFloat))addLineTo{
    return ^(CGFloat x, CGFloat y){
        [self.path addLineToPoint:CGPointMake(x, y)];
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGPoint, CGPoint))addQuadCurveTo{
    return ^(CGPoint endPoint, CGPoint controlPoint){
        [self.path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGPoint, CGPoint, CGPoint))addCurveTo{
    return ^(CGPoint endPoint, CGPoint controlPoint1, CGPoint controlPoint2){
        [self.path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        return self;
    };
}

- (void (^)(void (^)(FLBezierLineInfo *lineInfo)))stroke{
    return ^(void (^lineInfoMaker)(FLBezierLineInfo *lineInfo)){
        if (lineInfoMaker) {
            FLBezierLineInfo *lineInfo = [[FLBezierLineInfo alloc] init];
            lineInfo.path = self.path;
            lineInfoMaker(lineInfo);
            [lineInfo.lineColor setStroke];
        }
        [self.path stroke];
    };
}

- (void (^)(UIColor *))fill{
    return ^(UIColor *color){
        [color setFill];
        [self.path fill];
    };
}

@end

@implementation UIBezierPath (FLUnits)

UIBezierPath * FLCreatePathMaker(UIBezierPath *path,void (^maker)(FLBezierPathMaker *)){
    FLBezierPathMaker *mk = [[FLBezierPathMaker alloc] init];
    mk.path = path;
    if (maker) {
        maker(mk);
    }
    return path;
}

+ (UIBezierPath * (^)(void (^)(FLBezierPathMaker *)))fl_bezierPath{
    return ^(void (^maker)(FLBezierPathMaker *)){
        return FLCreatePathMaker([UIBezierPath bezierPath],maker);
    };
}

+ (UIBezierPath * (^)(CGRect, void (^)(FLBezierPathMaker *)))fl_bezierPathWithRect{
    return ^(CGRect rect,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithRect:rect],maker);
    };
}

+ (UIBezierPath * (^)(CGRect, void (^)(FLBezierPathMaker *)))fl_bezierPathWithOvalInRect{
    return ^(CGRect rect,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithOvalInRect:rect],maker);
    };
}

+(UIBezierPath * (^)(CGRect, CGFloat, void (^)(FLBezierPathMaker *)))fl_bezierPathWithRoundedRect{
    return ^(CGRect rect,CGFloat cornerRadius,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius],maker);
    };
}

+(UIBezierPath * (^)(CGRect, UIRectCorner, CGSize, void (^)(FLBezierPathMaker *)))fl_bezierPathWithRoundedRectByRoundingCorners{
    return ^(CGRect rect,UIRectCorner corners,CGSize cornerRadii,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii],maker);
    };
}

+(UIBezierPath * (^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL, void (^)(FLBezierPathMaker *)))fl_bezierPathWithArcCenter{
    return ^(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise],maker);
    };
}

+ (UIBezierPath * (^)(CGPathRef, void (^)(FLBezierPathMaker *)))fl_bezierPathWithCGPath{
    return ^(CGPathRef CGPath,void (^maker)(FLBezierPathMaker *)){
        return FLCreatePathMaker([UIBezierPath bezierPathWithCGPath:CGPath],maker);
    };
}


@end
