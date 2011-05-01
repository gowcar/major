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
#import "StyledBackgroundView.h"
#import "MyTravelCellView.h"
#import "ResourceLoader.h"



@implementation MyTravelViewController
@synthesize tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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
    
    MyTravelCellView *cell = (MyTravelCellView *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MyTravelCellView alloc] initWithNibName:@"MyTravelCellView" bundle:[NSBundle mainBundle]] autorelease];
    }
    StyledBackgroundView *bgView = [[[StyledBackgroundView alloc] initWithFrame:CGRectZero] autorelease];
    bgView.borderColor = [UIColor lightGrayColor];
    bgView.fillColor = [UIColor blackColor];
    bgView.alpha = 0.6;
    
    if (indexPath.row == 0) {
        bgView.position = CellBackgroundViewPositionTop;
    } else if (indexPath.row == 6) {
        bgView.position = CellBackgroundViewPositionBottom;
    } else {
        bgView.position = CellBackgroundViewPositionMiddle;
    }
    cell.backgroundView = bgView;
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //cell.textLabel.backgroundColor = [UIColor clearColor];
    //cell.textLabel.textColor = [UIColor whiteColor];
    //cell.textLabel.font = self.byxs7000Font;
    //cell.textLabel.text = [@"2011年4月17号 深圳-北京" autorelease]; 
    cell.lblDate.text = @"2011年4月17号";
    cell.lblFromPlace.text = @"深圳";
    cell.lblToPlace.text = @"北京";
    cell.imgArrow.image = [ResourceLoader loadImage:@"arrow.png"]; 
    
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0;
}

@end
