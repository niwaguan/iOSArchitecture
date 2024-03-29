//
//  AppDelegate.h
//  iOS Knowledge Architecture
//
//  Created by 高洋 on 2019/7/28.
//  Copyright © 2019 Gaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

