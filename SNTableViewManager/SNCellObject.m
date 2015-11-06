//
//  BaseCellObject.m
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import "SNCellObject.h"

@implementation SNCellObject
- (NSString *)CellIdentifier {
    return [NSString stringWithFormat:@"%@Identifier", NSStringFromClass([self class])];
}

+ (instancetype)cellObject {
    return [[self alloc] init];
}

+ (instancetype)cellObjectWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title];
}

- (id)initWithTitle:(NSString *)title {
    self = [super init];
    
    if (self) {
        _title = title;
    }
    
    return self;
}
@end
