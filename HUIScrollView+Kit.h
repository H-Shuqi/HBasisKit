//
//  UIScrollView+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIScrollView(HUIScrollView_Kit)

/**
 *  当前页数
 *
 *  @return int
 */
- (int)currentPage;

/**
 *  横向滚动到page页
 *
 *  @param page     NSUInteger
 *  @param animated BOOL
 */
- (void)scrollToPage:(NSUInteger)page animated:(BOOL)animated;

@end
