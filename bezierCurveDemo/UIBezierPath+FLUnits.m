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

@end

@implementation UIBezierPath (FLUnits)

static FLBezierPathMaker *pathMaker = nil;

//+ (void)setFl_be:(FLBezierPathMaker *)fl_be{
//    if (fl_be != pathMaker) {
//        pathMaker = fl_be;
//    }
//}
//
//+ (FLBezierPathMaker *)fl_be{
//    if (pathMaker == nil) {
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        FLBezierPathMaker *maker = [[FLBezierPathMaker alloc] init];
//        maker.path = path;
//        pathMaker = maker;
//    }
//    return pathMaker;
//}

+ (void (^)(void (^)(FLBezierPathMaker *)))fl_bezierPath{
    void (^block)(void (^)(FLBezierPathMaker *)) = ^(void (^maker)(FLBezierPathMaker *)){
        UIBezierPath *path = [UIBezierPath bezierPath];
        FLBezierPathMaker *mk = [[FLBezierPathMaker alloc] init];
        mk.path = path;
        if (maker) {
            maker(mk);
        }
    };
    return block;
}

+ (FLBezierPathMaker *(^)(FLBezierPathMaker *))fl_bezier{
    UIBezierPath *path = [UIBezierPath bezierPath];
    FLBezierPathMaker *(^block)(FLBezierPathMaker *) = ^(FLBezierPathMaker *pathMaker){
        FLBezierPathMaker *maker = [[FLBezierPathMaker alloc] init];
        maker.path = path;
        
        return maker;
    };
    return block;
}

+ (instancetype)fl_bezierPath:(void (^)(FLBezierPathMaker *))pathOperation{
    UIBezierPath *path = [UIBezierPath bezierPath];
    FLBezierPathMaker *maker = [[FLBezierPathMaker alloc] init];
    maker.path = path;
    if (pathOperation) {
        pathOperation(maker);
    }
    return path;
}

@end
