//
//  AppDelegate.h
//  点餐系统
//
//  Created by 余洋 on 2017/7/11.
//  Copyright © 2017年 余洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

