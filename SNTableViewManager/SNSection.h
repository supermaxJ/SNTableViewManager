//
//  SNSection.h
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNCellObject.h"

@interface SNSection : NSObject
@property (nonatomic, strong) NSArray *rows;
@property (nonatomic, strong) UIView *sectionHeaderView;

+ (instancetype)section;
- (void)addCellObject:(SNCellObject *)cellObejct;
- (void)addCellObjectsFromArray:(NSArray *)objects;
- (void)insertCellObject:(SNCellObject *)cellObject atIndex:(NSUInteger)index;
- (NSInteger)indexOfCellObject:(SNCellObject *)cellObject;

- (void)removeAllCells;
@end
