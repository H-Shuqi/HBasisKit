//
//  NSArray+Kit.m
//  HBasisKit
//
//  Created by 胡舒琦 on 16/4/14.
//  Copyright © 2016年 胡舒琦. All rights reserved.
//

#import <HBasisKit/HNSMutableArray+Kit.h>

@implementation NSMutableArray (HNSMutableArray_Kit)

/**
 * 乱序
 */
- (NSMutableArray *)disorderly {
    if(self.count == 0)return self;
    NSMutableArray *tempArray = [NSMutableArray array];
    NSInteger cbRandCount = 0,cbPosition = 0,count = self.count;
    do {
        cbPosition = arc4random() % (count - cbRandCount);
        [tempArray addObject:self[cbPosition]];
        [self removeObjectAtIndex:cbPosition];
    }while (++ cbRandCount < count);
    return tempArray;
}

@end
