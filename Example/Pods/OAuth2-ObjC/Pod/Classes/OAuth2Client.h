//
//  OAuth2Client.h
//  OAuth2-ObjC
//
//  Created by Tom Gallagher on 27/04/2016.
//  Copyright © 2016 Tom Gallagher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@import STKWebKitViewController;

#define kOAuth2CodeReceivedNotification @"OAuth2CodeReceivedNotification"
#define kOAuth2SignedInNotification @"OAuth2SignedInNotification"
#define kOAuth2SignedOutNotification @"OAuth2SignedOutNotification"

@interface OAuth2Client : NSObject {
    BOOL credentialsLoaded;
    STKWebKitModalViewController *authViewController;
}

@property (nonatomic, strong) STKWebKitViewController *webKitViewController;

@property (nonatomic, strong) NSURL *authUrl;
@property (nonatomic, strong) NSURL *tokenUrl;
@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic, strong) NSString *scope;
@property (nonatomic, strong) NSURL *redirectUri;
@property (nonatomic, strong) NSString *scheme;

+ (instancetype)sharedInstance;

- (void)authenticateInViewController:(UIViewController *)viewController;
- (void)retrieveCodeFromUrl:(NSURL *)url;
- (BOOL)signedIn;
- (void)signOut;
- (void)accessToken:(void (^)(NSString *accessToken))completion;

@end
