//
//  SNSection.m
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import "SNSection.h"

@implementation SNSection {
    NSMutableArray *_mutableRows;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initialDefault];
    }
    
    return self;
}

- (NSArray *)rows {
    return [_mutableRows copy];
}

- (void)initialDefault {
    _mutableRows = [@[] mutableCopy];
}

+ (instancetype)section {
    return [[self alloc] init];
}

- (void)addCellObject:(SNCellObject *)cellObejct {
    [_mutableRows addObject:cellObejct];
}

- (void)addCellObjectsFromArray:(NSArray *)objects {
    [_mutableRows addObjectsFromArray:objects];
}

- (void)insertCellObject:(SNCellObject *)cellObject atIndex:(NSUInteger)index {
    [_mutableRows insertObject:cellObject atIndex:index];
}

- (NSInteger)indexOfCellObject:(SNCellObject *)cellObject {
    return [_mutableRows indexOfObject:cellObject];
}

- (void)removeAllCells {
    [_mutableRows removeAllObjects];
}
@end
