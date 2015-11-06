//
//  FirstViewController.m
//  SNTableViewManagerDemo
//
//  Created by 蒋宇 on 15/11/6.
//  Copyright © 2015年 Snake_Jay. All rights reserved.
//

#import "FirstViewController.h"
#import "SNTableManager.h"
#import "SNSection.h"
#import "TestCellObject.h"

@interface FirstViewController ()
@property (nonatomic, strong) SNTableManager *tableManager;
@property (weak, nonatomic) IBOutlet UITableView *ibTableView;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ibTableView.estimatedRowHeight = 60.f;
    self.ibTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self configDatasource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configDatasource {
    SNSection *section = [SNSection section];
    [self.tableManager addSection:section];
    
    for (int i=0; i<30; i++) {
        TestCellObject *cellObject = [TestCellObject cellObject];
        cellObject.title = [NSString stringWithFormat:@"Test %d", i];
        NSMutableString *mutableString = @"".mutableCopy;
        for (int j=0; j<i; j++) {
            [mutableString appendString:@"Test"];
        }
        cellObject.subtitle = mutableString.copy;
        [section addCellObject:cellObject];
    }
    
    [self.tableManager reload];
}

#pragma mark - getter & setter
- (SNTableManager *)tableManager {
    if (!_tableManager) {
        _tableManager = [[SNTableManager alloc] initWithTableView:self.ibTableView];
    }
    
    return _tableManager;
}
@end
