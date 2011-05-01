//
//  ResourceLoader.h
//  iTravel
//
//  Created by Jacky Zhang on 11-4-21.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ResourceLoader : NSObject {
}

+ (NSURL *) resourceURLFromFile: (NSString *) _filepath;
+ (UIImage *) loadImage: (NSString *) _path;
+ (NSMutableDictionary *) appConfig;
+ (UIFont *) loadFontFromFile: (NSString *) _filepath withFontFamilyName: (NSString *) _name withFontSize: (float)_size;

@end
