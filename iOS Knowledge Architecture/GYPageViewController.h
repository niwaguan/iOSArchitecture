//
//  GYPageViewController.h
//  iOS Knowledge Architecture
//
//  Created by 高洋 on 2019/7/29.
//  Copyright © 2019 Gaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GYPageViewController;

/**
 scroll direction
 */
typedef NS_ENUM(int, GYPageViewControllerScrollDirection) {
    GYPageViewControllerScrollDirectionHorizontal,
    GYPageViewControllerScrollDirectionVertical
};

@protocol GYPageViewControllerDataSource <NSObject>

@required;
/// total count
- (NSInteger)numberOfItemsInPageViewController:(GYPageViewController *)pageViewController;

/// which should display first
- (NSInteger)indexOfFirstDisplayInPageViewController:(GYPageViewController *)pageViewController;

/// controller at specify index
- (UIViewController *)pageViewController:(GYPageViewController *)controller controllerAtIndex:(NSInteger)index;

@optional
/// scroll direction. default is `GYPageViewControllerScrollDirectionHorizontal`
- (GYPageViewControllerScrollDirection)scrollDirectionInPageViewController:(GYPageViewController *)pageViewController;

@end

@protocol GYPageViewControllerAppearance <NSObject>

@optional;
- (void)setShowsVerticalScrollIndicator:(BOOL)ifNeeds;
- (void)setShowsHorizontalScrollIndicator:(BOOL)ifNeeds;

@end

@interface GYPageViewController : UIViewController

@property (nonatomic, readonly, weak, nullable) id<GYPageViewControllerDataSource> dataSource;

/// appearance
@property (nonatomic, readonly, strong) id <GYPageViewControllerAppearance> appearance;

/// controllers
@property (nonatomic, readonly, copy, nullable) NSArray<UIViewController *> *controllers;


/// current display index
@property (nonatomic, readonly, assign) NSInteger index;
/**
 create and return instance with metadata

 @param controllers sub controllers
 @param index which should display first
 @return instance
 */
- (instancetype)initWithControllers:(NSArray<UIViewController *> *)controllers index:(NSInteger)index;

/**
 create and return instance with dataSource

 @param dataSource dataSource
 @return instance
 */
- (instancetype)initWithDataSource:(id<GYPageViewControllerDataSource>)dataSource;

/**
 specify the display index

 @param index index
 @param animation animation or not
 */
- (void)setIndex:(NSInteger)index animation:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END
