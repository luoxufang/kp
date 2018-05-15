//
//  MenuViewController.m
//  XMAdvGame
//
//  Created by Gordon on 15/7/21.
//  Copyright (c) 2015年 Gordon. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"
#import "FirstGameScene.h"
#import "RootViewController.h"

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.menuView = [[MenuView alloc] initWithFrame:self.view.bounds];
    self.menuView.backgroundColor = [UIColor whiteColor];
    [self.menuView.startButton addTarget:self action:@selector(startButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.guanYuButton addTarget:self action:@selector(guanYuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuView];
}

#pragma mark - menu页面两个button的点击方法
- (void)startButton:(id)sender
{
    [RootViewController shareInstance].gvc = [[GameViewController alloc] init];
    NSLog(@"开始游戏");
//    [self presentViewController:[RootViewController shareInstance].gvc animated:YES completion:nil];
    [UIView transitionFromView:self.view toView:[RootViewController shareInstance].gvc.view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
}

- (void)guanYuButton:(id)sender
{
    NSLog(@"关于游戏");
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"About Me" message:@"This game is very simple and interesting，but it will increase with time.Believe this adventure game can make you like it" delegate:self cancelButtonTitle:@"Comfirm" otherButtonTitles:nil, nil];
    [alertView show];

}

@end
