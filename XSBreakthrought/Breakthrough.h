//
//  Breakthrough.h
//  UIBezierPathDemo
//
//  Created by suxx on 17/5/24.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Breakthrough : UIView

//弧线的坐标点
@property (nonatomic, strong)NSArray *pointArr;

//线宽
@property (nonatomic, assign)NSUInteger lineWidth;

//每个点之间的间隔
@property (nonatomic, assign)NSUInteger pointDis;

//当前定位下标
@property (nonatomic, assign)NSUInteger curPointIndex;


//背景图片
@property (nonatomic, copy)NSString *bgImage;

@property (nonatomic, strong)void (^intoBreakthrough)(NSUInteger index);

- (instancetype)initWithFrame:(CGRect)frame withPoints:(NSArray *)pointArr;

@end
