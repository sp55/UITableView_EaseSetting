//
//  SettingItem.m
//  Test
//
//  Created by admin on 16/4/18.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem

+ (instancetype) itemWithTitle:(NSString *)title
                          icon:(UIImage *)image{
    return [SettingItem itemWithTitle:title icon:image block:nil];
}

+ (instancetype) itemWithTitle:(NSString *)title
                          icon:(UIImage *)image
                         block:(void(^)())handle{
    SettingItem *item = [[self alloc] initWithTitle:title icon:image block:handle];
    return item;
}

- (instancetype)initWithTitle:(NSString *)title
                         icon:(UIImage *)image
                        block:(void(^)())handle{
    if (self = [super init]) {
        self.title = title;
        self.imageIcon = image;
        self.handleCallback = handle;
        self.itemHeight = 44;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
        self.canSelectCell = YES;
    }
    return self;
}


+ (instancetype)itemBlankWithBackColor:(UIColor *)color{
    SettingItem *item = [[self alloc] initWithTitle:@"" icon:nil block:nil];
    item.backgroundColor = color;
    item.itemHeight = 20;
    item.accessoryType = UITableViewCellAccessoryNone;
    item.separatorInset = UIEdgeInsetsZero;
    item.canSelectCell = NO;
    return item;
}


@end
