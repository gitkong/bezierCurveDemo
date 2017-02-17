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
@property (nonatomic,strong)UIColor *currentLineColor;
@end

@implementation FLBezierLineInfo


//- (FLBezierLineInfo *(^)(UIColor *))lineColor{
//    return ^(UIColor *color){
//        self.currentLineColor = color;
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(CGFloat))lineWidth{
//    return ^(CGFloat lineWidth){
//        self.path.lineWidth = lineWidth;
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(CGLineCap))lineCapStyle{
//    return ^(CGLineCap lineCapStyle){
//        self.path.lineCapStyle = lineCapStyle;
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(CGLineJoin))lineJoinStyle{
//    return ^(CGLineJoin lineJoinStyle){
//        self.path.lineJoinStyle = lineJoinStyle;
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(CGFloat))miterLimit{
//    return ^(CGFloat miterLimit){
//        self.path.miterLimit = miterLimit;
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(CGFloat))flatness{
//    return ^(CGFloat flatness){
//        self.path.flatness = flatness;
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(BOOL))usesEvenOddFillRule{
//    return ^(BOOL usesEvenOddFillRule){
//        self.path.usesEvenOddFillRule = usesEvenOddFillRule;
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(CGFloat *, NSInteger, CGFloat))setLineDash{
//    return ^(CGFloat *pattern,NSInteger count,CGFloat phase){
//        [self.path setLineDash:pattern count:count phase:phase];
//        return self;
//    };
//}
//
//- (FLBezierLineInfo *(^)(CGFloat *, NSInteger *, CGFloat *))getLineDash{
//    return ^(CGFloat *pattern,NSInteger *count,CGFloat *phase){
//        [self.path getLineDash:pattern count:count phase:phase];
//        return self;
//    };
//}

@end

@interface FLBezierPathMaker ()
@property (nonatomic,weak)UIBezierPath *path;
@property (nonatomic,strong)UIColor *currentLineColor;
@end

@implementation FLBezierPathMaker

CGFloat angle(CGFloat value){
    double pi = 3.14159265359;
    return (pi * value) / 180;
}


- (FLBezierPathMaker *(^)(UIColor *))color{
    return ^(UIColor *color){
        self.currentLineColor = color;
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGFloat))lineWidth{
    return ^(CGFloat lineWidth){
        self.path.lineWidth = lineWidth;
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGLineCap))lineCapStyle{
    return ^(CGLineCap lineCapStyle){
        self.path.lineCapStyle = lineCapStyle;
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGLineJoin))lineJoinStyle{
    return ^(CGLineJoin lineJoinStyle){
        self.path.lineJoinStyle = lineJoinStyle;
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGFloat))miterLimit{
    return ^(CGFloat miterLimit){
        self.path.miterLimit = miterLimit;
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGFloat))flatness{
    return ^(CGFloat flatness){
        self.path.flatness = flatness;
        return self;
    };
}

- (FLBezierPathMaker *(^)(BOOL))usesEvenOddFillRule{
    return ^(BOOL usesEvenOddFillRule){
        self.path.usesEvenOddFillRule = usesEvenOddFillRule;
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGFloat *, NSInteger, CGFloat))setLineDash{
    return ^(CGFloat *pattern,NSInteger count,CGFloat phase){
        [self.path setLineDash:pattern count:count phase:phase];
        return self;
    };
}

- (FLBezierPathMaker *(^)(CGFloat *, NSInteger *, CGFloat *))getLineDash{
    return ^(CGFloat *pattern,NSInteger *count,CGFloat *phase){
        [self.path getLineDash:pattern count:count phase:phase];
        return self;
    };
}


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

- (FLBezierPathMaker *(^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))addArcWith{
    return ^(CGPoint centerPoint,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise){
        
        [self.path addArcWithCenter:centerPoint radius:radius startAngle:angle(startAngle) endAngle:angle(endAngle) clockwise:clockwise];
        return self;
    };
}


- (FLBezierPathMaker *)closePath{
    [self.path closePath];
    return self;
}

- (FLBezierPathMaker *(^)(UIBezierPath *))appendPath{
    return ^(UIBezierPath *path){
        [self.path appendPath:path];
        return self;
    };
}

- (FLBezierPathMaker *)removeAllPoints{
    [self.path removeAllPoints];
    return self;
}

//- (void (^)(void (^)(FLBezierLineInfo *lineInfo)))stroke{
//    return ^(void (^lineInfoMaker)(FLBezierLineInfo *lineInfo)){
//        if (lineInfoMaker) {
//            FLBezierLineInfo *lineInfo = [[FLBezierLineInfo alloc] init];
//            lineInfo.path = self.path;
//            lineInfoMaker(lineInfo);
//            if (lineInfo.lineColor) {
//                [lineInfo.lineColor setStroke];
//            }
//            else{
//                [[UIColor blackColor] setStroke];
//            }
//        }
//        else{
//            [[UIColor blackColor] setStroke];
//        }
//        [self.path stroke];
//    };
//}

//- (UIBezierPath *)stroke{
//    if (self.lineColor) {
//        [self.lineColor setStroke];
//    }
//    else{
//        [[UIColor blackColor] setStroke];
//    }
//    [self.path stroke];
//    return self.path;
//}

- (void (^)())stroke{
    return ^{
        if (self.currentLineColor) {
            [self.currentLineColor setStroke];
        }
        else{
            [[UIColor blackColor] setStroke];
        }
        [self.path stroke];
    };
}

- (void (^)())fill{
    return ^{
        if (self.currentLineColor) {
            [self.currentLineColor setFill];
        }
        else{
            [[UIColor blackColor] setFill];
        }
        [self.path fill];
    };
}

@end

@implementation UIBezierPath (FLUnits)

static FLBezierPathMaker *_maker = nil;

- (FLBezierPathMaker *)maker{
    return _maker;
}

+ (UIBezierPath *)fl_path{
    return FLCreatePath([UIBezierPath bezierPath]);
}

UIBezierPath * FLCreatePath(UIBezierPath *path){
    FLBezierPathMaker *mk = [[FLBezierPathMaker alloc] init];
    mk.path = path;
    // 存储当前的FLBezierPathMaker
    _maker = mk;
    return path;
}

UIBezierPath * FLCreatePathMaker(UIBezierPath *path,void (^makeOperation)(FLBezierPathMaker *)){
    // 初始化 中间类 对象
    FLBezierPathMaker *mk = [[FLBezierPathMaker alloc] init];
    mk.path = path;
    // 实现传递过来 makeOperation，并传出参数：FLBezierPathMaker 对象
    if (makeOperation) {
        makeOperation(mk);
    }
    // 存储当前的 FLBezierPathMaker 对象
    _maker = mk;
    return path;
}

+ (UIBezierPath * (^)(void (^)(FLBezierPathMaker *)))fl_bezierPath{
    /**
     *  @author gitKong
     *
     *  类属性需要调用者手动实现 getter 方法
     */
    return ^(void (^makeOperation)(FLBezierPathMaker *)){
        // 传递参数，返回 UIBezierPath 对象
        return FLCreatePathMaker([UIBezierPath bezierPath],makeOperation);
    };
}


+ (UIBezierPath * (^)(CGRect, void (^)(FLBezierPathMaker *)))fl_rect{
    return ^(CGRect rect,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithRect:rect],maker);
    };
}

