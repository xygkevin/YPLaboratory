//
//  AppDelegate.m
//  YPLaboratory
//
//  Created by Hansen on 2023/5/17.
//

#import "AppDelegate.h"
#import "YPRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    YPRootViewController *vc = [[YPRootViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
