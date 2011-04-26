//
//  WeatherPageViewController.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "WeatherPageViewController.h"


@implementation WeatherPageViewController

@synthesize city;
@synthesize data;
@synthesize tableView, opaqueview, activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (WeatherPageViewController *) initWithCity: (NSString *)_city {
    self = [super initWithNibName:@"WeatherPageView" bundle:[NSBundle mainBundle]];
    if (self) {
        self.city = _city;
    }
    return self;
}

- (void)dealloc
{
    [city release];
    [data release];
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
//    opaqueview = [[UIView alloc] initWithFrame: CGRectMake(0, 0,180 ,100)];
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(0, 0, 40, 40)];
//    
//    opaqueview.layer.cornerRadius = 8.0f;
//    opaqueview.layer.masksToBounds = YES;
//   
//    opaqueview.center = CGPointMake(self.view.frame.size.width/2, (self.view.frame.size.height/2) - 20);
//    activityIndicator.center = CGPointMake(opaqueview.frame.size.width/2, opaqueview.frame.size.height/2 - 10);
//    
//    //activityIndicator.center = opaqueview.center;
//    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
//    
//    opaqueview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6f];
//    //opaqueview.alpha = 0.6;
//    opaqueview.hidden = NO;
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, opaqueview.frame.size.height - 30, opaqueview.frame.size.width, 20)];
//    label.textAlignment = UITextAlignmentCenter;
//    label.opaque = NO;
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont boldSystemFontOfSize:18];
//    label.backgroundColor = [UIColor clearColor];
//    label.text = @"Loading";
//    [opaqueview addSubview: label];
//
//    [opaqueview addSubview: activityIndicator];
//    
//    
//    [activityIndicator startAnimating]; 
//    [self.view addSubview:opaqueview];
    tableView.delegate = self;
    tableView.dataSource = self;
    NSLog(@"Rows :%d", tableView.delegate == self );

//    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    [self.view addSubview:HUD];
    HUD.delegate = self;

    HUD.labelText = @"Loading";
//    [HUD show:YES];
//    [self loadData];
    [HUD showWhileExecuting:@selector(loadDataTask) onTarget:self withObject:nil animated:YES];
//    [self loadDataTask];

    
    //self.data = [[JSONProvider provideWeatherData:self.city] objectForKey:@"weatherinfo"];
    //NSLog(@"Data is %@", data);
    self.view.backgroundColor = [UIColor clearColor];
    tableView.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
//    [tableView reloadData];
    [super viewDidLoad];
}
- (void) loadDataTask {
    self.data = [[JSONProvider provideWeatherData:self.city] objectForKey:@"weatherinfo"];
    [tableView reloadData];
}

- (void) loadData {
    NSString *urlStr = [[[NSString alloc] initWithFormat:@"http://m.weather.com.cn/data/%@.html", city] autorelease];
    NSURL *url = [NSURL URLWithString:urlStr];
//        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//        [request startSynchronous];
//        NSError *error = [request error];
//        if (!error) {
//            NSString *response = [request responseString];
//            NSLog(@"result is : %@", response);
//            data = [response JSONValue];
//        }
    
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setDelegate:self];
//    [request startAsynchronous];
//    
//    
//    [HUD hide:YES];
    //NSString *str = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    //NSDictionary *data = [str JSONValue];
    //[url release];
    //[str release];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request setShowAccurateProgress:NO];
	//[request setDownloadProgressDelegate:progressIndicator];
    //[request setUrlReplacementMode:([dataURICheckbox state] == NSOnState ? ASIReplaceExternalResourcesWithData : ASIReplaceExternalResourcesWithLocalURLs)];
    //    
	// It is strongly recommended that you set both a downloadCache and a downloadDestinationPath for all ASIWebPageRequests
    [request setDownloadCache:[ASIDownloadCache sharedCache]];
    [request setDownloadDestinationPath:[[ASIDownloadCache sharedCache] pathToStoreCachedResponseDataForRequest:request]];
    //    
    [[ASIDownloadCache sharedCache] setShouldRespectCacheControlHeaders:NO];
	[request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSString *result;
    if ([request downloadDestinationPath]) {
		result = [NSString stringWithContentsOfFile:[request downloadDestinationPath] encoding:[request responseEncoding] error:nil];
	} else if ([request responseString]) {
        result = [request responseString];
	}
    NSLog(@"result is %@", result);
    data = [[result JSONValue]  objectForKey:@"weatherinfo"];
    [HUD hide:YES];
    [tableView reloadData];
}
- (void)requestFailed:(ASIHTTPRequest *)request {
    HUD.delegate = self;
    HUD.labelText = @"Load data failed";
    [HUD show:YES];
    sleep(0.5f);
    [HUD hide:YES];
}


- (void) loadDataFailed: (ASIHTTPRequest *)request {
}

- (void) didFinishLoadData: (ASIHTTPRequest *)request {
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    //[self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:self.tableView waitUntilDone:YES];
    //NSLog(@"Rows :%@", [tableView.delegate class] );
    //NSLog(@"Rows :%@", self.data);
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    NSLog(@"Rows :%d", tableView.delegate == self );
    [HUD removeFromSuperview];
    [HUD release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
	static NSString *cellIdentifer = @"weatherCell";

	WeatherCellView *cell = (WeatherCellView *)[_tableView dequeueReusableCellWithIdentifier:cellIdentifer];
	if (cell == nil) {
        NSInteger index = 0;
        switch ([indexPath row]) {
            case 0 :
                index = 0;
                break;
            case 1 :
            case 2 :
            case 3 :
                index = 1;
                break;
            case 4 :
                index = 2;
            default:
                break;
        }
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WeatherCellView" owner:self options:nil];
        cell = (WeatherCellView *)[nib objectAtIndex:index];
	}
    
    //*city, *topWeather, *cellWeather, *date, *topTemp, *cellTemp, *topWind, *cellWind, *windDirction, *powerBy;
	cell.city.text         = [data objectForKey:@"city"];
	cell.topWeather.text   = [data objectForKey:@"weather1"];
	cell.cellWeather.text  = [data objectForKey:[[NSString alloc] initWithFormat:@"weather%d", indexPath.row]];
	cell.date.text         = [data objectForKey:@"date_y"];
	cell.topTemp.text      = [data objectForKey:@"temp1"];
	cell.cellTemp.text     = [data objectForKey:[[NSString alloc] initWithFormat:@"temp%d", indexPath.row]];
	cell.topWind.text      = [data objectForKey:@"fl1"];
	cell.cellWind.text     = [data objectForKey:[[NSString alloc] initWithFormat:@"fl%d", indexPath.row]];
	cell.windDirction.text = [data objectForKey:@"wind1"];
	cell.powerBy.text      = @"www.weather.com.cn";
	//cell..text = @"this";
    
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height = 1;
    switch ([indexPath row]) {
        case 0 :
            height = 120;
            break;
        case 1 :
        case 2 :
        case 3 :
            height = 90;
            break;
        case 4 :
            height = 40;
        default:
            break;
    }
	return height;
}

@end
