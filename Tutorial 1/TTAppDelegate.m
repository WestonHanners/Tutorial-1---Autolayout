//
//  TTAppDelegate.m
//  Tutorial 1
//
//  Created by Weston Hanners on 3/25/14.
//  Copyright (c) 2014 Hanners Software. All rights reserved.
//

#import "TTAppDelegate.h"
#import "TTFirstViewController.h"

@interface TTAppDelegate ()

@property (readonly) TTFirstViewController *firstViewController;

@end

@implementation TTAppDelegate
@synthesize firstViewController = _firstViewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window setRootViewController:self.firstViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - UI Elements

- (UIWindow *)window {
    if (!_window) {
        
        CGRect windowRect = [[UIScreen mainScreen] bounds];
        _window = [[UIWindow alloc] initWithFrame:windowRect];
    }
    return _window;
}

- (TTFirstViewController *)firstViewController {
    if (!_firstViewController) {
        _firstViewController = [TTFirstViewController new];
    }
    return _firstViewController;
}
@end
