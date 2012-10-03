//
//  YTFViewController.m
//  YTFPlaceholderTableViewExample
//
//  Created by Vlad Tsepelev on 18.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YTFViewController.h"


@implementation YTFViewController


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)btnClearClick:(id)sender {
    numberOfRows = 0;
    [self.tableView reloadData];
}

- (IBAction)btnAddClick:(id)sender {
    numberOfRows++;
    [self.tableView reloadData];
}


int numberOfRows = 10;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return numberOfRows;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                 
                                       reuseIdentifier:@"cellIdentifier"] autorelease];
        
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    
    
    cell.imageView.image = [UIImage imageWithContentsOfFile:@"image.png"];
    
    return cell;
    
}



- (void)dealloc {
    [self.tableView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
