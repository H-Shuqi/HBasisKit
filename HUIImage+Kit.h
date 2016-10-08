//
//  UIImage+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(HUIImage_Kit)

/**
 *  根据颜色获取图片
 *
 *  @param color 传入的颜色
 *
 *  @return UIimage
 */
+ (instancetype)imageWithColor:(UIColor *)color;

/**
 *  图片方向修正
 *
 *  @return UIImage
 */
- (UIImage *)normalizedImage;

/**
 *  归档/本地存储
 *
 *  @param path NSString
 *  @param name NSString
 *  return BOOL
 */
- (BOOL)archiveToPath:(NSString *)path name:(NSString *)name;

/**
 *  大小
 *
 *  @return double
 */
- (double)length;

/**
 *  压缩图片
 *
 *  @param ratio CGfloat
 *
 *  @return UIImage
 */
- (UIImage *)compressWithRatio:(CGFloat)ratio;

/**
 *  压缩图片
 *
 *  @return UIImage
 */
- (NSData *)compressToData;

/**
 *  屏幕截图
 *
 *  @return 截图图片
 */
+ (UIImage *)screenCapture;

/**
 *  图片模糊
 *
 *  @param radius     CGFloat
 *  @param iterations NSUInteger
 *  @param tintColor  UIColor
 *
 *  @return UIImage
 */
- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;

@end
