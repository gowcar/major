//
//  iTravelAppDelegate.m
//  iTravel
//
//  Created by jeremy on 4/17/11.
//  Copyright 2011 org.doubleking. All rights reserved.
//

#import "iTravelAppDelegate.h"

@implementation iTravelAppDelegate


@synthesize window=_window;
@synthesize tabBarController = _tabBarController;
@synthesize myTravelDetailViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // 小改动测试
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [myTravelDetailViewController release];
    [super dealloc];
}

+ (iTravelAppDelegate *)App {
    return (iTravelAppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (UIWindow *)AppWindow {
    return [[[UIApplication sharedApplication] windows] objectAtIndex:0];
}

+ (void)changeRootViewController: (UIViewController *)controller {

    UIWindow *window = [iTravelAppDelegate AppWindow];

    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; 
    UIViewAnimationTransition trans;
    trans = UIViewAnimationTransitionFlipFromRight;
    [UIView setAnimationTransition:trans forView:window.rootViewController.view cache:YES];
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    [window reloadInputViews];
    [UIView commitAnimations];
    
}


/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
