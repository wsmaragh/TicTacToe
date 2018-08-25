//
//  GameVC.m
//  TicTacToe
//
//  Created by Winston Maragh on 8/25/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

#import "GameVC.h"
#import "UIView+borders.h"


@interface GameVC ()

@end



@implementation GameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGame];
    [self configureViews];
    [self configureConstraints];
}

-(void) setupGame {
    _brain = [[Brain alloc] init];
    _boardStackView = [[UIStackView alloc] initWithFrame:CGRectZero];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _resetButton = [[UIButton alloc] initWithFrame:CGRectZero];
}


-(void) configureViews {
    [self.view setBackgroundColor:UIColor.orangeColor];
    [self configureBoardStackView];
    [self configureLabels];
    [self configureResetButton];
}

-(void) configureLabels {
    [self.titleLabel setText:@"Tic Tac Toe"];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize: 24.0];
    [self.descriptionLabel setText:@"Player One's Turn"];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.descriptionLabel];
}


-(void) configureBoardStackView {
    [self.boardStackView setAxis:UILayoutConstraintAxisVertical];
    [self.boardStackView setDistribution:UIStackViewDistributionFillEqually];
    for (int i = 0; i < 9; i+=3) {
        [self.boardStackView addArrangedSubview:[self makeButtonStackViewStartingWith:i]];
    }
    [self.view addSubview:self.boardStackView];
}

-(void) configureResetButton {
    [self.resetButton setTitle:@"Reset Game" forState:UIControlStateNormal];
    [self.resetButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.resetButton addTarget:self action:@selector(resetGame) forControlEvents:UIControlEventTouchUpInside];
    [self.resetButton setHidden:YES];
    [self.view addSubview:self.resetButton];
}

-(void) configureConstraints {
    [self.boardStackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self.boardStackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.boardStackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[self.boardStackView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:0.5] setActive:YES];
    [[self.boardStackView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.5] setActive:YES];
    
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self.titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.titleLabel.bottomAnchor constraintEqualToAnchor: self.boardStackView.topAnchor constant:-100] setActive:YES];
    
    [self.descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self.descriptionLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.descriptionLabel.bottomAnchor constraintEqualToAnchor: self.boardStackView.topAnchor constant:-50] setActive:YES];
    
    [self.resetButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self.resetButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.resetButton.topAnchor constraintEqualToAnchor:self.boardStackView.bottomAnchor constant:50] setActive:YES];
}


-(UIStackView*)makeButtonStackViewStartingWith:(int) val {
    UIStackView *sv = [[UIStackView alloc] init];
    [sv setAxis:UILayoutConstraintAxisHorizontal];
    [sv setDistribution:UIStackViewDistributionFillEqually];
    for (int i = val; i < (val + 3); i++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"-" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [button setTag:i];
        [button addTarget:self action:@selector(handleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        if (i%3 < 2)
            [button addRightBorderWithColor:UIColor.blackColor andWidth:5];
        if (i < 6)
            [button addBottomBorderWithColor:UIColor.blackColor andWidth:5];
        [sv addArrangedSubview:button];
    }
    return sv;
}


-(void)handleButtonPress: (UIButton*) button {
    
    int x;
    int y = button.tag % 3;
    
    if (button.tag < 3) {
        x = 0;
    } else if (button.tag < 6) {
        x = 1;
    } else {
        x = 2;
    }
    
    GameStatus status = [self.brain makeMoveAtX:x andY:y];
    
    
    switch (status) {
        case GameStatus_InvalidMove:
            break;
        case GameStatus_InProgressPlayerOneTurn:
            [button setTitle:@"O" forState:UIControlStateNormal];
            [self.descriptionLabel setText:@"Player One's Turn"];
            break;
        case GameStatus_InProgressPlayerTwoTurn:
            [button setTitle:@"X" forState:UIControlStateNormal];
            [self.descriptionLabel setText:@"Player Two's Turn"];
            break;
        case GameStatus_Tie:
            [button setTitle:@"X" forState:UIControlStateNormal];
            [self.descriptionLabel setText:@"No Winner!"];
            [self endGame];
            break;
        case GameStatus_PlayerOneWins:
            [button setTitle:@"X" forState:UIControlStateNormal];
            [self.descriptionLabel setText:@"Player One Wins!"];
            [self endGame];
            break;
        case GameStatus_PlayerTwoWins:
            [button setTitle:@"O" forState:UIControlStateNormal];
            [self.descriptionLabel setText:@"Player Two Wins!"];
            [self endGame];
            break;
    }
}


-(void)endGame {
    for (UIStackView *sv in self.boardStackView.subviews) {
        for (UIButton *button in sv.subviews) {
            if ([button isKindOfClass:[UIButton class]])
                [button setEnabled:NO];
        }
    }
    [self.resetButton setHidden:NO];
}


-(void) resetGame {
    self.brain = [[Brain alloc] init];
    for (UIStackView *sv in self.boardStackView.subviews) {
        for (UIButton *button in sv.subviews) {
            if ([button isKindOfClass:[UIButton class]]) {
                [button setEnabled:YES];
                [button setTitle:@"-" forState:UIControlStateNormal];
            }
        }
    }
    [self.resetButton setHidden:YES];
    [self.descriptionLabel setText:@"New Game"];
//    [self.descriptionLabel setText:@"Player One's Turn"];
}



@end
