//
//  UIScrollView+Kit.m
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <HBasisKit/HUIScrollView+Kit.h>

@implementation UIScrollView(HUIScrollView_Kit)

/**
 *  当前页数
 *
 *  @return int
 */
- (int)currentPage {
    return floor((self.contentOffset.x - self.frame.size.width / 2) /  self.frame.size.width) + 1;
}

/**
 *  横向滚动到page页
 *
 *  @param page     NSUInteger
 *  @param animated BOOL
 */
- (void)scrollToPage:(NSUInteger)page animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(self.bounds.size.width*page, 0) animated:animated];
}

@end
