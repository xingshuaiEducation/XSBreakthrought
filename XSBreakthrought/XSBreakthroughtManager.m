//
//  XSBreakthroughtManager.m
//  XSBreakthrought
//
//  Created by suxx on 2017/6/2.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import "XSBreakthroughtManager.h"

@implementation XSBreakthroughtManager

+(XSBreakthroughtManager *)sharedXSBreakthroughtManager{
    static dispatch_once_t onceToken;
    static XSBreakthroughtManager *curManager = nil;
    dispatch_once(&onceToken, ^{
        curManager = [[XSBreakthroughtManager alloc] init];
    });
    
    return curManager;
}

#pragma mark - Delegate

#pragma mark - Event Handle

#pragma mark - Private Method

#pragma mark - Public Method

#pragma mark - Getter 和 Setter
-(XSBreakthroughtStatue *)breakthroughtStatue{
    if (!_breakthroughtStatue) {
        _breakthroughtStatue = [[XSBreakthroughtStatue alloc] init];
    }
    
    return _breakthroughtStatue;
}

@end
