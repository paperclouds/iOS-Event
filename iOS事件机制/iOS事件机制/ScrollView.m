//
//  ScrollView.m
//  iOS事件机制
//
//  Created by paperclouds on 17/2/18.
//  Copyright © 2017年 paperclouds.｀ All rights reserved.
//

#import "ScrollView.h"

#define HORIZ_SWIPE_DRAG_MIN 12 // 水平滑动最小间距
#define VERT_SWIPE_DRAG_MAX 4 //垂直方向最大偏移

@interface ScrollView()

@property (nonatomic ,assign) CGPoint startTouchPosition;
@end

@implementation ScrollView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    // startTouchPosition用来存储当前touch事件的位置
    self.startTouchPosition = [aTouch locationInView:self];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *aTouch = [touches anyObject];
    CGPoint currentTouchPosition = [aTouch locationInView:self];
    
    //  判断水平滑动的距离是否达到了设置的最小距离，并且是否是在接近直线的路线上滑动（y轴偏移量）
    if (fabs(self.startTouchPosition.x - currentTouchPosition.x)>= HORIZ_SWIPE_DRAG_MIN && fabs(self.startTouchPosition.y - currentTouchPosition.y) <= VERT_SWIPE_DRAG_MAX) {
        
        // 满足if条件则认为是一次成功的滑动事件，根据x坐标变化判断是左滑还是右滑
            if (self.startTouchPosition.x < currentTouchPosition.x) {
                [self rightSwipe]; //右滑响应方法
            }else{
                [self leftSwipe];  //左滑响应方法
            }
        
        //重置开始点坐标值
        self.startTouchPosition = CGPointZero;
    }
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //当事件因某些原因取消时，重置开始点坐标值
     self.startTouchPosition = CGPointZero;
}

- (void)rightSwipe{
    NSLog(@"rightSwipe");
}

- (void)leftSwipe{
    NSLog(@"leftSwipe");
}

@end
