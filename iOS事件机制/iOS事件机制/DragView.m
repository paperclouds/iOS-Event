//
//  DragView.m
//  iOS事件机制
//
//  Created by paperclouds on 17/2/18.
//  Copyright © 2017年 paperclouds. All rights reserved.
//

#import "DragView.h"

@implementation DragView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    //获取当前触摸操作的位置坐标
    CGPoint loc = [aTouch locationInView:self];
    //获取上一个触摸点的位置坐标
    CGPoint preloc = [aTouch previousLocationInView:self];
    CGRect myFrame = self.frame;
    //改变View的x、y坐标值
    float deltaX = loc.x - preloc.x;
    float deltaY = loc.y - preloc.y;
    myFrame.origin.x += deltaX;
    myFrame.origin.y += deltaY;
    
    // 重新设置View的显示位置
    [self setFrame:myFrame];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
