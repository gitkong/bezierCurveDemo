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

- (FLBezierPathMaker *)removeAllPoints{
    [self.path removeAllPoints];
    return self;
}

- (FLBezierPathMaker *(^)(UIBezierPath *))appendPath{
    return ^(UIBezierPath *path){
        [self.path appendPath:path];
        return self;
    };
}

- (FLBezierPathMaker *)reverse{
    CGPoint reversePoint = [self.path bezierPathByReversingPath].currentPoint;
    self.moveTo(reversePoint.x,reversePoint.y);
    return self;
}

- (FLBezierPathMaker *(^)(CGAffineTransform))transform{
    return ^(CGAffineTransform transform){
        [self.path applyTransform:transform];
        return self;
    };
}

- (FLBezierPathMaker *)addClip{
    [self.path addClip];
    return self;
}

- (UIBezierPath * (^)())stroke{
    return ^{
        if (self.currentLineColor) {
            [self.currentLineColor setStroke];
        }
        else{
            [[UIColor blackColor] setStroke];
        }
        [self.path stroke];
        
        return self.path;
    };
}

- (UIBezierPath * (^)())fill{
    return ^{
        if (self.currentLineColor) {
            [self.currentLineColor setFill];
        }
        else{
            [[UIColor blackColor] setFill];
        }
        [self.path fill];
        return self.path;
    };
}

- (UIBezierPath *(^)(CGBlendMode, CGFloat))strokeWith{
    return ^(CGBlendMode blendMode, CGFloat alpha){
        if (self.currentLineColor) {
            [self.currentLineColor setStroke];
        }
        else{
            [[UIColor blackColor] setStroke];
        }
        [self.path strokeWithBlendMode:blendMode alpha:alpha];
        
        return self.path;
    };
}

- (UIBezierPath *(^)(CGBlendMode, CGFloat))fillWith{
    return ^(CGBlendMode blendMode, CGFloat alpha){
        if (self.currentLineColor) {
            [self.currentLineColor setFill];
        }
        else{
            [[UIColor blackColor] setFill];
        }
        [self.path fillWithBlendMode:blendMode alpha:alpha];
        
        return self.path;
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
    _maker = mk;
    return path;
}


+ (UIBezierPath * (^)(CGRect))fl_rect{
    return ^(CGRect rect){
         return FLCreatePath([UIBezierPath bezierPathWithRect:rect]);
    };
}

+ (UIBezierPath * (^)(CGRect))fl_ovalInRect{
    return ^(CGRect rect){
         return FLCreatePath([UIBezierPath bezierPathWithOvalInRect:rect]);
    };
}

+(UIBezierPath * (^)(CGRect, CGFloat))fl_roundedRect{
    return ^(CGRect rect,CGFloat cornerRadius){
         return FLCreatePath([UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius]);
    };
}

+(UIBezierPath * (^)(CGRect, UIRectCorner, CGSize))fl_roundingCorners{
    return ^(CGRect rect,UIRectCorner corners,CGSize cornerRadii){
         return FLCreatePath([UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii]);
    };
}

+(UIBezierPath * (^)(CGPoint, CGFloat, CGFloat, CGFloat, BOOL))fl_arcCenter{
    return ^(CGPoint center,CGFloat radius,CGFloat startAngle,CGFloat endAngle,BOOL clockwise){
         return FLCreatePath([UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:angle(startAngle) endAngle:angle(endAngle) clockwise:clockwise]);
    };
}

+ (UIBezierPath * (^)(CGPathRef))fl_CGPath{
    return ^(CGPathRef CGPath){
        return FLCreatePath([UIBezierPath bezierPathWithCGPath:CGPath]);
    };
}


@end
