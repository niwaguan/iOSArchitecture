//
//  MasterTableViewController.m
//  iOS Knowledge Architecture
//
//  Created by 高洋 on 2019/7/29.
//  Copyright © 2019 Gaoyang. All rights reserved.
//

#import "MasterTableViewController.h"
#import "GYPageViewController.h"
#import "GYDetailViewController.h"

#import <objc/message.h>

@interface MasterTableViewController () <GYPageViewControllerDataSource>

/// mapper
@property (nonatomic, readwrite, strong) NSDictionary<NSNumber *, NSString *> *selectorMapper;
/// controllers
@property (nonatomic, readwrite, strong) NSArray<UIViewController *> *controllers;

@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.selectorMapper = @{
                            @(0): NSStringFromSelector(@selector(showPageViewControllerWithDataSource)),
                            @(1): NSStringFromSelector(@selector(showPageViewControllerWithMetadata)),
                            @(2): NSStringFromSelector(@selector(showTransitionDemo))
                            };
    self.controllers = @[
                         ({
                             GYDetailViewController *cotnroller = [[GYDetailViewController alloc] init];
                             cotnroller.title = @"李白";
                             cotnroller;
                         }),
                         ({
                             GYDetailViewController *cotnroller = [[GYDetailViewController alloc] init];
                             cotnroller.title = @"杜甫";
                             cotnroller;
                         }),
                         ({
                             GYDetailViewController *cotnroller = [[GYDetailViewController alloc] init];
                             cotnroller.title = @"白居易";
                             cotnroller;
                         })
                         ];
}

- (void)showPageViewControllerWithDataSource {
    GYPageViewController *controller = [[GYPageViewController alloc] initWithDataSource:self];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)showPageViewControllerWithMetadata {
    GYPageViewController *controller = [[GYPageViewController alloc] initWithControllers:self.controllers index:self.controllers.count - 1];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)showTransitionDemo {
    
}

#pragma mark -

- (NSInteger)numberOfItemsInPageViewController:(GYPageViewController *)pageViewController {
    return self.controllers.count;
}

- (NSInteger)indexOfFirstDisplayInPageViewController:(GYPageViewController *)pageViewController {
    return 0;
}

- (UIViewController *)pageViewController:(GYPageViewController *)controller controllerAtIndex:(NSInteger)index {
    return self.controllers[index];
}

- (GYPageViewControllerScrollDirection)scrollDirectionInPageViewController:(GYPageViewController *)pageViewController {
    return GYPageViewControllerScrollDirectionHorizontal;
}

#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selString = self.selectorMapper[@(indexPath.row)];
    SEL sel = NSSelectorFromString(selString);
    if ([self respondsToSelector:sel]) {
        ((void (*)(id, SEL))objc_msgSend)(self, sel);
    }
}

@end
