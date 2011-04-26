//
//  JSONProvider.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "JSONProvider.h"


@implementation JSONProvider

+ (id)fetchJSONData: (NSURL *)url : (NSStringEncoding)enc {
    NSString *jsonstr = [[NSString alloc] initWithContentsOfURL:url encoding:enc error:nil];
    id jsonvalue = [jsonstr JSONValue];
    [jsonstr release];
    return jsonvalue;
}

+ (NSDictionary *)provideWeatherData: (NSString *)city {
    NSString *urlStr = [[[NSString alloc] initWithFormat:@"http://m.weather.com.cn/data/%@.html", city] autorelease];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSString *str = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *data = [str JSONValue];
    [url release];
    [str release];
    return data;
}


@end
