//
//  customerTabBarTests.m
//  customerTabBarTests
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HBX_CustomTabBar.h"

@interface customerTabBarTests : XCTestCase

@end

@implementation customerTabBarTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testDemo {
    
    HBX_CustomTabBar *a = [[HBX_CustomTabBar alloc] init];
    
    [a setupUI];
   
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
