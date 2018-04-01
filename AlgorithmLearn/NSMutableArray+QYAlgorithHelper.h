//
//  NSMutableArray+QYAlgorithHelper.h
//  AlgorithmLearn
//
//  Created by 明刘 on 2018/4/1.
//  Copyright © 2018年 QYBC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray<ObjectType> (QYAlgorithHelper)

/**
 数组选择排序
 @param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)selectSortWithsortBlock:(BOOL(^)(ObjectType obj1,ObjectType obj2)) sortBlock;

/**
 插入排序
 @param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)insertSortWithsortBlock:(BOOL (^)(ObjectType obj1 , ObjectType obj2) )sortBlock;


/**
数组中部分区间进行 插入排序

 @param index 起始位置
 @param length 长度
  @param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)insertSortStart:(NSInteger)index
                 length:(NSInteger)length
       sortBlockHandler:(BOOL (^)(ObjectType obj1 , ObjectType obj2) )sortBlock;

/**
 冒泡排序
 
 @param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)bubbleSortWithSortBlock:(BOOL (^)(ObjectType obj1 , ObjectType obj2) )sortBlock;

/**
 并归排序

@param sortBlock 排序条件block  返回 YES 从小到大排序 返回NO 从小到大排序
 */
- (void)megerSortWitBlock:(BOOL (^)(ObjectType obj1 , ObjectType obj2) )sortBlock;

//输出数组元素
- (void)printArray;

@end
