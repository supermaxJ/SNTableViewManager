//
//  BaseCell.h
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNCellObject.h"
@interface SNCell : UITableViewCell

@property (nonatomic, strong, readwrite) SNCellObject *cellObject;

- (CGFloat)cellHeight;
- (BOOL)isAutomaticDimension;
- (void)configWithCellObject:(SNCellObject *)cellObject;
@end
