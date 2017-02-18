//
//  ScrollView.h
//  iOS事件机制
//
//  Created by paperclouds on 17/2/18.
//  Copyright © 2017年 paperclouds. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 2.滑动事件
    滑动事件一般包括上下滑动和左右滑动，判断是否是一次成功的滑动事件需要考虑一些问题，比如大部分情况下，用户进行一次滑动操作，这次滑动是否是在一条直线上？或者是否是基本能保持一条直线的滑动轨迹。或者判断是上下滑动还是左右滑动等。另外，滑动手势一般有一个起点和一个终点，期间是在屏幕上画出的一个轨迹，所以需要对这两个点进行判断。
 */

@interface ScrollView : UIView

@end
