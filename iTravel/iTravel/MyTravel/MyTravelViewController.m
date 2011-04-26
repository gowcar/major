//
//  MyTravelViewController.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-17.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "MyTravelViewController.h"
#import "iTravelAppDelegate.h"
#import "MyTravelDetailViewController.h"


@implementation MyTravelViewController
@synthesize tableView = _tableView;

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
    [self.tableView release];
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
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MyTravelCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    NSString *rowIndex = [[NSString alloc] initWithFormat:@"%d", indexPath.row];
    [rowIndex release];
    cell.textLabel.text = @"2011年4月17号 深圳-北京"; 
    
    // Configure the cell.
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    iTravelAppDelegate *appDelegate = (iTravelAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.tabBarController.view removeFromSuperview];
    if (appDelegate.myTravelDetailViewController == nil) {
        appDelegate.myTravelDetailViewController = [[MyTravelDetailViewController alloc] initWithNibName:@"MyTravelDetailView" bundle:nil];
    }
    
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:0.8f];
    [UIView setAnimationCurve:UITextWritingDirectionLeftToRight];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view.window cache:YES];

    [appDelegate.window addSubview:[appDelegate.myTravelDetailViewController view]];

    [UIView commitAnimations];
}

@end
