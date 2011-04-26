//
//  WeatherCellView.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "WeatherCellView.h"


@implementation WeatherCellView

@synthesize city, topTemp, topWeather, topWind, cellImage, cellTemp, cellWeather, cellWind, date, powerBy, windDirction;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [city release];
    [super dealloc];
}

@end
