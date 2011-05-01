//
//  ResourceLoader.m
//  iTravel
//
//  Created by Jacky Zhang on 11-4-21.
//  Copyright 2011年 org.doubleking. All rights reserved.
//

#import "ResourceLoader.h"
#import <CoreText/CTFontManager.h>


@implementation ResourceLoader
static NSMutableDictionary *_appConfig;

+ (NSURL *) resourceURLFromFile: (NSString *) _filepath {
    NSURL *baseURL = [[NSBundle mainBundle] resourceURL];
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"AppResources/%@", _filepath] relativeToURL:baseURL];
    return url;
}

+ (UIImage *) loadImage: (NSString *) _path {
    NSURL *baseURL = [[NSBundle mainBundle] resourceURL];
    NSURL *imgURL = [NSURL URLWithString:[[NSString alloc] initWithFormat:@"AppResources/Images/%@", _path] relativeToURL:baseURL];
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:imgURL]] ;
    return img;
}

+ (NSMutableDictionary *) appConfig {
    if (!_appConfig) {
        NSURL *baseURL = [[NSBundle mainBundle] resourceURL];
        NSURL *url = [NSURL URLWithString:@"AppConfig.plist" relativeToURL:baseURL];
        NSMutableDictionary *config = [NSMutableDictionary dictionaryWithContentsOfURL:url];
        _appConfig = config;
    }
    return _appConfig;
}

+ (UIFont *) loadFontFromFile: (NSString *) _filepath withFontFamilyName: (NSString *) _fontName withFontSize: (float)_size{
    CFURLRef fontURL = (CFURLRef)[ResourceLoader resourceURLFromFile:_filepath];
    CTFontManagerRegisterFontsForURL(fontURL, kCTFontManagerScopeProcess, nil);
    return [UIFont fontWithName:_fontName size:_size];
}
@end
