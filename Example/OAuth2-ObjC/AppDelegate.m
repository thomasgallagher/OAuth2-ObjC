//
//  AppDelegate.m
//  OAuth2-ObjC
//
//  Created by Tom Gallagher on 27/04/2016.
//  Copyright © 2016 Tom Gallagher. All rights reserved.
//

#import "AppDelegate.h"
#import "OAuth2Client.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [[OAuth2Client sharedInstance] retrieveCodeFromUrl:url];
    return NO;
}

@end
