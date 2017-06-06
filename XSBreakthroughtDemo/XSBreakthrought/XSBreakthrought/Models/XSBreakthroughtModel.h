//
//  XSBreakthroughtModel.h
//  XSBreakthrought
//
//  Created by suxx on 2017/6/2.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XSBreakthroughtModel : NSObject


@end

@interface XSBreakthroughtMainModel : NSObject

//每个关卡的坐标
@property (nonatomic, strong)NSArray *pointCoords;


@end

//每页的最大关卡数
#define MAX_STEPS_PAGE 18

typedef enum {
    UN_LOCK,//未解锁
    WAIT_BREAKTHROUGHT,//待闯关
    WAIT_GRADE,//待评分
    SUCCESS_BREAKTHROUGHT,//闯关成功
    FAIL_BREAKTHROUGHT,//闯关失败
}TBreakthroughtStatue;

@interface XSBreakthroughtStatue : NSObject

//当前关卡页数
@property (nonatomic, assign)NSUInteger currentPage;

//当前关卡数
@property (nonatomic, assign)NSUInteger currentStep;

//当前关卡状态
@property (nonatomic, assign)TBreakthroughtStatue currentStatue;

@end
