//
//  PinchView.m
//  iOS事件机制
//
//  Created by paperclouds on 17/2/18.
//  Copyright © 2017年 paperclouds. All rights reserved.
//

#import "PinchView.h"

@implementation PinchView
{
    // 是否进行缩放
    BOOL pinchZoom;
    //缩放前两个触摸点间的距离
    CGFloat previousDistance;
    // 缩放比例
    CGFloat zoomFactor;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        pinchZoom = NO;
        previousDistance = 0.0f;
        zoomFactor = 1.0f;
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (event.allTouches.count == 2) {
        pinchZoom = YES;
        NSArray *touches = [event.allTouches allObjects];
        //接收两个手指的触摸操作
        CGPoint pointOne = [[touches objectAtIndex:0]locationInView:self];
        CGPoint pointTwo = [[touches objectAtIndex:1]locationInView:self];
        //计算出缩放前后两个手指间的距离绝对值（勾股定理）
        previousDistance = sqrt(pow(pointOne.x-pointTwo.x, 2.0f)+pow(pointOne.y-pointTwo.y, 2.0f));
    }else{
        pinchZoom = NO;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (YES == pinchZoom && event.allTouches.count == 2) {
        NSArray *touches = [event.allTouches allObjects];
        CGPoint pointOne = [[touches objectAtIndex:0] locationInView:self];
        CGPoint pointTwo = [[touches objectAtIndex:1] locationInView:self];
        //两个手指移动过程中，两点之间距离
        CGFloat distance = sqrt(pow(pointOne.x - pointTwo.x, 2.0f) +
                                pow(pointOne.y - pointTwo.y, 2.0f));
        
        //换算出缩放比例
        zoomFactor += (distance - previousDistance)/previousDistance;
        zoomFactor = fabs(zoomFactor);
        previousDistance = distance;
        
        //缩放
        self.layer.transform = CATransform3DMakeScale(zoomFactor, zoomFactor, 1.0f);
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (event.allTouches.count != 2) {
        pinchZoom = NO;
        previousDistance = 0.0f;
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
