//
//  SNTableManager.m
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import "SNTableManager.h"
#import "SNCell.h"
#import "SNCellObject.h"

@implementation SNTableManager {
    NSMutableArray *_mutableSections;
}

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    
    if (!self) {
        return nil;
    }
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    _tableView = tableView;
    
    _mutableSections = [@[] mutableCopy];
    
    return self;
}

- (NSArray *)sections {
    return _mutableSections;
}

- (void)addSection:(SNSection *)section {
    [_mutableSections addObject:section];
}

- (void)addSectionsFromArray:(NSArray *)objects {
    [_mutableSections addObjectsFromArray:objects];
}

- (void)removeAllSections {
    [_mutableSections removeAllObjects];
}

- (void)reload {
    [_tableView reloadData];
}

- (void)reloadCellObject:(SNCellObject *)cellObject {
    SNCell *cell = cellObject.cell;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if (indexPath) {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (SNSection *)sectionAtIndex:(NSInteger)index {
    if (index>=_mutableSections.count) {
        return nil;
    }
    
    return _mutableSections[index];
}

#pragma mark - UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _mutableSections.count>0?_mutableSections.count:1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_mutableSections.count == 0) {
        return 0;
    }
    return [[_mutableSections[section] rows] count];
}

- (SNCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SNCellObject *cellObject = [_mutableSections[indexPath.section] rows][indexPath.row];
    SNCell *cell = [tableView dequeueReusableCellWithIdentifier:cellObject.CellIdentifier];
    if (!cell) {
        cell = [[SNCell alloc] initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:cellObject.CellIdentifier];
    }
    
//    cell.cellObject = cellObject;
    [cell setCellObject:cellObject];
    cellObject.cell = cell;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SNCellObject *cellObject = [_mutableSections[indexPath.section] rows][indexPath.row];
    SNCell *cell = [tableView dequeueReusableCellWithIdentifier:cellObject.CellIdentifier];
    if (cell.isAutomaticDimension) {
        cell.cellObject = cellObject;
    }
    return cell.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.deselectCellWithAnimating) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    SNSection *section = _mutableSections[indexPath.section];
    id object = section.rows[indexPath.row];
    if ([object respondsToSelector:@selector(setSelectionHandler:)]) {
        SNCellObject *cellObject = (SNCellObject *)object;
        if (cellObject.selectionHandler) {
            cellObject.selectionHandler(cellObject);
        }
    }
    
    if (self.didSelectRow) {
        self.didSelectRow(indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    SNSection *section_ = [self sectionAtIndex:section];
    if (section_.sectionHeaderView) {
        return CGRectGetHeight(section_.sectionHeaderView.frame);
    }
    return .1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SNSection *section_ = [self sectionAtIndex:section];
    if (section_.sectionHeaderView) {
        return section_.sectionHeaderView;
    }
    
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.didScroll) {
        self.didScroll(scrollView);
    }
}
@end
