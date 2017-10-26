//
//  HBX_CustomTabBar.m
//  customerTabBar
//
//  Created by apple on 2017/10/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBX_CustomTabBar.h"

//#define barWidth self.bounds.size.width

//#define barHeight self.bounds.size.height

@interface HBX_CustomTabBar()

///中间的按钮
@property (nonatomic, strong) UIButton *centerButton;



@end

@implementation HBX_CustomTabBar

- (UIButton *)centerButton {
    
    if (_centerButton == nil) {
        _centerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
        [_centerButton setImage:[UIImage imageNamed:@"ime_home"] forState:UIControlStateNormal];
        [_centerButton addTarget:self action:@selector(clickCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
    
}


- (void)clickCenterBtn:(UIButton *)button {
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 把 tabBarButton 取出来（把 tabBar 的 subViews 打印出来就明白了）
    NSMutableArray *tabBarButtonArray = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtonArray addObject:view];
        }
    }
    
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    CGFloat centerBtnWidth = CGRectGetWidth(self.centerButton.frame);
    
    CGFloat centerBtnHeight = CGRectGetHeight(self.centerButton.frame);
    // 设置中间按钮的位置，居中，凸起一丢丢
    self.centerButton.center = CGPointMake(barWidth / 2, barHeight - centerBtnHeight/2 - 5);
    
    // 重新布局其他 tabBarItem
    // 平均分配其他 tabBarItem 的宽度
    CGFloat barItemWidth = (barWidth - centerBtnWidth) / tabBarButtonArray.count;
    // 逐个布局 tabBarItem，修改 UITabBarButton 的 frame
    
    NSLog(@"count------%ld",tabBarButtonArray.count);
    
    
    //布局 中间按钮后面tabbar 的布局
    [tabBarButtonArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect frame = view.frame;
        if (idx >= tabBarButtonArray.count / 2) {
            // 重新设置 x 坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
            frame.origin.x = idx * barItemWidth + centerBtnWidth;
        } else {
            frame.origin.x = idx * barItemWidth;
        }
        // 重新设置宽度
        frame.size.width = barItemWidth;
        view.frame = frame;
        
    }];
    
    [self addSubview:self.centerButton];
    
    // 把中间按钮带到视图最前面
    [self bringSubviewToFront:self.centerButton];

    
}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    UIView *result = [super hitTest:point withEvent:event];
    // 如果事件发生在 tabbar 里面直接返回
    if (result) {
        return result;
    }
    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
    for (UIView *subview in self.subviews) {
        // 把这个坐标从tabbar的坐标系转为 subview 的坐标系
        CGPoint subPoint = [subview convertPoint:point fromView:self];
        result = [subview hitTest:subPoint withEvent:event];
        // 如果事件发生在 subView 里就返回
        if (result) {
            return result;
        }
    }
    return nil;
}




@end
