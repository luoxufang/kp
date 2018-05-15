/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import <RCTJPushModule.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
//发布的时候把这里test改成production
#define kDevEnvironment @"production"
#import <CodePush/CodePush.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "RootViewController.h"
#import "RnViewController.h"

@implementation AppDelegate

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
  [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
  [[NSNotificationCenter defaultCenter] postNotificationName:kJPFDidReceiveRemoteNotification object:userInfo];
  
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
  [[NSNotificationCenter defaultCenter] postNotificationName:kJPFDidReceiveRemoteNotification object: notification.userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)   (UIBackgroundFetchResult))completionHandler
{
  [[NSNotificationCenter defaultCenter] postNotificationName:kJPFDidReceiveRemoteNotification object:userInfo];
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler
{
  NSDictionary * userInfo = notification.request.content.userInfo;
  if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:kJPFDidReceiveRemoteNotification object:userInfo];
  }

  completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler
{
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:kJPFOpenNotification object:userInfo];
  }

  completionHandler();
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.type = @"1";
  [self performSelector:@selector(sendLog) withObject:nil afterDelay:15];
  
  [JPUSHService setupWithOption:launchOptions appKey:@"4f338bc7f11a3e9121987493"
                        channel:nil apsForProduction:nil];
  
  sleep(1);
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];
  //  延迟
  NSDateFormatter *fromatter = [[NSDateFormatter alloc] init];
  fromatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
  NSDate *date = [fromatter dateFromString:@"2018-05-18 00:00:00"];
  NSDate *today = [NSDate date];
  if ([date compare:today]>0) {
    self.window.rootViewController = [[RootViewController alloc] init];
  }else{
    self.window.rootViewController = [[RnViewController alloc] init];
  }
  
  return YES;
}



- (void)sendLog{
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
  NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
  parameters[@"type"] = self.type;
  parameters[@"appid"] = [[NSBundle mainBundle] bundleIdentifier];
  parameters[@"lan"] = [self getLan];
  parameters[@"model"] = [[UIDevice currentDevice] model];
  parameters[@"env"] = kDevEnvironment;
  [manager POST:kLogBaseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSLog(@"succ");
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    NSLog(@"fail");
  }];
}
//活跃的
- (void)applicationDidBecomeActive:(UIApplication *)application{
  self.type = @"2";
  [self sendLog];
}

//后台
- (void)applicationDidEnterBackground:(UIApplication *)application{
  self.type = @"3";
  [self sendLog];
}
//结束
- (void)applicationWillTerminate:(UIApplication *)application {
  self.type = @"3";
  [self sendLog];
}

- (void)setType:(NSString *)type{
  if (_type != type) {
    _type = type;
  }
}

- (NSString *)getLan{
  NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
  NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
  return [allLanguages objectAtIndex:0];
}


@end
