//
//  ITInfoTouchPanel.m
//  InfoTouchPanel
//
//  Created by Edward Chiang on 12/5/25.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "ITInfoTouchPanel.h"

@implementation ITInfoTouchPanel

@synthesize textLabel = _textLabel;

#define textLabelPosition (kMPInfoTouchPanelHeight - self.textLabel.height ) / 2

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
    _textLabel = [[UILabel alloc] init];
    self.textLabel.font = [UIFont boldSystemFontOfSize:16.f];
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.textLabel];
    
    self.backgroundColor = [UIColor colorWithRed:0.569 green:0.596 blue:0.655 alpha:0.9];
    
    [self setHidden:YES];
  }
  return self;
}

- (void)layoutSubviews {
}

- (void)show:(CGPoint)position animationInterval:(NSTimeInterval)interval {
  [self.textLabel sizeToFit];  
  self.textLabel.frame = CGRectMake(position.x, kInfoTouchPanelHeight, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
  self.hidden = NO;
  self.frame = CGRectMake(position.x, position.y, self.frame.size.width, 0);
  
  __block ITInfoTouchPanel *tempSelf = self;
  [UIView animateWithDuration:interval animations:^{
    tempSelf.frame = CGRectMake(position.x, position.y - kInfoTouchPanelHeight, tempSelf.frame.size.width, kInfoTouchPanelHeight);
  } completion:^(BOOL finished) {
    tempSelf.textLabel.hidden = NO;
    tempSelf.textLabel.frame = CGRectMake(
                                          (tempSelf.frame.size.width - tempSelf.textLabel.frame.size.width ) / 2, 
                                          (kInfoTouchPanelHeight - self.textLabel.frame.size.height) / 2, 
                                          tempSelf.textLabel.frame.size.width, tempSelf.textLabel.frame.size.height);
  }];
}

- (void)hide:(hideCompletionBlock)hideCompletion atPoint:(CGPoint)position animationInterval:(NSTimeInterval)interval {
  __block ITInfoTouchPanel *tempSelf = self;
  [UIView animateWithDuration:interval animations:^{
    tempSelf.textLabel.frame = CGRectMake(position.x, position.y, tempSelf.frame.size.width, 0);
    tempSelf.frame = CGRectMake(position.x, position.y, tempSelf.frame.size.width, 0);
  } completion:^(BOOL finished) {
    tempSelf.hidden = YES;
    if (hideCompletion) {
      hideCompletion();
    }
  }];
  
}

- (void)handleTouchHideAnimation:(hideCompletionBlock)hideCompletion atPoint:(CGPoint)position animationInterval:(NSTimeInterval)interval  {
  __block ITInfoTouchPanel *tempSelf = self;
  [self addEventHandler:^(id sender) {
    UIControl *senderControl = (UIControl *)sender;
    if (senderControl.isTouchInside) {
      [tempSelf hide:^{
        hideCompletion();
      } atPoint:position animationInterval:interval];
    }
    
  } forControlEvents:UIControlEventTouchUpInside];
}
@end
