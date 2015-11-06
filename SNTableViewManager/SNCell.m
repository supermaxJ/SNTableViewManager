//
//  BaseCell.m
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import "SNCell.h"
@implementation SNCell

- (CGFloat)cellHeight {
    return UITableViewAutomaticDimension;
}

- (BOOL)isAutomaticDimension {
    return NO;
}

- (void)configWithCellObject:(SNCellObject *)cellObject {
    
}

- (void)setCellObject:(SNCellObject *)cellObject {
    _cellObject = cellObject;
    [self configWithCellObject:_cellObject];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

@end