+ (UIBezierPath * (^)(CGRect, void (^)(FLBezierPathMaker *)))fl_ovalInRect{
    return ^(CGRect rect,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithOvalInRect:rect],maker);
    };
}

+(UIBezierPath * (^)(CGRect, CGFloat, void (^)(FLBezierPathMaker *)))fl_roundedRect{
    return ^(CGRect rect,CGFloat cornerRadius,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius],maker);
    };
}

+(UIBezierPath * (^)(CGRect, UIRectCorner, CGSize, void (^)(FLBezierPathMaker *)))fl_roundingCorners{
    return ^(CGRect rect,UIRectCorner corners,CGSize cornerRadii,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii],maker);
    };
}

+(UIBezierPath * (^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL, void (^)(FLBezierPathMaker *)))fl_arcCenter{
    return ^(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise,void (^maker)(FLBezierPathMaker *)){
         return FLCreatePathMaker([UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:angle(startAngle) endAngle:angle(endAngle) clockwise:clockwise],maker);
    };
}

+ (UIBezierPath * (^)(CGPathRef, void (^)(FLBezierPathMaker *)))fl_CGPath{
    return ^(CGPathRef CGPath,void (^maker)(FLBezierPathMaker *)){
        return FLCreatePathMaker([UIBezierPath bezierPathWithCGPath:CGPath],maker);
    };
}


@end
