#
# Be sure to run `pod lib lint OAuth2-ObjC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OAuth2-ObjC"
  s.version          = "0.1.0"
  s.summary          = "Simple lightweight OAuth2 client for iOS 9 and above."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
Written in Objective-C and available as a CocoaPod. Built with AFNetowrking 3.1. Simple .plist configuration. Uses a `WKWebView` (via STKWebKitViewController) to avoid app switching whilst authenticating. Securely persists tokens to `NSUserDefaults`. Fires an `NSNotification` on sign in and sign out. Automatic access token refreshing (if a refresh token is provided by your server).
                       DESC

  s.homepage         = "https://github.com/thomasgallagher/OAuth2-ObjC"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Tom Gallagher" => "tom.gallagher@theappengineers.com" }
  s.source           = { :git => "https://github.com/thomasgallagher/OAuth2-ObjC.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/tomgallagher'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'OAuth2-ObjC' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'STKWebKitViewController', '~> 0.5'
  s.dependency 'AFNetworking', '~> 3.1'
end
