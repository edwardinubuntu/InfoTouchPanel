//
//  ITDemoViewController.m
//  InfoTouchPanel
//
//  Created by Edward Chiang on 12/5/25.
//  Copyright (c) 2012年 Polydice Inc. All rights reserved.
//

#import "ITDemoViewController.h"

@interface ITDemoViewController ()

@end

@implementation ITDemoViewController

@synthesize dataArray = _dataArray;

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

  UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(demo)];
  self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
