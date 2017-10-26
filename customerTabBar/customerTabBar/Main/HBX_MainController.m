//
//  HBX_MainController.m
//  customerTabBar
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBX_MainController.h"
#import "HBX_NavigationViewController.h"

#import "HBX_CustomTabBar.h"

@interface HBX_MainController ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation HBX_MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.delegate = self;
    
    [self addChildVIewControllers];
    
    [self setValue:[[HBX_CustomTabBar alloc] init] forKey:@"tabBar"];
    
}

//添加控制器
- (void)addChildVIewControllers {
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    [arrayM addObject:[self viewControllerWithClsName:@"HBX_HomeViewController" title:@"首页" imgName:@"tab_icon_home_pressed"]];
    
    [arrayM addObject:[self viewControllerWithClsName:@"HBX_MineViewController" title:@"我的" imgName:@"tab_icon_me_pressed"]];
    
    
    [arrayM addObject:[self viewControllerWithClsName:@"HBX_MoreViewController" title:@"更多" imgName:@"tab_icon_more_pressed"]];
     [arrayM addObject:[self viewControllerWithClsName:@"HBX_MoreViewController" title:@"更多" imgName:@"tab_icon_more_pressed"]];
    
    self.viewControllers = [arrayM copy];
    
}

- (UIViewController *)viewControllerWithClsName:(NSString *)clsName title:(NSString *)title imgName:(NSString *)imgName{
    
    Class cls = NSClassFromString(clsName);
    
    UIViewController *vc = [[cls alloc] init];
    
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    
    vc.title = title;
    
    vc.tabBarItem.selectedImage = [UIImage imageNamed:imgName];
    HBX_NavigationViewController *nav = [[HBX_NavigationViewController alloc] initWithRootViewController:vc];
    
    return nav;
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    [item setBadgeValue:@"2"];
    
    NSLog(@"tag----%ld",(long)item.tag);
    
//
//    for (NSObject *i  in item) {
//
//    }
    
    NSLog(@"item....%@",item.title);
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSLog(@"CurrentVC----%@",viewController);
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}



@end
