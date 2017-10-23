//
//  ViewController.m
//  奖励渐变
//
//  Created by 栗子 on 2017/9/28.
//  Copyright © 2017年 http://www.cnblogs.com/Lrx-lizi/. All rights reserved.
//

#import "ViewController.h"
#import "Healp.h"

#define LColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

#define SCREENW  [UIScreen mainScreen].bounds.size.width
#define SCREENH   [UIScreen mainScreen].bounds.size.height
#define XY SCREENW/414
@interface ViewController ()<CAAnimationDelegate>
@property(nonatomic,strong)UILabel *energyLB;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *leftTopView;
@property(nonatomic,strong)UIButton *punchCardBtn;
@property(nonatomic,strong)UILabel *timeLB;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    

    
    self.timeLB = [[UILabel alloc]initWithFrame:CGRectMake(-50,-20, 100, 40)];
     self.timeLB.layer.anchorPoint = CGPointMake(0, 0);
    self.timeLB.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.timeLB];
    self.timeLB.text = @"23:33";
    self.timeLB.textAlignment = NSTextAlignmentCenter;
    self.timeLB.textColor = [UIColor blackColor];
    self.timeLB.font = [UIFont systemFontOfSize:30*XY];

    
    
    
    
    
    
    self.punchCardBtn = [[UIButton alloc]initWithFrame:CGRectMake(43.5,300, 100, 50)];
    self.punchCardBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.punchCardBtn];
    [self.punchCardBtn setTitle:@"打卡" forState:UIControlStateNormal];
    [self.punchCardBtn addTarget:self action:@selector(punchCardBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
//    CAKeyframeAnimation * rectanglePositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    rectanglePositionAnim.values   = @[[NSValue valueWithCGPoint:CGPointMake(43.5, 78.5)], [NSValue valueWithCGPoint:CGPointMake(43.5, 50)], [NSValue valueWithCGPoint:CGPointMake(43.5, 50)], [NSValue valueWithCGPoint:CGPointMake(23, 24)]];
//    rectanglePositionAnim.keyTimes = @[@0, @0.328, @0.658, @1];
//    rectanglePositionAnim.duration = 3;
//    [self.punchCardBtn.layer addAnimation:rectanglePositionAnim forKey:nil];

    
}
-(void)punchCardBtnAction{
    
    
//    [self scoresView];
    CAKeyframeAnimation * rectangleTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    rectangleTransformAnim.values   = @[[NSValue valueWithCATransform3D:CATransform3DIdentity],
                                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(3, 3, 1)],
                                        [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    rectangleTransformAnim.keyTimes = @[@0, @0.494, @1];
    rectangleTransformAnim.duration = 2;
    
    CAKeyframeAnimation * rectangleOpacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    rectangleOpacityAnim.values   = @[@1, @0.5, @1];
    rectangleOpacityAnim.keyTimes = @[@0, @0.488, @1];
    rectangleOpacityAnim.duration = 2;
    
    CAAnimationGroup *aniGroup = [CAAnimationGroup animation];
    aniGroup.duration = 3;
    aniGroup.animations = @[rectangleTransformAnim,rectangleOpacityAnim];
    aniGroup.repeatCount = 1;
    [self.timeLB.layer addAnimation:aniGroup forKey:nil];
    
    

}
//分数view
-(void)scoresView{
    
    self.view.alpha = 0.7;
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, self.view.frame.size.height-100, 300, 50)];
    _bgView.backgroundColor = [UIColor clearColor];
     [self.view addSubview:_bgView];
    self.energyLB = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 300, 50)];
    self.energyLB.font = [UIFont boldSystemFontOfSize:50];
    self.energyLB.textAlignment = NSTextAlignmentCenter;
    self.energyLB.textColor = [UIColor redColor];
    [self.bgView addSubview:self.energyLB];
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 1.0;
    shadow.shadowOffset = CGSizeMake(2, 2);
    shadow.shadowColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    
    NSDictionary *dic = @{NSShadowAttributeName:shadow};
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString: @"+500 分" attributes:dic];
    [self.energyLB setAttributedText:att];
    [Healp TextGradientview:self.energyLB bgVIew:self.bgView gradientColors:@[(id)[UIColor whiteColor].CGColor, (id)[UIColor redColor].CGColor] gradientStartPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1) locations:@[@0.05, @1.0]];
    self.bgView.transform = CGAffineTransformMakeScale(0.6f , 0.6f);
    self.bgView.alpha = 0.0f;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.bgView.transform = CGAffineTransformIdentity;
        weakSelf.bgView.alpha = 1.0f;
    } completion:^(BOOL finished) {
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
        [self.bgView setFrame:CGRectMake((SCREENW-300)/2, (SCREENH-50)/2, 300, 50)];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             self.view.alpha = 1;
            self.bgView.transform = CGAffineTransformMakeScale(0.5f , 0.5f);
            CAKeyframeAnimation * ovalPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            ovalPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(SCREENW/2, (SCREENH-50)/2)], [NSValue valueWithCGPoint:CGPointMake(SCREENW/2-60,SCREENH/2-180)],[NSValue valueWithCGPoint:CGPointMake(50, 20)]];
            ovalPositionAnim.duration              = 0.5;
            ovalPositionAnim.repeatCount           = 1;
            ovalPositionAnim.removedOnCompletion = NO;
            ovalPositionAnim.fillMode = kCAFillModeForwards;
            ovalPositionAnim.delegate = self;
            [self.bgView.layer addAnimation:ovalPositionAnim forKey:nil];
        });
    }];
    });
    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        weakSelf.bgView.transform = CGAffineTransformMakeScale(0.2f , 0.2f);
        weakSelf.bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf.bgView removeFromSuperview];
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.leftTopView.backgroundColor = [UIColor redColor];
        self.leftTopView.frame = CGRectMake(15, 20, 130, 20);
        self.leftTopView.alpha = 0.5;
      
    } completion:^(BOOL finished) {
       self.leftTopView.alpha = 1;
        [UIView animateWithDuration:0.5 animations:^{
            self.leftTopView.frame = CGRectMake(30, 20, 100, 20);
            self.leftTopView.backgroundColor = [UIColor greenColor];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:2 animations:^{
                self.timeLB.alpha = 0.5;
                self.timeLB.frame = CGRectMake(30, 60, 120, 60);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:2 animations:^{
                    self.timeLB.alpha = 1;
                    self.timeLB.frame = CGRectMake(30, 60, 100, 40);
                }];
                
                
            }];
        }];
    }];
                              
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
