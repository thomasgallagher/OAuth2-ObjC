//
//  ViewController.m
//  OAuth2-ObjC
//
//  Created by Tom Gallagher on 27/04/2016.
//  Copyright © 2016 Tom Gallagher. All rights reserved.
//

#import "ViewController.h"
#import "OAuth2Client.h"
#import "AFHTTPSessionManager.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signInNotificaitonReceived:) name:kOAuth2SignedInNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(signOutNotificaitonReceived:) name:kOAuth2SignedOutNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setButtonState];
}

- (void)signInNotificaitonReceived:(NSNotification *)notification {
    [self getCredientialsFromApi];
    [self setButtonState];
}

- (void)signOutNotificaitonReceived:(NSNotification *)notification {
    [self setButtonState];
}

- (void)setButtonState {
    NSString *buttonTitle;
    BOOL signedIn = [[OAuth2Client sharedInstance] signedIn];

    if (signedIn) {
        buttonTitle = @"Sign Out";
        self.callApiButton.hidden = NO;
    } else {
        buttonTitle = @"Sign in with OAuth2";
        self.callApiButton.hidden = YES;
    }
    
    [self.authButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (IBAction)buttonTouched:(id)sender {
    BOOL signedIn = [[OAuth2Client sharedInstance] signedIn];
    
    if (signedIn) {
        [[OAuth2Client sharedInstance] signOut];
    } else {
        [[OAuth2Client sharedInstance] authenticateInViewController:self];
    }
}

- (IBAction)callApiTouched:(id)sender {
    [self getCredientialsFromApi];
}

#pragma mark API

- (void)getCredientialsFromApi {
    [[OAuth2Client sharedInstance] accessToken:^(NSString *accessToken) {
        if (accessToken != nil) {
            // Make your API call here using AF Networking 3.0
        } else {
            NSLog(@"API: Error: Access token is nil.");
        }
    }];
}

#pragma mark Remove observers

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
