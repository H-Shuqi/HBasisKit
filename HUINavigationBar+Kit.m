//
//  HUINavigationBar+Kit.m
//  HBasisKit
//
//  Created by 胡舒琦 on 15/8/18.
//  Copyright (c) 2015年 hushuqi. All rights reserved.
//

#import <HBasisKit/HUINavigationBar+Kit.h>
#import <objc/runtime.h>

@implementation UINavigationBar(HUINavigationBar_Kit)
static char overlayKey;

/**
 *  设置左按钮大小
 *  @param size 按钮大小
 **/
- (void)leftItemWithViewController:(UIViewController *)viewController size:(CGSize)size{
    UIView *customView = [viewController.navigationItem.leftBarButtonItem customView];
    UIButton *leftButton = nil;
    if([self isNull:customView]){
        leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    }else{
        leftButton = (UIButton *)customView;
        leftButton.frame = CGRectMake(0, 0, size.width, size.height);
    }
}

/**
 *  设置左按钮
 *
 *  @param text 文字标题
 *  @param color 字体颜色
 *  @param font  字体
 */
- (void)leftItemWithViewController:(UIViewController *)viewController text:(NSString *)text color:(UIColor *)color font:(UIFont *)font{
    UIView *customView = [viewController.navigationItem.leftBarButtonItem customView];
    UIButton *leftButton = nil;
    if([self isNull:customView]){
        leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
        [leftButton setTitle:@"left" forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    }else{
        leftButton = (UIButton *)customView;
    }
    
    if(![self isNull:text]) [leftButton setTitle:text forState:UIControlStateNormal];
    if(![self isNull:color]) [leftButton setTitleColor:color forState:UIControlStateNormal];
    if(![self isNull:font]) leftButton.titleLabel.font = font;
    
}


/**
 *  设置左按钮
 *
 *  @param image 图标
 */
- (void)leftItemImageWithViewController:(UIViewController *)viewController image:(UIImage *)image forState:(UIControlState)forState{
    UIView *customView = [viewController.navigationItem.leftBarButtonItem customView];
    UIButton *leftButton = nil;
    if([self isNull:customView]){
        leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    }else{
        leftButton = (UIButton *)customView;
    }
    
    if(![self isNull:image]) [leftButton setBackgroundImage:image forState:forState];
}

/*
 *  设置左按钮事件
 */
- (void)leftItemWithViewController:(UIViewController *)viewController target:(id)target action:(SEL)action{
    UIView *customView = [viewController.navigationItem.leftBarButtonItem customView];
    UIButton *leftButton = nil;
    if([self isNull:customView]){
        leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    }else{
        leftButton = (UIButton *)customView;
    }
    [leftButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  获取左按钮
 *
 *  @return 左按钮UIButton
 */
- (UIButton *)leftItemButtonWithViewController:(UIViewController *)viewController{
    UIView *customView = [viewController.navigationItem.leftBarButtonItem customView];
    if([self isNull:customView])
        return (UIButton *)customView;
    else
        return nil;
}

/**
 *  设置右按钮大小
 *  @param size 按钮大小
 **/
- (void)rightItemWithViewController:(UIViewController *)viewController size:(CGSize)size{
    UIView *customView = [viewController.navigationItem.rightBarButtonItem customView];
    UIButton *rightButton = nil;
    if([self isNull:customView]){
        rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, size.width, size.height);
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }else{
        rightButton = (UIButton *)customView;
        rightButton.frame = CGRectMake(0, 0, size.width, size.height);
    }
    
}

/**
 *  设置右按钮
 *
 *  @param text 文字标题
 *  @param color 字体颜色
 *  @param font  字体
 */
- (void)rightItemWithViewController:(UIViewController *)viewController text:(NSString *)text color:(UIColor *)color font:(UIFont *)font{
    UIView *customView = [viewController.navigationItem.rightBarButtonItem customView];
    UIButton *rightButton = nil;
    if([self isNull:customView]){
        rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 50, 40);
        [rightButton setTitle:@"right" forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }else{
        rightButton = (UIButton *)customView;
    }
    
    if(![self isNull:text]) [rightButton setTitle:text forState:UIControlStateNormal];
    if(![self isNull:color]) [rightButton setTitleColor:color forState:UIControlStateNormal];
    if(![self isNull:font]) rightButton.titleLabel.font = font;
}

/**
 *  设置右按钮
 *
 *  @param image 图标
 */
- (void)rightItemImageWithViewController:(UIViewController *)viewController image:(UIImage *)image forState:(UIControlState)forState{
    UIView *customView = [viewController.navigationItem.rightBarButtonItem customView];
    UIButton *rightButton = nil;
    if([self isNull:customView]){
        rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 50, 40);
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }else{
        rightButton = (UIButton *)customView;
    }
    
    if(![self isNull:image]) [rightButton setBackgroundImage:image forState:forState];
}

/*
 *  设置右按钮事件
 */
- (void)rightItemWithViewController:(UIViewController *)viewController target:(id)target action:(SEL)action{
    UIView *customView = [viewController.navigationItem.rightBarButtonItem customView];
    UIButton *rightButton = nil;
    if([self isNull:customView]){
        rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.frame = CGRectMake(0, 0, 50, 40);
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    }else{
        rightButton = (UIButton *)customView;
    }
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  获取右按钮
 *
 *  @return 右按钮UIButton
 */
- (UIButton *)rightItemButtonWithViewController:(UIViewController *)viewController{
    UIView *customView = [viewController.navigationItem.rightBarButtonItem customView];
    if(![self isNull:customView])
        return (UIButton *)customView;
    else
        return nil;
}

/**
 *  设置标题
 *
 *  @param title 标题文字
 *  @param color 标题颜色
 *  @param font  标题字体
 */
- (void)navigationTitle:(UIViewController *)viewController title:(NSString *)title color:(UIColor *)color font:(UIFont *)font{
    if(![self isNull:title]){
        viewController.navigationItem.title = title;
    }
    
    if(![self isNull:color])
        [self setTitleTextAttributes:[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName]];
    
    if(![self isNull:font])
        [self setTitleTextAttributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName]];
}

/**
 *  设置导航条背景图片
 *
 *  @param image 图片
 */
- (void)navigationBackgroundImage:(UIImage *)image{
    if([self isNull:image])
        [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

/**
 *  设置导航条背景颜色
 *
 *  @param color 颜色
 */
- (void)navigationBackgroundColor:(UIColor *)color{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = color;
}

/**
 *  导航条的透明度
 *
 *  @param alpha 透明数值
 */
- (void)navigationAlpha:(CGFloat)alpha{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    UIColor *color = self.overlay.backgroundColor;
    
    CGFloat R, G, B;
    CGColorRef cgColor = [color CGColor];
    int numComponents = CGColorGetNumberOfComponents(cgColor);
    if (numComponents == 4){
        const CGFloat *components = CGColorGetComponents(cgColor);
        R = components[0];
        G = components[1];
        B = components[2];
    }
    UIColor *tempColor = [UIColor colorWithRed:R green:G blue:B alpha:alpha];
    self.overlay.backgroundColor = tempColor;
}

/**
 *  隐藏导航条黑线
 */
- (void)navigationBlackLineHide {
    self.clipsToBounds = YES;
}

/**
 *  显示导航条黑线
 */
- (void)navigationBlackLineShow {
    self.clipsToBounds = NO;
}


/**
 *  导航条上下移动
 *
 *  @param blurred 模糊数值
 */
- (void)navigationTranslationY:(CGFloat)translationY{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)reset{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}

- (UIView *)overlay{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isNull:(NSObject *)obj{
    return (obj == NULL || obj == nil || [obj isKindOfClass:[NSNull class]]);
}

- (UIImage*)createImageWithColor: (UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
