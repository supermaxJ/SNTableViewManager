//
//  SNTableManager.h
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "SNSection.h"

typedef void(^didSelectRow)(NSIndexPath *indexPath);
typedef void(^didScroll)(UIScrollView *scroll);

@interface SNTableManager : NSObject <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, copy) didSelectRow didSelectRow;
@property (nonatomic, copy) didScroll didScroll;

@property (nonatomic) BOOL deselectCellWithAnimating;

- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)addSection:(SNSection *)section;
- (void)addSectionsFromArray:(NSArray *)section;
- (void)removeAllSections;
- (void)reload;

- (void)reloadCellObject:(SNCellObject *)cellObject;

- (SNSection *)sectionAtIndex:(NSInteger)index;
@end
