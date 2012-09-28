//
//  YTFViewController.h
//  YTFPlaceholderTableViewExample
//
//  Created by Vlad Tsepelev on 18.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YTFPlaceholderTableView.h"


@interface YTFViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
- (IBAction)btnClearClick:(id)sender;
- (IBAction)btnAddClick:(id)sender;
@property (retain, nonatomic) IBOutlet YTFPlaceholderTableView *tableView;

@end
