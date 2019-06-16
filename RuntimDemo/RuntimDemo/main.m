//
//  main.m
//  RuntimDemo
//
//  Created by taotao on 2019/6/15.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RuntimClass.h"
#import <objc/runtime.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        RuntimClass *runtimeClass = [[RuntimClass alloc] init];
        Class cls = runtimeClass.class;
        // 类名
        const char *clsName = class_getName(cls);
        NSLog(@"类名：%s", clsName);
        NSLog(@"**********************************");
        
        // 父类
        Class superCls = class_getSuperclass(cls);
        NSLog(@"父类名：%s", class_getName(superCls));
        NSLog(@"**********************************");
        
        // 元类
        BOOL isMetaCls = class_isMetaClass(cls);
        NSLog(@"%s %@元类", clsName, (isMetaCls ? @"是" : @"不是"));
        NSLog(@"**********************************");
        
        Class metaCls = objc_getMetaClass(class_getName(cls));
        NSLog(@"%s的元类是：%s", clsName, class_getName(metaCls));
        NSLog(@"**********************************");
        
        // 变量实例大小
        size_t instanceSize = class_getInstanceSize(cls);
        NSLog(@"%s的所有实例变量大小：%zu",clsName ,instanceSize);
        NSLog(@"**********************************");
        
        // 成员变量
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(cls, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivars[i];
            NSLog(@"成员变量%s在第%d的位置", ivar_getName(ivar), i);
            NSLog(@"**********************************");
        }
        free(ivars);
        
        Ivar ivar = class_getInstanceVariable(cls, "_array");
        if (ivar != NULL) {
            const char *ivarName = ivar_getName(ivar);
            NSLog(@"成员变量：%s", ivarName);
            NSLog(@"**********************************");
        } else {
            NSLog(@"没有此成员变量");
            NSLog(@"**********************************");
        }
        
        // 属性
        objc_property_t *properties = class_copyPropertyList(cls, &outCount);
        for (int i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSLog(@"属性名称: %s", property_getName(property));
            NSLog(@"**********************************");
        }
        free(properties);
        
        objc_property_t arrayProperty = class_getProperty(cls, "array");
        if (arrayProperty != NULL) {
            const char *arryPropertyName = property_getName(arrayProperty);
            NSLog(@"属性%s", arryPropertyName);
            NSLog(@"**********************************");
        }
        
        //方法
        Method *methods = class_copyMethodList(cls, &outCount);   //包含category添加的方法
        for (int i = 0; i < outCount; i++) {
            Method method = methods[i];
            SEL methodSignature = method_getName(method);
            NSLog(@"方法签名: %s", methodSignature);
            NSLog(@"**********************************");
        }
        free(methods);
        
        Method method1 = class_getInstanceMethod(cls, @selector(method2));
        if (method1 != NULL) {
            SEL method1Signature = method_getName(method1);
            NSLog(@"方法%s",method1Signature);
            NSLog(@"**********************************");
        } else {
            NSLog(@"未找到此方法");
            NSLog(@"**********************************");
        }
        
        Method classMethod = class_getClassMethod(cls, @selector(classMethod));
        if (classMethod != NULL) {
            SEL classMethodName = method_getName(classMethod);
            NSLog(@"类方法 %s", classMethodName);
            NSLog(@"**********************************");
        }
        
        BOOL responds = class_respondsToSelector(cls, @selector(method4WithArg1:arg2:));
        if (responds) {
            Method respondsMethod = class_getInstanceMethod(cls, @selector(method4WithArg1:arg2:));
            SEL respondsMethodName = method_getName(respondsMethod);
            NSLog(@"%s响应方法%s", clsName, respondsMethodName);
            NSLog(@"**********************************");
        } else {
            NSLog(@"%s不响应此方法", clsName);
            NSLog(@"**********************************");
        }
        
        IMP imp = class_getMethodImplementation(cls, @selector(method1));
        imp();
        NSLog(@"**********************************");
        
        // 协议
        Protocol __unsafe_unretained **protocols = class_copyProtocolList(cls, &outCount);
        for (int i = 0; i < outCount; i++) {
            Protocol * protocol = protocols[i];
            const char *protocalName = protocol_getName(protocol);
            NSLog(@"协议名称：%s", protocalName);
            NSLog(@"**********************************");
        }
        Protocol * protocol = protocols[1];
        BOOL conformProtocol = class_conformsToProtocol(cls, protocol);
        NSLog(@"%s%@遵循协议%s", clsName, (conformProtocol ? @"" : @"不"), protocol_getName(protocol));
        NSLog(@"**********************************");
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
