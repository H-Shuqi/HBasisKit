//
//  UINavigationController+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINavigationController (HUINavigationController_Kit) <UIGestureRecognizerDelegate>

/**
 *  设置是否支持侧滑返回
 *
 *  用户iOS7之后自定义leftBarButtonItem导致侧滑返回失效的问题
 *  不适用于未自定义leftBarButtonItem默认侧滑情况
 *
 *  @param slidingBack BOOL
 */
- (void)slidingBack:(BOOL)slidingBack;
@end
