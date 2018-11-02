//
//  UIViewController+Extension.m
//  TemplateApp
//
//  Created by bux on 2018/10/31.
//  Copyright © 2018 James. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>

@implementation UIViewController (Extension)


/**
 添加log，打印当前vc
 */
-(void)swizzled_viewDidAppear:(BOOL)animated
{
    NSLog(@"Current ViewController Class: %@", NSStringFromClass(self.class));
    [self swizzled_viewDidAppear:animated];
}
+ (void)load
{
    Method original, swizzled;
    original = class_getInstanceMethod(self, @selector(viewDidAppear:));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_viewDidAppear:));
    method_exchangeImplementations(original, swizzled);
}

@end
