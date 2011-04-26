//
//  WeatherViewController.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "WeatherViewController.h"


@implementation WeatherViewController
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 很好很好
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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
//    scrollView.layer.cornerRadius = 8;
//    scrollView.layer.masksToBounds = YES;

    NSInteger kNumberOfPages = 2;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake((scrollView.frame.size.width) * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
    scrollView.canCancelContentTouches = YES;
    
    WeatherPageViewController *localPage = [[WeatherPageViewController alloc] initWithCity:@"101010100"];
//    WeatherPageViewController *destPage = [[WeatherPageViewController alloc] initWithCity:@"101020100"];

    CGRect frame1 = scrollView.frame;
    frame1.origin.x = frame1.size.width * 0;
    frame1.origin.y = 0;
    localPage.view.frame = frame1;
    [scrollView addSubview:localPage.view];

    
//    CGRect frame2 = scrollView.frame;
//    frame2.origin.x = frame2.size.width * 1;
//    frame2.origin.y = 0;
//    destPage.view.frame = frame2;
//    
//    [scrollView addSubview:destPage.view];

    [super viewDidLoad];
}


- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    // 由于内部是tableview（本身带有scrollview可以上下滑动，因此当开始滑动时，设置内容区域的垂直偏移量为0，就不会上下滑动了
    [aScrollView setContentOffset: CGPointMake(aScrollView.contentOffset.x, 0)];
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
