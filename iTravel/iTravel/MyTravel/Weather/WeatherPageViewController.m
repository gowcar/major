//
//  WeatherPageViewController.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "WeatherPageViewController.h"


@implementation WeatherPageViewController

@synthesize tableView, iconView, city, data, needRefresh;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView.backgroundColor = [UIColor clearColor];

    CGRect webRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIWebView *webView  = [[UIWebView alloc] initWithFrame: webRect];
    
    webView.userInteractionEnabled = NO;
    webView.delegate = self;
    webView.opaque = NO;
    webView.backgroundColor = [UIColor blackColor];

    [webView loadRequest:[NSURLRequest requestWithURL:[ResourceLoader resourceURLFromFile:@"Animations/rain.html"]]];
    [self.view insertSubview:webView atIndex:0];
    [self.view.window sendSubviewToBack:webView];

    CGRect rect = CGRectMake(self.view.frame.size.width - 160, -20, 180, 180);
    self.iconView = [[UIImageView alloc] initWithFrame:rect];
    [self.view addSubview:self.iconView];

    [super viewDidLoad];
}

- (void )webViewDidFinishLoad:(UIWebView *)webView {
}

- (void )webViewDidStartLoad:(UIWebView *)webView {     
}



- (void) fetchData {

    if (!needRefresh) 
        return;

    HUD = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    [self.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    [HUD showWhileExecuting:@selector(loadDataSynchronous) onTarget:self withObject:nil animated:YES];
}

- (void) loadDataSynchronous {

    // 设置上方状态栏网络图标为活动
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
    NSString *urlStr = [[[NSString alloc] initWithFormat:@"http://m.weather.com.cn/data/%@.html", city] autorelease];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSString *response = [request responseString];
        self.data = [[response JSONValue] objectForKey:@"weatherinfo"];

        UIImage *img = [ResourceLoader loadImage:@"WeatherIcons/28.png"] ;
        iconView.image = img;
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];
    [tableView reloadData];
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    [HUD removeFromSuperview];
    [HUD release];
}

- (void) loadDataAsynchronous {
    NSString *urlStr = [[[NSString alloc] initWithFormat:@"http://m.weather.com.cn/data/%@.html", city] autorelease];
    NSURL *url = [NSURL URLWithString:urlStr];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request setShowAccurateProgress:NO];
    [request setDownloadCache:[ASIDownloadCache sharedCache]];
    [request setDownloadDestinationPath:[[ASIDownloadCache sharedCache] pathToStoreCachedResponseDataForRequest:request]];
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

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 这里如果不重新引用，则会导致tableView再次reload时候失效，加在这里有两个问题，1：这样重新引用可能本身就是错误的做法；2：即使需要重新引用，加在这里的实际可能也不对
    self.tableView = _tableView;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView.backgroundColor = [UIColor clearColor];

    
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
    StyledBackgroundView *bgView = [[StyledBackgroundView alloc] initWithFrame:CGRectZero];
    bgView.borderColor = [UIColor lightGrayColor];
    bgView.fillColor = [UIColor blackColor];
    bgView.alpha = 0.6;
    if (indexPath.row == 0) {
        bgView.position = CellBackgroundViewPositionTop;
    } else if (indexPath.row == 4) {
        bgView.position = CellBackgroundViewPositionBottom;
    } else {
        bgView.position = CellBackgroundViewPositionMiddle;
    }
    cell.backgroundView = bgView;

    
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
    cell.cellImage.image   = [ResourceLoader loadImage:@"WeatherIcons/11_small.png"];
	cell.powerBy.text      = @"www.weather.com.cn";
	//cell..text = @"this";
    
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger height = 1;
    switch ([indexPath row]) {
        case 0 :
            height = 100;
            break;
        case 1 :
        case 2 :
        case 3 :
            height = 65;
            break;
        case 4 :
            height = 15;
        default:
            break;
    }
	return height;
}

@end
