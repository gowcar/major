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

@interface WeatherPageViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,MBProgressHUDDelegate, ASIHTTPRequestDelegate> {
    NSString *city;
    NSDictionary *data;
    MBProgressHUD *HUD;
}

- (void) loadDataTask;
- (void) loadData;
- (void) loadDataFailed: (ASIHTTPRequest *)request;
- (void) didFinishLoadData: (ASIHTTPRequest *)request;
- (WeatherPageViewController *) initWithCity: (NSString *)_city;
- (void)requestFinished:(ASIHTTPRequest *)request;
- (void)requestFailed:(ASIHTTPRequest *)request;

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSString *city;
@property (nonatomic,retain) NSDictionary *data;
@property(nonatomic, retain) UIView *opaqueview;
@property(nonatomic, retain) UIActivityIndicatorView *activityIndicator;

@end
