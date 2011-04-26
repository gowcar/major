//
//  WeatherCellView.h
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WeatherCellView : UITableViewCell {
    UILabel *city;
}

@property(nonatomic,retain) IBOutlet UILabel *city, *topWeather, *cellWeather, *date, *topTemp, *cellTemp, *topWind, *cellWind, *windDirction, *powerBy;
@property(nonatomic,retain) IBOutlet UIImageView *cellImage;
@end
