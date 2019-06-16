//
//  RuntimClass.h
//  RuntimDemo
//
//  Created by taotao on 2019/6/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RuntimeClassProtocol <NSObject>

- (void)runtimeClassProtocol;

@end

@interface RuntimClass : NSObject

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy)  NSString *string;
@property (nonatomic, assign) NSInteger index;

- (void)method1;
- (void)method4WithArg1: (NSString *)arg1 arg2: (NSString *)arg2;

@end

NS_ASSUME_NONNULL_END
