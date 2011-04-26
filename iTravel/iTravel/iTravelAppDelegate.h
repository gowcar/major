//
//  iTravelAppDelegate.h
//  iTravel
//
//  Created by jeremy on 4/17/11.
//  Copyright 2011 org.doubleking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTravelDetailViewController.h"

@interface iTravelAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain) MyTravelDetailViewController *myTravelDetailViewController;

@end
