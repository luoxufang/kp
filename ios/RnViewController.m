//
//  RnViewController.m
//  NineOneCP
//
//  Created by 啦啦啦 on 2018/4/12.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "RnViewController.h"

#import <CodePush/CodePush.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface RnViewController ()

@end

@implementation RnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *jsCodeLocation;
  
  
      #ifdef DEBUG
          jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
      #else
          jsCodeLocation = [CodePush bundleURL];
      #endif
  
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"NineOneCP"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    self.view = rootView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
