# OAuth2-ObjC

![OAuth2](http://oauth.net/images/oauth-2-sm.png "OAuth2")

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

OAuth2-ObjC is available through [CocoaPods](http://cocoapods.org).

To install it, simply add the following line to your Podfile:

```ruby
pod 'OAuth2-ObjC', :git => 'git://github.com/thomasgallagher/OAuth2-ObjC.git'
```

## Configuartion

1. If you do not already have one, [create a custom URL scheme](https://dev.twitter.com/cards/mobile/url-schemes) for your app and make a note of it - required to capture redirects back into your app from your OAuth2 server.
2. Add `LSApplicationQueriesSchemes` as an array to your `Info.plist`, then add your custom scheme name as the first item (without the :// suffix) as an entry - gives permission to the WKWebView to handle the re-direction back to your app.
3. Create a OAuth2ClientCredentials.plist file and fill it with your OAuth2 credentials - a sample version is provided in the example project.
4. Add `#import "OAuth2Client.h"` to the top of your `AppDelegate.m`
5. Add the following method your your `AppDelegate.m` - caputures auth redirects back into your app from your OAuth2 server and forwards the server code to the library which subsequently exchanges it for an access token.

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [[OAuth2Client sharedInstance] retrieveCodeFromUrl:url];
    return NO;
}
```

## Usage

1. Add `#import "OAuth2Client.h"` to the ViewController in your project that you want to auth from.
2. Call `[[OAuth2Client sharedInstance] authenticateInViewController:self];` - a modal browser will show and begin the OAuth2 auth process.
3. When the user is returned - the library will fire a `kOAuth2SignedInNotification` notification.

## Access token
You can use your access token from anywhere in your app - if your server sent a refresh token then this method will automatically refresh your expired access token with no extra work.

```
[[OAuth2Client sharedInstance] accessToken:^(NSString *accessToken) {
    if (accessToken != nil) {
        // Make your API call here using AF Networking 3.0
    } else {
        NSLog(@"API: Error: Access token is nil.");
    }
}];
```

## Signed in state

Use `BOOL signedIn = [[OAuth2Client sharedInstance] signedIn];` if you want to check the signed in status of your user.

## Sign out

Use `[[OAuth2Client sharedInstance] signOut];` to sign out - a `kOAuth2SignedOutNotification` notification will be fired on completion.

## Further development

Please submit issues and PRs for feature requests.

## License

OAuth2-ObjC is available under the MIT license. See the LICENSE file for more info.
