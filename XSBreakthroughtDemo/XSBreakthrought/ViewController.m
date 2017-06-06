//
//  ViewController.m
//  XSBreakthrought
//
//  Created by suxx on 2017/6/2.
//  Copyright © 2017年 suxx. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "XSBEntanceView.h"
#import "XSBreakthroughtMainVC.h"


@interface ViewController ()

@property (nonatomic, strong)XSBEntanceView *entanceView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self prepareForUI];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.entanceView setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForUI{
    
    self.entanceView = [[XSBEntanceView alloc] init];
    [self.view addSubview:self.entanceView];
    
    __weak typeof(self) weakSelf = self;
    self.entanceView.clickBlock = ^{
        NSLog(@"点击事件");
        [weakSelf jumpToXSBreakthroughtMainVC];
        
    };
    
    
    [self.entanceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(120);
        make.width.mas_equalTo(62);
        make.center.mas_equalTo(weakSelf.view).offset(0);
    }];
    
}

-(void)jumpToXSBreakthroughtMainVC{
    XSBreakthroughtMainVC *bmvc = [[XSBreakthroughtMainVC alloc] init];
    [self.navigationController pushViewController:bmvc animated:YES];
}




@end
