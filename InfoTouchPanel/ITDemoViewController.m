//
//  ITDemoViewController.m
//  InfoTouchPanel
//
//  Created by Edward Chiang on 12/5/25.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "ITDemoViewController.h"
#import "UIBarButtonItem+BlocksKit.h"

@interface ITDemoViewController ()

@end

@implementation ITDemoViewController

@synthesize dataArray = _dataArray;
@synthesize infoTouchPanel = _infoTouchPanel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    NSInteger totalDataCount = 100;
    _dataArray = [[NSMutableArray alloc] initWithCapacity:totalDataCount];
    // Prepare data
    for (int dataIndex = 0; dataIndex <= totalDataCount; dataIndex++) {
      [_dataArray addObject:[NSNumber numberWithInt:dataIndex]];
    }
  }
  return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)loadView {
  [super loadView];
  
  _infoTouchPanel = [[ITInfoTouchPanel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
  _infoTouchPanel.textLabel.text = @"Tap To The Botton...";
//  [self.view addSubview:self.infoTouchPanel];
  [[[UIApplication sharedApplication] keyWindow] addSubview:_infoTouchPanel];
  UIScreen *screen = [UIScreen mainScreen];

  __block ITDemoViewController *tempSelf = self;
  [_infoTouchPanel handleTouchHideAnimation:^{
    // Go to last cell
    [tempSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:([tempSelf.dataArray count] - 1) inSection:0] atScrollPosition:UIToolbarPositionBottom animated:YES];
  } atPoint:CGPointMake(screen.bounds.origin.x, screen.bounds.size.height) animationInterval:0.3];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  __block ITDemoViewController *tempSelf = self;
  UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh handler:^(id sender) {
    // Show Panel here
    UIScreen *screen = [UIScreen mainScreen];
    [tempSelf.infoTouchPanel show:CGPointMake(screen.bounds.origin.x, screen.bounds.size.height) animationInterval:0.5];
  }];  
  self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  if (indexPath.row < [self.dataArray count]) {
    NSNumber *dataNumber = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = dataNumber.stringValue;
  }
  
  return cell;
}

@end
