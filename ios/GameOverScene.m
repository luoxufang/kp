//
//  GameOverScene.m
//  XMAdvGame
//
//  Created by Gordon on 15/7/21.
//  Copyright (c) 2015年 Gordon. All rights reserved.
//

#import "GameOverScene.h"
#import "FirstGameScene.h"
#import "MenuViewController.h"
#import "TimeManager.h"
#import "RootViewController.h"

@implementation GameOverScene

- (instancetype)initWithSize:(CGSize)size time:(float)time num:(int)num
{
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
      
//        SKLabelNode *label = [SKLabelNode labelNodeWithText:@"啊！小明掉下去了！"];
//        label.fontSize = 37;
        if ([UIScreen mainScreen].bounds.size.width == 375 || [UIScreen mainScreen].bounds.size.width == 414) {
            
//            if ([TimeManager shareInstance].timeCount >= 60.0f && [TimeManager shareInstance].timeCount < 120.0f) {
//                label.text = @"哎哟不错哦！居然挺过了1分钟！";
//                label.fontSize = 25;
//            }
//            if ([TimeManager shareInstance].timeCount >= 120.0f && [TimeManager shareInstance].timeCount < 180.0f) {
//                label.text = @"坚持了2分钟的你离胜利已经不远了！";
//                label.fontSize = 22;
//            }
//            if ([TimeManager shareInstance].timeCount >= 180.0f && [TimeManager shareInstance].timeCount < 240.0f) {
//                label.text = @"居然过了三分钟！但你依然坚持不到四分钟的！";
//                label.fontSize = 21;
//            }
//            if ([TimeManager shareInstance].timeCount >= 240.0f) {
//                label.text = @"你是电！你是光！你是唯一的神话！";
//                label.fontSize = 21;
//            }
        }
      
//        UIImageView *imageView = [[UIImageView alloc] initWithSize:self.size];
//        imageView.image = [UIImage imageNamed:@"bg_1@2x.jpg"];
//        [self addChild:imageView];
      
//        label.fontColor = [SKColor blackColor];
//        label.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 160);
//        [self addChild:label];
      
        SKSpriteNode *node = [[SKSpriteNode alloc] initWithImageNamed:@"bg_2@2x.jpg"];
        node.position = CGPointMake(self.size.width / 2, self.size.height /2);
        node.size = self.size;
        [self addChild:node];
      
      
//        SKSpriteNode *startNode2 = [[SKSpriteNode alloc] initWithColor:[UIColor clearColor] size:CGSizeMake(310, 310)];
//        startNode2.texture = [SKTexture textureWithImageNamed:@"youlose"];
//        startNode2.position = CGPointMake(self.size.width / 2, self.size.height /2 + 220);
//        startNode2.name = @"youlose";
//        [self addChild:startNode2];
      
        SKLabelNode *timeLabel2 = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"YOUR SCORE",[TimeManager shareInstance].timeCount]];
        timeLabel2.fontSize = 38;
        timeLabel2.fontColor = [SKColor blackColor];
        timeLabel2.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 104);
        if ([[UIScreen mainScreen]bounds].size.width == 768) {
          timeLabel2.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 158);
        }
        [self addChild:timeLabel2];
      
        SKLabelNode *timeLabel = [SKLabelNode labelNodeWithText:[NSString stringWithFormat:@"%0.1fs",[TimeManager shareInstance].timeCount]];
        timeLabel.fontSize = 46;
        if ([[UIScreen mainScreen]bounds].size.width == 768) {
           timeLabel.fontSize = 66;
        }
        timeLabel.fontColor = [SKColor blackColor];
        timeLabel.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 36);
        [self addChild:timeLabel];
      
      
      
      
      
        if ([UIScreen mainScreen].bounds.size.width == 320) {
//            label.fontSize = 28;
          
//            if ([TimeManager shareInstance].timeCount >= 60.0f && [TimeManager shareInstance].timeCount < 120.0f) {
//                label.text = @"哎哟不错哦！居然挺过了1分钟！";
//                label.fontSize = 18;
//            }
//            if ([TimeManager shareInstance].timeCount >= 120.0f && [TimeManager shareInstance].timeCount < 180.0f) {
//                label.text = @"坚持了2分钟的你离胜利已经不远了！";
//                label.fontSize = 18;
//            }
//            if ([TimeManager shareInstance].timeCount >= 180.0f && [TimeManager shareInstance].timeCount < 240.0f) {
//                label.text = @"居然过了三分钟！但你依然坚持不到四分钟的！";
//                label.fontSize = 15;
//            }
//            if ([TimeManager shareInstance].timeCount >= 240.0f) {
//                label.text = @"你是电！你是光！你是唯一的神话！";
//                label.fontSize = 18;
//            }
//            label.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 130);
          
            timeLabel.fontSize = 17;
            
            
        }
      
        SKSpriteNode *startNode = [[SKSpriteNode alloc] initWithColor:[UIColor clearColor] size:CGSizeMake(280, 66)];
        startNode.texture = [SKTexture textureWithImageNamed:@"btn_start@2x.png"];
        startNode.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 50);
        startNode.name = @"btn_start@2x";
        [self addChild:startNode];
        
        
        SKSpriteNode *returnNode = [[SKSpriteNode alloc] initWithColor:[UIColor clearColor] size:CGSizeMake(280, 66)];
        returnNode.texture = [SKTexture textureWithImageNamed:@"btn_return@2x.png"];
        returnNode.position = CGPointMake(self.size.width / 2, CGRectGetMinY(startNode.frame) - timeLabel.frame.size.height * 2.0 - 16);
        returnNode.name = @"btn_return@2x";
        [self addChild:returnNode];
        
        if ([UIScreen mainScreen].bounds.size.width == 768) {
//            label.fontSize = 80;
//            if ([TimeManager shareInstance].timeCount >= 60.0f && [TimeManager shareInstance].timeCount < 120.0f) {
//                label.text = @"哎哟不错哦！居然挺过了1分钟！";
//                label.fontSize = 45;
//            }
//            if ([TimeManager shareInstance].timeCount >= 120.0f && [TimeManager shareInstance].timeCount < 180.0f) {
//                label.text = @"坚持了2分钟的你离胜利已经不远了！";
//                label.fontSize = 45;
//            }
//            if ([TimeManager shareInstance].timeCount >= 180.0f && [TimeManager shareInstance].timeCount < 240.0f) {
//                label.text = @"居然过了三分钟！但你依然坚持不到四分钟的！";
//                label.fontSize = 36;
//            }
//            if ([TimeManager shareInstance].timeCount >= 240.0f) {
//                label.text = @"你是电！你是光！你是唯一的神话！";
//                label.fontSize = 45;
//            }
          
            timeLabel.fontSize = 40;
            startNode.size = CGSizeMake(350, 100);
            returnNode.size = CGSizeMake(350, 100);
//            label.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 220);
            timeLabel.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 100);
            startNode.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 50);
            returnNode.position = CGPointMake(self.size.width / 2, CGRectGetMinY(startNode.frame) - 100);
        }
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    SKNode *node = [self nodeAtPoint:touchLocation];
    
    if ([node.name isEqualToString:@"btn_start@2x"]) {
        SKTransition *reveal = [SKTransition flipVerticalWithDuration:0.5];
        FirstGameScene *fgs = [[FirstGameScene alloc]initWithSize:self.size];
        [self.view presentScene:fgs transition:reveal];
    } else if ([node.name isEqualToString:@"btn_return@2x"]) {
        [RootViewController shareInstance].mvc = [[MenuViewController alloc]init];
        [UIView transitionFromView:[RootViewController shareInstance].gvc.view toView:[RootViewController shareInstance].mvc.view duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:nil];
    }
}

@end
