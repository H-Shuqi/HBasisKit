//
//  HNSDictionary+Kit.m
//  HBasisKit
//
//  Created by 胡舒琦 on 16/5/10.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <HBasisKit/HNSDictionary+Kit.h>

@implementation NSDictionary(HNSDictionary_Kit)

- (NSString *)string4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return @"";
    }else{
        NSString *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]]) {
            value = @"";
        }
        return value;
    }
}

- (NSString *)stringIncludeNull4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return nil;
    }else{
        NSString *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]]) {
            value = nil;
        }
        return value;
    }
}

- (NSString *)string4Key:(NSString *)key defalut:(NSString *)defalut {
    NSString *string = [self string4Key:key];
    if (!string || [string isKindOfClass:[NSNull class]] || [@"" isEqualToString:string]) {
        string = defalut;
    }
    return string;
}

- (int)int4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return -105689;
    }else{
        NSNumber *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSNumber class]]) {
            value = @-105689;
        }
        return [value intValue];
    }
}

- (NSInteger)integer4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return -105689;
    }else{
        NSNumber *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSNumber class]]) {
            value = @-105689;
        }
        return [value integerValue];
    }
}

- (CGFloat)float4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return -105689;
    }else{
        NSNumber *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSNumber class]]) {
            value = @-105689;
        }
        return [value floatValue];
    }
}

- (double)double4Key:(NSString *)key {
    return [self float4Key:key];
}

- (BOOL)bool4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return NO;
    }else{
        NSNumber *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSNumber class]]) {
            value = @NO;
        }
        return [value boolValue];
    }
}

- (NSArray *)array4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return [NSArray array];
    }else{
        NSArray *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSArray class]]) {
            value = [NSArray array];
        }
        return value;
    }
}

- (NSDictionary *)dictionary4Key:(NSString *)key {
    if (!self || [self isKindOfClass:[NSNull class]] || ![self isKindOfClass:[NSDictionary class]] || ((NSDictionary *)self).count == 0) {
        return [NSDictionary dictionary];
    }else{
        NSDictionary *value = [self valueForKey:key];
        if (!value || [value isKindOfClass:[NSNull class]] || ![value isKindOfClass:[NSDictionary class]]) {
            value = [NSDictionary dictionary];
        }
        return value;
    }
}

@end
