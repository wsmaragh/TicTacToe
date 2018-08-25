//
//  UIView+borders.h
//  TicTacToe
//
//  Created by Winston Maragh on 8/25/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (borders)
- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth;
@end

