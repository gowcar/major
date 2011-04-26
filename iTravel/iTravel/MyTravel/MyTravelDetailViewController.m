//
//  MyTravelDetailViewController.m
//  iTravel
//
//  Created by jeremy on 4/17/11.
//  Copyright 2011 org.doubleking. All rights reserved.
//

#import "MyTravelDetailViewController.h"
#import "iTravelAppDelegate.h"


@implementation MyTravelDetailViewController
@synthesize tabBarController;
@synthesize navController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [tabBarController release];
    [navController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *goBackButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", @"")
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(goBack:)];
	self.tabBarController.navigationItem.leftBarButtonItem = goBackButton;
    [goBackButton release];
    self.tabBarController.navigationItem.title = NSLocalizedString(@"My Travel", @"");
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.tabBarController];
    [self.view addSubview:self.navController.view];
    
}

- (void)viewDidUnload
{
    [self setTabBarController:nil];
    [self setNavController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)goBack:(id)sender {
    iTravelAppDelegate *appDelegate = (iTravelAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.myTravelDetailViewController.view removeFromSuperview];
    [appDelegate.window addSubview:[appDelegate.tabBarController view]];
}
@end
