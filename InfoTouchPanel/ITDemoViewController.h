//
//  ITDemoViewController.h
//  InfoTouchPanel
//
//  Created by Edward Chiang on 12/5/25.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITInfoTouchPanel.h"

@interface ITDemoViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) ITInfoTouchPanel *infoTouchPanel;

@end
