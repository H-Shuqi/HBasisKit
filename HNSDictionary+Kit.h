//
//  HNSDictionary+Kit.h
//  HBasisKit
//
//  Created by 胡舒琦 on 16/5/10.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary(HNSDictionary_Kit)

- (NSString *)string4Key:(NSString *)key;

- (NSString *)stringIncludeNull4Key:(NSString *)key;

- (NSString *)string4Key:(NSString *)key defalut:(NSString *)defalut;

- (int)int4Key:(NSString *)key;

- (NSInteger)integer4Key:(NSString *)key;

- (CGFloat)float4Key:(NSString *)key;

- (double)double4Key:(NSString *)key;

- (BOOL)bool4Key:(NSString *)key;

- (NSArray *)array4Key:(NSString *)key;

- (NSDictionary *)dictionary4Key:(NSString *)key;

@end
