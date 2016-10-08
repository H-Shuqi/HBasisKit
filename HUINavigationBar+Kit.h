//
//  HUINavigationBar+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 15/8/18.
//  Copyright (c) 2015年 hushuqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINavigationBar(HUINavigationBar_Kit)

/**
 *  设置左按钮大小
 *  @param size 按钮大小
 **/
- (void)leftItemWithViewController:(UIViewController *)viewController size:(CGSize)size;

/**
 *  设置左按钮文本
 *
 *  @param text 文字标题
 *  @param color 字体颜色
 *  @param font  字体
 */
- (void)leftItemWithViewController:(UIViewController *)viewController text:(NSString *)text color:(UIColor *)color font:(UIFont *)font;


/**
 *  设置左按钮图标
 *
 *  @param image 图标
 */
- (void)leftItemImageWithViewController:(UIViewController *)viewController image:(UIImage *)image forState:(UIControlState)forState;

/*
 *  设置左按钮事件
 */
- (void)leftItemWithViewController:(UIViewController *)viewController target:(id)target action:(SEL)action;

/**
 *  获取左按钮
 *
 *  @return 左按钮UIButton
 */
- (UIButton *)leftItemButtonWithViewController:(UIViewController *)viewController;

/**
 *  设置右按钮大小
 *  @param size 按钮大小
 **/
- (void)rightItemWithViewController:(UIViewController *)viewController size:(CGSize)size;

/**
 *  设置右按钮文本
 *
 *  @param text 文字标题
 *  @param color 字体颜色
 *  @param font  字体
 */
- (void)rightItemWithViewController:(UIViewController *)viewController text:(NSString *)text color:(UIColor *)color font:(UIFont *)font;

/**
 *  设置右按钮图标
 *
 *  @param image 图标
 */
- (void)rightItemImageWithViewController:(UIViewController *)viewController image:(UIImage *)image forState:(UIControlState)forState;

/*
 *  设置右按钮事件
 */
- (void)rightItemWithViewController:(UIViewController *)viewController target:(id)target action:(SEL)action;

/**
 *  获取右按钮
 *
 *  @return 右按钮UIButton
 */
- (UIButton *)rightItemButtonWithViewController:(UIViewController *)viewController;

/**
 *  设置标题文本
 *
 *  @param title 标题文字
 *  @param color 标题颜色
 *  @param font  标题字体
 */
- (void)navigationTitle:(UIViewController *)viewController title:(NSString *)title color:(UIColor *)color font:(UIFont *)font;

/**
 *  设置导航条背景图片
 *
 *  @param image 图片
 */
- (void)navigationBackgroundImage:(UIImage *)image;

/**
 *  设置导航条背景颜色
 *
 *  @param color 颜色
 */
- (void)navigationBackgroundColor:(UIColor *)color;

/**
 *  导航条的透明度
 *
 *  @param alpha 透明数值
 */
- (void)navigationAlpha:(CGFloat)alpha;

/**
 *  导航条黑线设置
 */
- (void)navigationBlackLineHide;

/**
 *  显示导航条黑线
 */
- (void)navigationBlackLineShow;

/**
 *  导航条上下移动
 *
 *  @param blurred 模糊数值
 */
- (void)navigationTranslationY:(CGFloat)translationY;

/*
 *  释放设置
 */
- (void)reset;

@end
