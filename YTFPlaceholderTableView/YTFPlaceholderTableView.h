//
//  YTFPlaceholderTableView.h
//  
//
//  Created by YetiTheFoot 21.06.12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTFPlaceholderTableView : UITableView{

}

@property (nonatomic,readonly) bool tableViewHasRows;
@property (nonatomic,retain) UILabel * placeholderText;

@end
