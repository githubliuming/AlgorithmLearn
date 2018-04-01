//
//  ViewController.m
//  AlgorithmLearn
//
//  Created by 明刘 on 2018/4/1.
//  Copyright © 2018年 QYBC. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+QYAlgorithHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray<NSNumber *> * array = [@[@5,@6,@2,@3,@1,@7,@29,@8] mutableCopy];
//    [array selectSortWithsortBlock:^BOOL(NSNumber *obj1, NSNumber *obj2) {
//        return obj1.integerValue <= obj2.integerValue;
//    }];
    
//    [array insertSortWithsortBlock:^BOOL(NSNumber *obj1, NSNumber *obj2) {
//        return obj1.integerValue <= obj2.integerValue;
//    }];
    
//    [array bubbleSortWithSortBlock:^BOOL(NSNumber *obj1, NSNumber *obj2) {
//        return obj1.integerValue <= obj2.integerValue;
//    }];
    [array megerSortWitBlock:^BOOL(NSNumber *obj1, NSNumber *obj2) {
        return obj1.integerValue <= obj2.integerValue;
    }];
    [array printArray];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
