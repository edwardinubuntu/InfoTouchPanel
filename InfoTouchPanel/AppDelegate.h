//
//  AppDelegate.h
//  InfoTouchPanel
//
//  Created by Edward Chiang on 12/5/25.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITDemoViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ITDemoViewController *demoViewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
