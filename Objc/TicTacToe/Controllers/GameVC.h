//
//  GameVC.h
//  TicTacToe
//
//  Created by Winston Maragh on 8/25/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brain.h"

@interface GameVC : UIViewController

@property (strong, nonatomic) Brain* brain;
@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UIStackView* boardStackView;
@property (strong, nonatomic) UILabel* descriptionLabel;
@property (strong, nonatomic) UIButton* resetButton;

@end
