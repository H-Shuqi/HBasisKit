//
//  UIImage+Kit.m
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <HBasisKit/HUIImage+Kit.h>
#import <Accelerate/Accelerate.h>

@implementation UIImage(HUIImage_Kit)

/**
 *  根据颜色获取图片
 *
 *  @param color 传入的颜色
 *
 *  @return UIimage
 */
+ (instancetype)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 *  图片方向修正
 *
 *  @return UIImage
 */
- (UIImage *)normalizedImage {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

/**
 *  归档/本地存储
 *
 *  @param path NSString
 *  @param name NSString
 *  return BOOL
 */
- (BOOL)archiveToPath:(NSString *)path name:(NSString *)name {
    return [NSKeyedArchiver archiveRootObject:self toFile:[NSString stringWithFormat:@"%@%@",path,name]];
}

/**
 *  大小
 *
 *  @return double
 */
- (double)length {
    NSData *data = UIImageJPEGRepresentation(self, 1);
    return data.length;
}

/**
 *  压缩图片
 *
 *  @param ratio CGfloat
 *
 *  @return UIImage
 */
- (UIImage *)compressWithRatio:(CGFloat)ratio {
    NSData *data = UIImageJPEGRepresentation(self, ratio);
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

/**
 *  压缩图片
 *
 *  @return UIImage
 */
- (NSData *)compressToData {
    @autoreleasepool {
        NSData *imageWithData1 = UIImageJPEGRepresentation(self, 1);
        float imageSizeLength = imageWithData1.length / (1024*1024);
        imageWithData1 = nil;
        float ratio = 0;
        if(imageSizeLength < 1)ratio = 1;
        else ratio  =  1 / imageSizeLength;
        NSData *data = UIImageJPEGRepresentation(self, ratio);
        return data;
    }
}

/**
 *  屏幕截图
 *
 *  @return 截图图片
 */
+ (UIImage *)screenCapture {
    CGRect rx = [ UIScreen mainScreen ].bounds;
    UIGraphicsBeginImageContext(rx.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[[UIApplication sharedApplication].delegate window].rootViewController.view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

/**
 *  图片模糊
 *
 *  @param radius     CGFloat
 *  @param iterations NSUInteger
 *  @param tintColor  UIColor
 *
 *  @return UIImage
 */
- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor {
    if (floorf(self.size.width) * floorf(self.size.height) <= 0.0f) return self;
    uint32_t boxSize = (uint32_t)(radius * self.scale);
    
    if (boxSize % 2 == 0) boxSize ++;
    CGImageRef imageRef = self.CGImage;
    vImage_Buffer buffer1, buffer2;
    buffer1.width = buffer2.width = CGImageGetWidth(imageRef);
    buffer1.height = buffer2.height = CGImageGetHeight(imageRef);
    buffer1.rowBytes = buffer2.rowBytes = CGImageGetBytesPerRow(imageRef);
    size_t bytes = buffer1.rowBytes * buffer1.height;
    buffer1.data = malloc(bytes);
    buffer2.data = malloc(bytes);
    //create temp buffer
    void *tempBuffer = malloc((size_t)vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend + kvImageGetTempBufferSize));
    
    //copy image data
    CFDataRef dataSource = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
    memcpy(buffer1.data, CFDataGetBytePtr(dataSource), bytes);
    CFRelease(dataSource);
    for (NSUInteger i = 0; i < iterations; i++) {
        //perform blur
        vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, tempBuffer, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        //swap buffers
        void *temp = buffer1.data;
        buffer1.data = buffer2.data;
        buffer2.data = temp;
    }
    
    //free buffers
    free(buffer2.data);
    free(tempBuffer);
    //create image context from buffer
    CGContextRef ctx = CGBitmapContextCreate(buffer1.data, buffer1.width, buffer1.height,
                                             8, buffer1.rowBytes, CGImageGetColorSpace(imageRef),
                                             CGImageGetBitmapInfo(imageRef));
    
    //apply tint
    if (tintColor && CGColorGetAlpha(tintColor.CGColor) > 0.0f) {
        CGContextSetFillColorWithColor(ctx, [tintColor colorWithAlphaComponent:0.25].CGColor);
        CGContextSetBlendMode(ctx, kCGBlendModePlusLighter);
        CGContextFillRect(ctx, CGRectMake(0, 0, buffer1.width, buffer1.height));
    }
    
    //create image from context
    imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    CGContextRelease(ctx);
    free(buffer1.data);
    return image;
}

@end
