//
//  TestCell.m
//  SNTableViewManagerDemo
//
//  Created by 蒋宇 on 15/11/6.
//  Copyright © 2015年 Snake_Jay. All rights reserved.
//

#import "TestCell.h"
#import "TestCellObject.h"

@interface TestCell ()
@property (weak, nonatomic) IBOutlet UILabel *ibTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ibSubtitleLabel;

@property (nonatomic, strong) TestCellObject *cellObject;
@end

@implementation TestCell
@dynamic cellObject;

- (void)configWithCellObject:(TestCellObject *)cellObject {
    self.ibTitleLabel.text = cellObject.title;
    self.ibSubtitleLabel.text = cellObject.subtitle;
}
@end
