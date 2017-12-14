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

@property (nonatomic,strong)UILabel *label;

@property (nonatomic,strong)UIButton *btn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*方法1*/
    
    UILabel* testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 400, 50)];
    testLabel.text = @"label上渐变方法1";
    testLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:testLabel];
    [Healp TextGradientview:testLabel bgVIew:self.view gradientColors:@[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor] gradientStartPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
    
    
    /*方法2*/
    _label=[[UILabel alloc]initWithFrame:CGRectMake(10, 300, self.view.frame.size.width-20,50)];
    [self.view addSubview:_label];
    _label.text=@"label上渐变方法2";
    _label.textAlignment=NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:30];
    _label.textColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"gradient"]];
    
    
    
    _btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 350, self.view.frame.size.width-20, 100)];
    [self.view addSubview:_btn];
    _btn.titleLabel.font=[UIFont systemFontOfSize:30];
    _btn.titleLabel.numberOfLines=0;
    [_btn setTitle:@"button上字体渐变色设置" forState:UIControlStateNormal];
    [Healp TextGradientControl:_btn bgVIew:self.view gradientColors:@[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor] gradientStartPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
