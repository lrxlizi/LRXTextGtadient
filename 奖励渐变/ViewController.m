//
//  ViewController.m
//  奖励渐变
//
//  Created by 栗子 on 2017/9/28.
//  Copyright © 2017年 http://www.cnblogs.com/Lrx-lizi/. All rights reserved.
//

#import "ViewController.h"
#import "Healp.h"

@interface ViewController ()<CAAnimationDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    

    
    UILabel* testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 400, 50)];
    testLabel.text = @"label上渐变方法1";
    testLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:testLabel];
    [Healp TextGradientview:testLabel bgVIew:self.view gradientColors:@[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor] gradientStartPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
    
    
    
    
    
    
    
    
    
    
 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
