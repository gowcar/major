//
//  MyTravelViewController.h
//  iTravel
//
//  Created by Jacky Zhang on 11-4-17.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTravelViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    
    UITableView *_tableView;
}
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
