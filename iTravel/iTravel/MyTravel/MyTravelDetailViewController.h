//
//  MyTravelDetailViewController.h
//  iTravel
//
//  Created by jeremy on 4/17/11.
//  Copyright 2011 org.doubleking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTravelDetailViewController : UIViewController {
    UITabBarController *tabBarController;
    UINavigationController *navController;
}
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) UINavigationController *navController;
- (void)goBack:(id)sender;

@end
