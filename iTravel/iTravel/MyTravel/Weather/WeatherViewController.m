//
//  WeatherViewController.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "WeatherViewController.h"


@implementation WeatherViewController
@synthesize scrollView, viewControllers, currentPageNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [scrollView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
//    scrollView.layer.cornerRadius = 8;
//    scrollView.layer.masksToBounds = YES;

    self.view.backgroundColor = [UIColor blackColor];
    scrollView.backgroundColor = [UIColor clearColor];
    
    NSInteger kNumberOfPages = 2;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake((scrollView.frame.size.width) * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
    scrollView.canCancelContentTouches = YES;
    
    WeatherPageViewController *localPage = [[WeatherPageViewController alloc] initWithCity:@"101010100"];
    WeatherPageViewController *destPage = [[WeatherPageViewController alloc] initWithCity:@"101020100"];

    CGRect frame1 = scrollView.frame;
    frame1.origin.x = frame1.size.width * 0;
    frame1.origin.y = 0;
    localPage.needRefresh = YES;
    localPage.view.frame = frame1;
    [localPage fetchData];
    [scrollView addSubview:localPage.view];

    
    CGRect frame2 = scrollView.frame;
    frame2.origin.x = frame2.size.width * 1;
    frame2.origin.y = 0;
    destPage.view.frame = frame2;
    
    [scrollView addSubview:destPage.view];
    
    viewControllers = [[NSArray alloc] initWithObjects:localPage, destPage, nil];


    if (self.parentViewController) {
        UIBarButtonItem *reloadButton = [[UIBarButtonItem alloc] initWithTitle:@"刷新"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(reload:)];
        self.parentViewController.navigationItem.rightBarButtonItem = reloadButton;
        [reloadButton release];
    }
    [super viewDidLoad];
}

- (NSInteger) currentPageNumber {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    return page;
}

- (void) reload: (id)sender{
    WeatherPageViewController *controller = [viewControllers objectAtIndex:[self currentPageNumber]];
    controller.needRefresh = YES;
    [controller fetchData];
    controller.needRefresh = NO;
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    WeatherPageViewController *controller = [viewControllers objectAtIndex:[self currentPageNumber]];
    if (!controller.needRefresh) {
        controller.needRefresh = YES;
        [controller fetchData];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    // 由于内部是tableview（本身带有scrollview可以上下滑动，因此当开始滑动时，设置内容区域的垂直偏移量为0，就不会上下滑动了
    [aScrollView setContentOffset: CGPointMake(aScrollView.contentOffset.x, 0)];
}

- (void)viewDidUnload
{
    [viewControllers release];
    [scrollView release];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) testJSON: (id)sender {
//    NSString *str = [[NSString alloc] initWithContentsOfFile:@"/Volumes/S1/dev/tools/JSON v3.0beta1 (iOS)/Tests/Data/array.json" encoding:NSUTF8StringEncoding error:nil];
    NSURL *url = [NSURL URLWithString:@"http://m.weather.com.cn/data/101010100.html"];
    NSString *str = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    //NSString *str = @"{\"aaa\":\"001\",\"bbb\",\"002\"}";
    NSLog(@"string is : %@", str);
//    SBJsonParser *parser = [SBJsonParser new];
//    id object = [parser objectWithString:str];
//    if (!object)
//        NSLog(@"Error trace: %@", parser.error);
//    else 
    id object = [str JSONValue];
//    if (!object)
//        NSLog(@"Error trace: %@", parser.error);
//    else 
        NSLog(@"Data: %@", [object class]);
//    NSLog(@"%@", str);
//    NSLog(@"%@", [str JSONValue]);
    [str release];
}

@end
