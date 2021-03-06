//
//  SKDefaultSkin.m
//  SkinKit
//
//  Created by Dominique d'Argent on 23.06.12.
//  Copyright (c) 2012 Dominique d'Argent. All rights reserved.
//

#import "SKSkin.h"
#import "SKConstants.h"
#import "UIColor+SKSkinning.h"

@interface SKSkin ()

@property (nonatomic, strong, readwrite) NSBundle *bundle;

@end

@implementation SKSkin

@synthesize applied = _applied;

- (id)initWithBundleName:(NSString *)bundleName {
    self = [super init];
    
    if (self) {
        if (bundleName) {
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName
                                                                   ofType:SKINKIT_BUNDLE_EXTENSION];
            
            if (bundlePath) {
                self.bundle = [NSBundle bundleWithPath:bundlePath];
            }
        }
    }
    
    return self;
}

- (id)init {
    NSString *bundleName = NSStringFromClass([self class]);
    
    return [self initWithBundleName:bundleName];
}


#pragma mark - Convenience methods

- (UIImage *)imageNamed:(NSString *)name {
    if (self.bundle) {
        NSString *bundleFilename = [[self.bundle bundlePath] lastPathComponent];
        NSString *resourcesFolder = [[self.bundle resourceURL] relativePath];
        NSString *resourcesPath = [bundleFilename stringByAppendingPathComponent:resourcesFolder];
        
        name = [resourcesPath stringByAppendingPathComponent:name];
    }
    
    UIImage *image = [UIImage imageNamed:name];
    
    NSLog(@"Loaded image from %@: %@", name, image);
    
    return image;
}

#pragma mark - Bundle
- (id)valueForBundleKey:(NSString *)key {
    NSDictionary *bundleValues = [self.bundle objectForInfoDictionaryKey:SKINKIT_BUNDLE_DATASOURCE_KEY];
    
    return [bundleValues objectForKey:key];
}

- (NSString *)stringValueForBundleKey:(NSString *)key {
    // TODO: type validation required?
    return [self valueForBundleKey:key];
}

- (NSDictionary *)dictionaryValueForBundleKey:(NSString *)key {
    // TODO: type validation required?
    return [self valueForBundleKey:key];
}

- (UIColor *)colorValueForBundleKey:(NSString *)key {
    NSDictionary *dict = [self dictionaryValueForBundleKey:key];
    
    return [UIColor colorWithDictionary:dict];
}

#pragma mark - String from constants

- (NSString *)stringFromControlState:(UIControlState)state {
    switch (state) {
        case UIControlStateHighlighted:
            return @"Highlighted";
        
        case UIControlStateDisabled:
            return @"Disabled";
            
        case UIControlStateSelected:
            return @"Selected";
            
        default:
            return @"";
    }
}

- (NSString *)stringFromBarMetrics:(UIBarMetrics)barMetrics {
    if (barMetrics == UIBarMetricsLandscapePhone) {
        return @"Landscape";
    }
    
    return @"";
}

- (NSString *)stringFromBarButtonItemStyle:(UIBarButtonItemStyle)style {
    switch (style) {
        case UIBarButtonItemStyleDone:
            return @"Done";
            
        default:
            return @"";
    }
}

- (NSString *)stringFromToolbarPosition:(UIToolbarPosition)position {
    switch (position) {
        case UIToolbarPositionTop:
            return @"Top";
        
        case UIToolbarPositionBottom:
            return @"Bottom";
            
        default:
            return @"";
    }
}


#pragma mark -
#pragma mark - Defaults


#pragma mark - Base colors
- (UIColor *)backgroundColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}


#pragma mark - Tint colors
- (UIColor *)baseTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)accentTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}


#pragma mark - Shadows
- (UIImage *)shadowTopImage {
    return nil;
}

- (UIImage *)shadowBottomImage {
    return nil;
}


#pragma mark - Text attributes
- (NSDictionary *)navigationBarTitleTextAttributes {
    return nil;
}

- (NSDictionary *)barButtonItemTitleTextAttributesForState:(UIControlState)state {
    return nil;
}

- (NSDictionary *)tableViewHeaderFooterLabelTextAttributes {
    return nil;
}

#pragma mark -
#pragma mark - UI elements

#pragma mark - Tab bar
- (UIColor *)tabBarTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIImage *)tabBarBackgroundImage {
    return nil;
}

- (UIImage *)tabBarSelectionIndicatorImage {
    return nil;
}

- (UIColor *)tabBarSelectedImageTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}


#pragma mark - Navigation bar
- (UIColor *)navigationBarTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIImage *)navigationBarBackgroundImageForBarMetrics:(UIBarMetrics)barMetrics {
    return nil;
}


#pragma mark - Toolbar
- (UIColor *)toolbarTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIImage *)toolbarBackgroundImageForToolbarPosition:(UIToolbarPosition)toolbarPosition
                                           barMetrics:(UIBarMetrics)barMetrics {
    return nil;
}

#pragma mark - Search bar
- (UIColor *)searchBarTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIImage *)searchBarBackgroundImage {
    return nil;
}


#pragma mark - Bar button item
- (UIColor *)barButtonItemTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIImage *)barButtonItemBackgroundImageForState:(UIControlState)state
                                            style:(UIBarButtonItemStyle)style
                                       barMetrics:(UIBarMetrics)barMetrics {
    return nil;
}

- (UIImage *)backBarButtonItemBackgroundImageForState:(UIControlState)state
                                           barMetrics:(UIBarMetrics)barMetrics {
    return nil;
}


#pragma mark - Table view
- (UIImage *)tableViewBackgroundImage {
    return nil;
}


#pragma mark - Scroll view
- (NSValue *)scrollViewContentInsets {
    return nil;
}


#pragma mark - Controls
- (UIColor *)controlBaseTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)controlAccentTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

- (UIColor *)controlThumbTintColor {
    return [self colorValueForBundleKey:NSStringFromSelector(_cmd)];
}

@end
