//
//  SettingItem.h
//  Test
//
//  Created by admin on 16/4/18.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SettingItem : NSObject

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *imageIcon;
@property (assign, nonatomic) UITableViewCellAccessoryType accessoryType;
@property (assign, nonatomic) UIEdgeInsets separatorInset;

@property (assign, nonatomic) CGFloat itemHeight; //default is 44

@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *backgroundColor;

@property (assign, nonatomic) BOOL canSelectCell;

@property (copy, nonatomic) UIView *(^customAccessoryView)();

@property (copy, nonatomic) void(^handleCallback)();

+ (instancetype)itemBlankWithBackColor:(UIColor *)color;

+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(UIImage *)image;

+ (instancetype)itemWithTitle:(NSString *)title
                         icon:(UIImage *)image
                        block:(void(^)())handle;

- (instancetype)initWithTitle:(NSString *)title
                         icon:(UIImage *)image
                        block:(void(^)())handle;
@end
