//
//  UIFont+runtime.m
//  UIFont+runtime
//
//  Created by 李树华 on 2019/9/17.
//  Copyright © 2019 李树华. All rights reserved.
//

#import "UIFont+runtime.h"
#import <objc/runtime.h>

@implementation UIFont (runtime)

+ (void)load{
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
     // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
    
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"ivar(%d) : %@", i, [NSString stringWithUTF8String:ivarName]);
    }
    free(ivarList);
}
+ (UIFont *)adjustFont:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize*[UIScreen mainScreen].bounds.size.width/375.0];
    return newFont;
}

@end
