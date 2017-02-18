//
//  MyView.m
//  iOS事件机制
//
//  Created by paperclouds on 17/2/18.
//  Copyright © 2017年 paperclouds. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *aTouch in touches) {
        
        if (aTouch.tapCount == 2) {
        // 处理双击事件
            [self respondToDoubleTapGesture];
        }
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)respondToDoubleTapGesture{
    NSLog(@"respondToDoubleTapGesture");
}

@end
