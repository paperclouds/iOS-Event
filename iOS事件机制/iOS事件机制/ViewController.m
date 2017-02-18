//
//  ViewController.m
//  iOS事件机制
//
//  Created by paperclouds on 17/2/18.
//  Copyright © 2017年 paperclouds. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

/*UIResponder中定义了一系列对事件的处理方法，他们分别是：
 
 –(void)touchesBegan:(NSSet )touches withEvent:(UIEvent )event
 –(void)touchesMoved:(NSSet )touches withEvent:(UIEvent )event
 –(void)touchesEnded:(NSSet )touches withEvent:(UIEvent )event
 –(void)touchesCancelled:(NSSet )touches withEvent:(UIEvent )event
 
 从方法名字可以知道，他们分别对应了屏幕事件的开始、移动、结束和取消几个阶段，前三个阶段理解都没问题，最后一个取消事件的触发时机是在诸如突然来电话或是系统杀进程时调用。这些方法的第一个参数定义了UITouch对象的一个集合(NSSet)，它的数量表示了这次事件是几个手指的操作，目前iOS设备支持的多点操作手指数最多是5。第二个参数是当前的UIEvent对象。
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *views = @[@"TouchView",@"ScrollView",@"DragView",@"PinchView"];
    NSArray *titleArray = @[@"双击",@"左右滑动",@"拖拽",@"缩放"];
    for (int i = 0; i < views.count; i++) {
        const char *className = [views[i] cStringUsingEncoding:NSASCIIStringEncoding];
        Class newClass = objc_getClass(className);
        UIView *view = [newClass new];
        view.frame = CGRectMake(0, screenHeight/4*i, screenWidth, screenHeight/4);
        view.backgroundColor = [self randomColor];
        [self.view addSubview:view];
        
        UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(100, screenHeight/12+i*screenHeight/4, 175, screenHeight/12)];
        titleLbl.text = titleArray[i];
        titleLbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:titleLbl];
    }
}

- (UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
