//
//  Breakthrough.m
//  UIBezierPathDemo
//
//  Created by suxx on 17/5/24.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import "Breakthrough.h"
#import <Masonry.h>

//顶部和底部的竖直方向的偏移
#define OFFSET_TOP_BOTTOM 10

@interface Breakthrough()

@property (nonatomic, strong)UIScrollView *bgScrollView;

@end


@implementation Breakthrough

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame withPoints:(NSArray *)pointArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        if (pointArr) {
            self.pointArr = pointArr;
        }
    }
    return self;
}

#pragma mark - Delegate
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (flag) {
        [self.bgScrollView setContentOffset:CGPointMake(0, self.pointDis*self.curPointIndex - self.frame.size.height/2.0) animated:YES];
        
        [self drawPoint];
    }
}

#pragma mark - Event Handle
-(void)btnClick:(UIButton *)btn{
    if (self.intoBreakthrough) {
        self.intoBreakthrough(btn.tag - 100);
    }
}

#pragma mark - Private Method

-(void)drawRect:(CGRect)rect{
    
    self.pointDis = self.pointDis > 0?self.pointDis:50;
    self.curPointIndex = self.pointDis > 0?self.curPointIndex:0;
    
    self.bgScrollView.contentSize = CGSizeMake(self.frame.size.width, self.pointDis * (self.pointArr.count - 1) + OFFSET_TOP_BOTTOM*2);
    
    [self drawArc];
    
}
- (void)drawArc{
    
    if (self.pointArr && self.pointArr.count) {
         float startY, offsetY;
        offsetY = self.pointDis;
        startY = OFFSET_TOP_BOTTOM;
        
        
        UIBezierPath *firstPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 0, 0)];
        
        
        for (NSInteger i = 0; i<self.pointArr.count; i++) {
            
            NSString *value = self.pointArr[i];
            
            CGPoint p = CGPointMake([value intValue], startY);
            
                if (i==0) {
                    [firstPath moveToPoint:p];
                }else{
                    NSString *tmpP = self.pointArr[i - 1];
                    CGPoint nextP = CGPointMake([tmpP intValue], startY - offsetY);
                    
                    CGPoint control1 = CGPointMake(nextP.x, p.y + (nextP.y - p.y) / 2.0);
                    
                    CGPoint control2 = CGPointMake(p.x, p.y + (nextP.y - p.y)/2.0 );
                    
                    [firstPath addCurveToPoint:p controlPoint1:control1 controlPoint2:control2];
                }
           
            startY += offsetY;
            
        }
        
        
        //第二、UIBezierPath和CAShapeLayer关联
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = self.bounds;
        shapeLayer.path = firstPath.CGPath;
        UIColor *color = [UIColor orangeColor];
        shapeLayer.strokeColor = color.CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = self.lineWidth > 0?self.lineWidth:10;
        
        //第三，动画
        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
        
        ani.fromValue = @0;
        
        ani.toValue = @1;
        
        ani.duration = 3;
        
        ani.delegate = self;
        
        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        
        [shapeLayer addAnimation:ani forKey:NSStringFromSelector(@selector(strokeEnd))];
        
        [self.bgScrollView.layer addSublayer:shapeLayer];
       
    }
}

-(void)drawPoint{
    
    __unsafe_unretained typeof(self) weakSelf = self;
    [self.pointArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        float width, height, offsetY, pointY, pointX;
        width = height = self.lineWidth + 10;
        offsetY = self.pointDis;
        pointY = idx*offsetY + OFFSET_TOP_BOTTOM;
        pointX = [obj floatValue];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(pointX - width/2, pointY - width/2, width, width);
        btn.tag = 100 + idx;
        
        [btn addTarget:weakSelf action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.backgroundColor = [UIColor whiteColor];
        [weakSelf.bgScrollView addSubview:btn];

        
    }];
}

#pragma mark - Public Method

#pragma mark - Getter 和 Setter
-(UIScrollView *)bgScrollView{
    if (_bgScrollView == nil) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.backgroundColor = [UIColor yellowColor];
        _bgScrollView.pagingEnabled = NO;
        [self addSubview:_bgScrollView];
        
        __unsafe_unretained typeof(self) weakSelf = self;
        [_bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.mas_equalTo(weakSelf);
        }];
    }
    return _bgScrollView;
}

@end
