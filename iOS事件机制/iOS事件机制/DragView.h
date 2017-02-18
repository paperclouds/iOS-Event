//
//  DragView.h
//  iOS事件机制
//
//  Created by paperclouds on 17/2/18.
//  Copyright © 2017年 paperclouds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragView : UIView
/* 3.拖拽事件
 在屏幕上我们可以拖动某一个控件(View)进行移动，这种事件称为拖拽事件，其实现原理就是在不改变View的大小尺寸的前提下改变View的显示坐标值，为了达到动态移动的效果，我们可以在move阶段的方法中进行坐标值的动态更改
 */
@end
