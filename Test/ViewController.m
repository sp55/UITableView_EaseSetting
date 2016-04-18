//
//  ViewController.m
//  Test
//
//  Created by admin on 16/4/18.
//  Copyright © 2016年 AlezJi. All rights reserved.
//
//http://www.jianshu.com/p/30cbd2233c17
//打造一个直观复用的iOS设置菜单页



#import "ViewController.h"
#import "SettingItem.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *settingItems;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView =[[UIView alloc]init];
    [self.view addSubview:self.tableView];
    
    SettingItem *item1 = [SettingItem itemWithTitle:@"菜单1" icon:[UIImage imageNamed:@"Carrot"]];
    [item1 setHandleCallback:^{
        NSLog(@"点击菜单1");
    }];
    
    SettingItem *item2 = [SettingItem itemWithTitle:@"菜单2" icon:[UIImage imageNamed:@"Owl"]];
    item2.separatorInset = UIEdgeInsetsZero;
    [item2 setHandleCallback:^{
        NSLog(@"点击菜单2");
    }];
    
    SettingItem *item3 = [SettingItem itemWithTitle:@"菜单3" icon:[UIImage imageNamed:@"Rubber-Duck"]];
    item3.separatorInset = UIEdgeInsetsZero;
    item3.canSelectCell = NO;
    [item3 setCustomAccessoryView:^UIView *{
        UISwitch *someSwitch = [[UISwitch alloc] init];
        
        return someSwitch;
    }];
    [item3 setHandleCallback:^{
        NSLog(@"点击菜单3");
    }];
    
    SettingItem *item4 = [SettingItem itemWithTitle:@"菜单4" icon:[UIImage imageNamed:@"Snowman"]];
    [item4 setHandleCallback:^{
        NSLog(@"点击菜单4");
    }];
    
    SettingItem *blankItem = [SettingItem itemBlankWithBackColor:[UIColor groupTableViewBackgroundColor]];
    
    self.settingItems = @[item1, item2, blankItem, item3, blankItem, item4];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.settingItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingItem *item = self.settingItems[indexPath.row];
    return item.itemHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celll"];
    
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celll"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    SettingItem *item = self.settingItems[indexPath.row];
    cell.textLabel.text = item.title;
    
    cell.imageView.image = item.imageIcon;
    cell.accessoryType = item.accessoryType;
    
    cell.separatorInset = item.separatorInset;
    
    if (item.customAccessoryView) {
        cell.accessoryView = item.customAccessoryView();
    }else{
        cell.accessoryView = nil;
    }
    
    if (item.backgroundColor) {
        cell.contentView.backgroundColor = item.backgroundColor;
    }else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    if (item.textColor) {
        cell.textLabel.textColor = item.textColor;
    }else{
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    cell.userInteractionEnabled = item.canSelectCell;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SettingItem *item = self.settingItems[indexPath.row];
    if (item.handleCallback) {
        item.handleCallback();
    }
}


- (void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SettingItem *item = self.settingItems[indexPath.row];
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:item.separatorInset];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
