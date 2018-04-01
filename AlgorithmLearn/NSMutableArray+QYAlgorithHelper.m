//
//  NSMutableArray+QYAlgorithHelper.m
//  AlgorithmLearn
//
//  Created by 明刘 on 2018/4/1.
//  Copyright © 2018年 QYBC. All rights reserved.
//

#import "NSMutableArray+QYAlgorithHelper.h"

@implementation NSMutableArray (QYAlgorithHelper)

/**
 数组选择排序
 @param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)selectSortWithsortBlock:(BOOL(^)(id obj1,id obj2void)) sortBlock
{
    [[self class] assetSortBlock:sortBlock];
    NSInteger count = self.count;
    for (NSInteger i =0; i < count; i ++)
    {
        NSInteger flagIndex = i;
        for (NSInteger j =i+1; j <count; j++)
        {
            if (!sortBlock(self[flagIndex],self[j]))
            {
                flagIndex = j;
            }
        }
        [[self class] swapArray:self index:i otherIndex:flagIndex];
    }
}

/**
 插入排序
 @param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)insertSortWithsortBlock:(BOOL (^)(id obj1 , id obj2) )sortBlock
{
    [[self class] assetSortBlock:sortBlock];
    NSInteger count = self.count;
    for (NSInteger i =1 ; i < count ;i++)
    {
        id tmp = self[i];
        NSInteger j;
        for ( j= i; j >0 && sortBlock(tmp,self[j -1]); j--)
        {
            self[j] = self[j - 1];
        }
        self[j] = tmp;
    }
}
- (void)bubbleSortWithSortBlock:(BOOL (^)(id obj1 , id obj2) )sortBlock{
    
    [[self class] assetSortBlock:sortBlock];
    NSInteger count = self.count;
    for (NSInteger i = 0 ; i < count ; i ++ ) {
        for (NSInteger j = i ; j<count; j ++) {
            if (sortBlock(self[j],self[i])) {
                [[self class] swapArray:self index:i otherIndex:j];
            }
        }
    }
}

+ (void)swapArray:(NSMutableArray *)array
            index:(NSInteger)index
       otherIndex:(NSInteger) otherIndex{
    id temp = array[index];
    array[index] = array[otherIndex];
    array[otherIndex] = temp;
}

+ (void)assetSortBlock:(BOOL(^)(id obj1,id obj2)) sortBlock
{
    NSAssert(sortBlock, @"排序block不能为空");
}

- (void)printArray{
    
    for (id num  in self)
    {
        NSLog(@"%@",[num description]);
    }
}

@end
