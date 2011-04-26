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

-(IBAction) testJSON: (id)sender;

@end
