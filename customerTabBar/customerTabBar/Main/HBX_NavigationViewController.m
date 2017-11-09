//
//  HBX_NavigationViewController.m
//  customerTabBar
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBX_NavigationViewController.h"

@interface HBX_NavigationViewController ()

@end

@implementation HBX_NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
  
    
    if ([viewController isKindOfClass:NSClassFromString(@"TwoViewController")]) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
      [super pushViewController:viewController animated:animated];
    
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
