//
//  MenuView.m
//  XMAdvGame
//
//  Created by Gordon on 15/7/21.
//  Copyright (c) 2015年 Gordon. All rights reserved.
//

#import "MenuView.h"

@interface MenuView ()

@property (nonatomic, strong) UIImageView *titleImageView;

@end

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2 - 170, 280, 90)];
        if ([UIScreen mainScreen].bounds.size.height == 320) {
//            self.titleImageView.frame = CGRectMake(0, 110, 260, 60);
        }
//        self.titleImageView.backgroundColor = [UIColor cyanColor];
//        self.titleImageView.image = [UIImage imageNamed:@"标题"];
//        [self addSubview:self.titleImageView];
      
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image = [UIImage imageNamed:@"bg_1@2x.jpg"];
        [self addSubview:imageView];
      
      
        self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //        self.startButton.frame = CGRectMake(0, self.frame.size.height / 2 + 30, 210, 60);
        self.startButton.frame = CGRectMake(0, 470, 240, 60);
        [self.startButton setBackgroundImage:[UIImage imageNamed:@"btn_start@2x.png"] forState:UIControlStateNormal];
        [self.startButton setBackgroundImage:[UIImage imageNamed:@"btn_start@2x.png"] forState:UIControlStateHighlighted];
        [self addSubview:self.startButton];
      
        
        self.guanYuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.guanYuButton.frame = CGRectMake(0, self.startButton.frame.origin.y + 80, 240, 60);
        [self.guanYuButton setBackgroundImage:[UIImage imageNamed:@"btn_about@2x.png"] forState:UIControlStateNormal];
        [self.guanYuButton setBackgroundImage:[UIImage imageNamed:@"btn_about@2x.png"] forState:UIControlStateHighlighted];
        [self addSubview:self.guanYuButton];
        
        if ([UIScreen mainScreen].bounds.size.width == 768) {
//            self.titleImageView.frame = CGRectMake(0, 140, 600, 170);
            self.startButton.frame = CGRectMake(0, self.frame.size.height / 2, 350, 100);
            self.guanYuButton.frame = CGRectMake(0, self.startButton.frame.origin.y + 150,350, 100);
//          self.startButton.frame = CGRectMake(0, 80, 240, 60);
//          self.guanYuButton.frame = CGRectMake(60, self.startButton.frame.origin.y + 80, 240, 60);
        }
      
//        self.titleImageView.center = CGPointMake(self.center.x, self.titleImageView.center.y);
        self.startButton.center = CGPointMake(self.center.x, self.startButton.center.y);
        self.guanYuButton.center = CGPointMake(self.center.x, self.guanYuButton.center.y);

    }
    return self;
}

@end
