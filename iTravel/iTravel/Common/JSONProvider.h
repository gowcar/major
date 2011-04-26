//
//  JSONProvider.h
//  iTravel
//
//  Created by Jacky Zhang on 11-4-19.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@interface JSONProvider : NSObject {
    
}

+ (NSDictionary *)fetchJSONData: (NSURL *)url : (NSStringEncoding)encoding;

+ (NSDictionary *)provideWeatherData: (NSString *)city;

@end
