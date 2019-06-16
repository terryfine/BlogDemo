//
//  RuntimeDemoViewController.m
//  RuntimDemo
//
//  Created by taotao on 2019/6/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import "RuntimeDemoViewController.h"
#import "RuntimClass.h"

@interface RuntimeDemoViewController ()

@end

@implementation RuntimeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"RuntimeDemo";
    self.view.backgroundColor = UIColor.purpleColor;
    RuntimClass *runtimeClass = [RuntimClass new];
    NSLog(@"%p", runtimeClass);
    NSLog(@"**********************************");
}


@end
