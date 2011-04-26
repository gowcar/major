//
//  WeatherViewController.h
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "WeatherPageViewController.h"

@interface WeatherViewController : UIViewController<UIScrollViewDelegate> {
    UIScrollView *scrollView;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, readonly) NSInteger currentPageNumber;

-(IBAction) testJSON: (id)sender;
- (void) reload: (id)sender;

@end
