//
//  RuntimClass.m
//  RuntimDemo
//
//  Created by taotao on 2019/6/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import "RuntimClass.h"

@interface RuntimClass()<RuntimeClassProtocol, NSCopying, NSCoding> {
    NSArray *firstInstance;
    NSString *secondInstance;
    NSInteger thirdInstance;
}

- (void)method2;

@end

@implementation RuntimClass

- (void)method1 { NSLog(@"method1 被调用"); }
- (void)method2 { NSLog(@"method2 被调用"); }
- (void)method3 { NSLog(@"method3 被调用");}
- (void)method4WithArg1: (NSString *)arg1 arg2: (NSString *)arg2 { NSLog(@"method4 被调用"); }

+ (void)classMethod { NSLog(@"classMethod 被调用"); }

- (void)runtimeClassProtocol {
    NSLog(@"遵循协议 runtimeClassProtocol");
}


@end
