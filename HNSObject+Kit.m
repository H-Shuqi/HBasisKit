//
//  HNSObject+Kit.m
//  HBasisKit
//
//  Created by 胡舒琦 on 16/5/10.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <HBasisKit/HNSObject+Kit.h>

@implementation NSObject(HNSObject_Kit)

+ (BOOL)isNull:(id)obj {
    return obj && ![obj isKindOfClass:[NSNull class]];
}

@end
