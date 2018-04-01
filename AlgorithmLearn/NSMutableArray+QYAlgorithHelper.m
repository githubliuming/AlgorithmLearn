//
//  NSMutableArray+QYAlgorithHelper.m
//  AlgorithmLearn
//
//  Created by 明刘 on 2018/4/1.
//  Copyright © 2018年 QYBC. All rights reserved.
//

#import "NSMutableArray+QYAlgorithHelper.h"

@implementation NSMutableArray (QYAlgorithHelper)

#pragma mark -选择排序
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
#pragma mark - 插入排序
/**
 插入排序
 @param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)insertSortWithsortBlock:(BOOL (^)(id obj1 , id obj2) )sortBlock
{
    [self insertSortStart:0 length:self.count sortBlockHandler:sortBlock];
}
//部分插入排序
- (void)insertSortStart:(NSInteger)index
                 length:(NSInteger)length
       sortBlockHandler:(BOOL (^)(id obj1 , id obj2) )sortBlock
{
    NSAssert(index + length <= self.count, @"排序长度超出数组总长度");
    [[self class] assetSortBlock:sortBlock];
    NSInteger end = index +length;
    for (NSInteger i =index + 1 ; i <end ;i++)
    {
        id tmp = self[i];
        NSInteger j;
        for ( j= i; j > index && sortBlock(tmp,self[j -1]); j--)
        {
            self[j] = self[j - 1];
        }
        self[j] = tmp;
    }
}
#pragma mark 冒泡排序
//冒泡排序
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
#pragma mark -	并归排序法
- (void)megerSortWitBlock:(BOOL (^)(id obj1 , id obj2) )sortBlock
{
    [self megerSortWithStart:0
                    endIndex:self.count-1
                       block:sortBlock];
}
- (void)megerSortWithStart:(NSInteger)startIndex endIndex:(NSInteger)endIndex block:(BOOL (^)(id obj1 , id obj2) )sortBlock
{
    if (startIndex >= endIndex) {
        return;
    }
    NSInteger mid = (startIndex + endIndex)/2;
    //将数组左边划分成两个小数组
    [self megerSortWithStart:startIndex
                    endIndex:mid
                       block:sortBlock];
    //讲数组右边划分成两个小数组
    [self megerSortWithStart:mid+1
                    endIndex:endIndex
                       block:sortBlock];
    //并归 左右两个小数组
    if (self[mid] > self[mid + 1])
    {
        [self megerStartIndex:startIndex
                     midIndex:mid
                     endIndex:endIndex
                    sortBlock:sortBlock];
    }

    
    
}
-(void)megerStartIndex:(NSInteger)startIndex
              midIndex:(NSInteger)midIndex
              endIndex:(NSInteger)endIndex
             sortBlock:(BOOL (^)(id obj1 , id obj2))sortBlock
{
    NSMutableArray * tmp = [[NSMutableArray alloc] initWithCapacity:endIndex -startIndex +1];
    for (NSInteger i = startIndex; i <= endIndex; i ++) {
        
        tmp[i - startIndex] = self[i];
    }
    NSInteger i = startIndex, j = midIndex + 1;
    for (NSInteger k = startIndex ; k <=endIndex; k++){
        if (i > midIndex) {
            self[k] = tmp[j - startIndex];
            j++;
        } else if (j > endIndex){
            self[k] = tmp[i-startIndex];
            i++;
        } else if (sortBlock(tmp[i -startIndex],tmp[j - startIndex])){
            self[k] =tmp[i -startIndex];
            i ++;
        } else{
            self[k] = tmp[j - startIndex];
            j++;
        }
    }
}
#pragma mark - 辅助方法
/**
 交换数组中的两个元素的位置

 @param array 交换数组
 @param index 第一个元素的索引
 @param otherIndex 第二个元素的索引
 */
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
