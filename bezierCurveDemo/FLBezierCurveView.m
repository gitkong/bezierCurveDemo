//
//  FLBezierCurveView.m
//  bezierCurveDemo
//
//  Created by 孔凡列 on 16/1/12.
//  Copyright © 2016年 czebd. All rights reserved.
//

#import "FLBezierCurveView.h"

#define SYS_DEVICE_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                  // 屏幕宽度
#define SYS_DEVICE_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                 // 屏幕长度
#define MIN_HEIGHT          55

@interface FLBezierCurveView ()
@property (nonatomic, assign) CGFloat mHeight;
@property (nonatomic, assign) CGFloat curveX;               // r5点x坐标
@property (nonatomic, assign) CGFloat curveY;               // r5点y坐标
@property (nonatomic, strong) UIView *curveView;            // r5红点
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) BOOL isDismiss;
@end

@implementation FLBezierCurveView

static NSString *kX = @"curveX";
static NSString *kY = @"curveY";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        [self addObserver:self forKeyPath:kX options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:kY options:NSKeyValueObservingOptionNew context:nil];
        [self configShapeLayer];
        [self configCurveView];
        [self configAction];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseDisplayLink:) name:@"FLModalDismiss" object:nil];
        
    }
    
    return self;
}

- (void)pauseDisplayLink:(NSNotification *)notification{
    _isDismiss = YES;
    _displayLink.paused = YES;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:kX];
    [self removeObserver:self forKeyPath:kY];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"FLModalDismiss" object:nil];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kX] || [keyPath isEqualToString:kY]) {
        [self updateShapeLayerPath];
    }
}

#pragma mark -
#pragma mark - Configuration

- (void)configAction{
    
    // CADisplayLink默认每秒运行60次calculatePath是算出在运行期间_curveView的坐标，从而确定_shapeLayer的形状
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(calculatePath)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    _displayLink.paused = YES;
}

- (void)configShapeLayer{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:_shapeLayer];
}

- (void)configCurveView{
    // _curveView就是r5点
    self.curveX = SYS_DEVICE_WIDTH/2.0;       // r5点x坐标
    self.curveY = 0;                 // r5点y坐标
    _curveView = [[UIView alloc] initWithFrame:CGRectMake(_curveX, _curveY, 3, 3)];
    _curveView.backgroundColor = [UIColor clearColor];
    [self addSubview:_curveView];
}

#pragma mark -
#pragma mark - Action

- (void)curveAnimationWithDuration:(CGFloat)duration curveY:(CGFloat)curveY{
    if (_isDismiss) {
        _displayLink.paused = YES;
        return;
    }
    _displayLink.paused = NO;
    // 弹簧动效
    
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.0
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         // 曲线点(r5点)是一个view.所以在block中有弹簧效果.然后根据他的动效路径,在calculatePath中计算弹性图形的形状
                         _curveView.frame = CGRectMake(SYS_DEVICE_WIDTH/2.0, curveY, 3, 3);
                         
                     } completion:^(BOOL finished) {
                         
                         CGFloat curveNextY = -curveY + (curveY < 0 ? (-20) : 20);
                         
                         if (curveNextY == 20) {
                             if (finished) {
                                 _displayLink.paused = YES;
                                 return ;
                             }
                             
                         }
                         // 递归
                         [self curveAnimationWithDuration:duration + 0.1 curveY:curveNextY];
                         /**
                          *  
                          CA_EXTERN NSString * const kCAFillModeForwards
                          __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
                          CA_EXTERN NSString * const kCAFillModeBackwards
                          __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
                          CA_EXTERN NSString * const kCAFillModeBoth
                          __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
                          CA_EXTERN NSString * const kCAFillModeRemoved
                          __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
                          */
                         _shapeLayer.fillMode = kCAFillModeForwards;
                         
                     }];
}

- (void)updateShapeLayerPath
{
    // 更新_shapeLayer形状
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    [tPath moveToPoint:CGPointMake(0, MIN_HEIGHT)];                              // r1点
    [tPath addLineToPoint:CGPointMake(SYS_DEVICE_WIDTH, MIN_HEIGHT)];            // r2点
    [tPath addLineToPoint:CGPointMake(SYS_DEVICE_WIDTH,  0)];  // r4点
    [tPath addQuadCurveToPoint:CGPointMake(0, 0)// r3
                  controlPoint:CGPointMake(_curveX, _curveY)]; // r3,r4,r5确定的一个弧线
    [tPath closePath];
    _shapeLayer.path = tPath.CGPath;
}


- (void)calculatePath
{
    // 由于手势结束时,r5执行了一个UIView的弹簧动画,把这个过程的坐标记录下来,并相应的画出_shapeLayer形状
    CALayer *layer = _curveView.layer.presentationLayer;
    self.curveX = layer.position.x;
    self.curveY = layer.position.y;
    
}


@end
