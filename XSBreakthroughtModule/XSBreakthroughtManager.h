//
//  XSBreakthroughtManager.h
//  XSBreakthrought
//
//  Created by suxx on 2017/6/2.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSBreakthroughtModel.h"

@interface XSBreakthroughtManager : NSObject

+(XSBreakthroughtManager *)sharedXSBreakthroughtManager;

//当前闯关状态
@property (nonatomic, strong)XSBreakthroughtStatue *breakthroughtStatue;

@end
