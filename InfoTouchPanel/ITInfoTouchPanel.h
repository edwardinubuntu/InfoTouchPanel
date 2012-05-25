//
//  ITInfoTouchPanel.h
//  InfoTouchPanel
//
//  Created by Edward Chiang on 12/5/25.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "UIControl+BlocksKit.h"

typedef void(^hideCompletionBlock)(void);

#define kInfoTouchPanelHeight 44.f

@interface ITInfoTouchPanel : UIControl

@property (nonatomic, retain) UILabel *textLabel;

- (void)show:(CGPoint)position animationInterval:(NSTimeInterval)interval;
- (void)hide:(hideCompletionBlock)hideCompletion atPoint:(CGPoint)position animationInterval:(NSTimeInterval)interval;
- (void)handleTouchHideAnimation:(hideCompletionBlock)hideCompletion atPoint:(CGPoint)position animationInterval:(NSTimeInterval)interval;

@end
