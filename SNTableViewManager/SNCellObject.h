//
//  BaseCellObject.h
//  SNTableManager
//
//  Created by 蒋宇 on 15/8/9.
//  Copyright (c) 2015年 Snake_Jay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SNCell;

@import UIKit;

@interface SNCellObject : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *imageUnicode;
@property (nonatomic, copy) void (^selectionHandler)(id object);
@property (nonatomic) id ext;

@property (nonatomic, weak) SNCell *cell;

@property (nonatomic) BOOL hideTopSeperator;
@property (nonatomic) BOOL hideBottomSeperator;

- (NSString *)CellIdentifier;

+ (instancetype)cellObject;
+ (instancetype)cellObjectWithTitle:(NSString *)title;

- (id)initWithTitle:(NSString *)title;
@end
