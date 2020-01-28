#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "RsaAndBase64.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSThread sleepForTimeInterval:1];
     self.controller = (FlutterViewController*)self.window.rootViewController;
  [self configureFlutterEngine];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


- (void) configureFlutterEngine{
    [self registerEncocd];
}


//注册加密模块
- (void)registerEncocd{
         FlutterMethodChannel* encodeChannel = [FlutterMethodChannel
                                                 methodChannelWithName:@"www.guigug.com/rsa_and_base64"
                                                 binaryMessenger:self.controller ];

         [encodeChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            if ([@"encode" isEqualToString:call.method]) {
              result([RsaAndBase64 rsaAndBase64Encode:call.arguments[@"plaint"]]);
            } else {
              result(FlutterMethodNotImplemented);
            }         }];
}
@end
