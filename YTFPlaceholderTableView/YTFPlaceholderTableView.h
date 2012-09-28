//
//  YTFPlaceholderTableView.h
//  
//
//  Created by YetiTheFoot 21.06.12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTFPlaceholderTableView : UITableView{
    UIView *_placeholderView;
    UILabel *_placeholderText;
}

@property (nonatomic,readonly) bool tableViewHasRows;

@end
