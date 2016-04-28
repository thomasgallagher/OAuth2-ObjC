# OAuth2-ObjC

[![CI Status](http://img.shields.io/travis/Tom Gallagher/OAuth2-ObjC.svg?style=flat)](https://travis-ci.org/Tom Gallagher/OAuth2-ObjC)
[![Version](https://img.shields.io/cocoapods/v/OAuth2-ObjC.svg?style=flat)](http://cocoapods.org/pods/OAuth2-ObjC)
[![License](https://img.shields.io/cocoapods/l/OAuth2-ObjC.svg?style=flat)](http://cocoapods.org/pods/OAuth2-ObjC)
[![Platform](https://img.shields.io/cocoapods/p/OAuth2-ObjC.svg?style=flat)](http://cocoapods.org/pods/OAuth2-ObjC)

![OAuth2](http://oauth.net/images/oauth-2-sm.png "OAuth2")

# OAuth2-ObjC
Simple lightweight OAuth2 client for iOS 9 and above.

## Introduction

- Written in Objective-C and available as a CocoaPod.
- Built with [AFNetowrking 3.1](https://github.com/AFNetworking/AFNetworking)
- Simple .plist configuration.
- Uses a `WKWebView` (via [STKWebKitViewController](https://github.com/sticksen/STKWebKitViewController)) to avoid app switching whilst authenticating.
- Securely persists tokens to `NSUserDefaults`.
- Fires an `NSNotification` on sign in and sign out.
- Automatic access token refreshing (if a refresh token is provided by your server).

## Installation

OAuth2-ObjC is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OAuth2-ObjC"
```

## Configuartion

1. If you do not already have one, [create a custom URL scheme](https://dev.twitter.com/cards/mobile/url-schemes) for your app and make a note of it - this is required in order to capture redirects back into your app from your OAuth2 server.
2. Create a OAuth2ClientCredentials.plist file and fill it with your OAuth2 credentials - an example is provided in the prject root.
3. Add `#import "OAuth2Client.h"` to the top of your `AppDelegate.m`
4. Add the following method your your `AppDelegate.m` - it caputures redirects back into your app and forwards the server code to the library which subsequently exchanges it for an access token.

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [[OAuth2Client sharedInstance] retrieveCodeFromUrl:url];
    return NO;
}
```

## Usage

1. Add `#import "OAuth2Client.h"` to the ViewController in your project that you want to sign in from.
2. Call `[[OAuth2Client sharedInstance] authenticateInViewController:self];` from the ViewController you want to sign in from - a modal browser will show and begin the OAuth2 sign in process.
3. When the user is returned - the library will fire a `kOAuth2SignedInNotification` notification.
4. You can use `[[OAuth2Client sharedInstance] accessToken]` to get your latest access token.

Note: If your server sent a refresh token this method will automatically refresh expired access tokens with no extra work.

## Signed in state

Use `BOOL signedIn = [[OAuth2Client sharedInstance] signedIn];` if you want to check the signed in status of your user.

## Sign out

Use `[[OAuth2Client sharedInstance] signOut];` to sign out - a `kOAuth2SignedOutNotification` notification will be fired on completion.

## Further development

Please submit issues and PRs for feature requests.

## Author

Tom Gallagher, tom.gallagher@theappengineers.com

## License

OAuth2-ObjC is available under the MIT license. See the LICENSE file for more info.
