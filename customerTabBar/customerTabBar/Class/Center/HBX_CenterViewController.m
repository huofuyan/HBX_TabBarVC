//
//  HBX_CenterViewController.m
//  customerTabBar
//
//  Created by apple on 2017/10/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HBX_CenterViewController.h"

@interface HBX_CenterViewController ()

@end

@implementation HBX_CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
//    self.tabBarItem.title = nil;
//    
//    self.tabBarItem.image = [UIImage imageNamed:@"tabbar_Assistant_selected"];
    
    
    
}


- (BOOL):(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
