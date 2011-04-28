//
//  WeatherPageViewController.h
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 
#import "JSON.h"
#import "JSONProvider.h"
#import "WeatherCellView.h"
#import "MBProgressHUD.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"
#import "ResourceLoader.h"
#import "StyledBackgroundView.h"

@interface WeatherPageViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,MBProgressHUDDelegate, ASIHTTPRequestDelegate, UIWebViewDelegate> {
    NSString *city;
    NSDictionary *data;
    MBProgressHUD *HUD;
    UIWebView *webView;
    UIImageView *iconView;
    NSMutableDictionary *legend;
}

- (WeatherPageViewController *) initWithCity: (NSString *)_city;
- (void) fetchData;

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSString *city;
@property (nonatomic,retain) NSDictionary *data;
@property (nonatomic,retain) UIImageView *iconView;
@property (nonatomic,retain) UIWebView *webView;
@property(nonatomic) BOOL needRefresh;
@property (nonatomic,retain) NSDictionary *legend;

@end
