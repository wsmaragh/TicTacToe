//
//  Brain.m
//  TicTacToe
//
//  Created by Winston Maragh on 8/25/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Brain.h"

@implementation Brain

-(id) init {
    self = [super init];
    if (self) {
        _isPlayerOnesTurn = YES;
        _gameBoard = [[NSMutableArray alloc] initWithArray:@[
                                                             [[NSMutableArray alloc] initWithArray: @[@0,@0,@0]],
                                                             [[NSMutableArray alloc] initWithArray: @[@0,@0,@0]],
                                                             [[NSMutableArray alloc] initWithArray: @[@0,@0,@0]]
                                                             ]
                      ];
    }
    return self;
}


- (GameStatus)makeMoveAtX:(int)x andY:(int)y {
    if (x < 0 || y < 0 || x > 2 || y > 2) {
        return GameStatus_InvalidMove;
    }
    if (!([self.gameBoard[x][y] isEqual:@0])) {
        return GameStatus_InvalidMove;
    }
    //Make Move
    if (self.isPlayerOnesTurn) {
        self.gameBoard[x][y] = @1;
    } else {
        self.gameBoard[x][y] = @2;
    }
    self.isPlayerOnesTurn = !self.isPlayerOnesTurn;
    
    
    
    //Check if Horizontal Win
    for (int i = 0; i < 3; i++) {
        switch ([self checkArrayForWinningPlayer:self.gameBoard[i]]) {
            case 1:
                return GameStatus_PlayerOneWins;
                break;
            case 2:
                return GameStatus_PlayerTwoWins;
                break;
            default:
                break;
        }
    }
    
    //Check if Vertical Win
    for (int y = 0; y < 3; y++) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (int x = 0; x < 3; x++) {
            [arr addObject:self.gameBoard[x][y]];
        }
        switch ([self checkArrayForWinningPlayer:arr]) {
            case 1:
                return GameStatus_PlayerOneWins;
                break;
            case 2:
                return GameStatus_PlayerTwoWins;
                break;
            default:
                break;
        }
    }
    
    //Check Diagonal Win
    NSMutableArray *leftDiagonal = [[NSMutableArray alloc] init];
    NSMutableArray *RightDiagonal = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 3; i++) {
        [leftDiagonal addObject:self.gameBoard[i][i]];
        [RightDiagonal addObject:self.gameBoard[i][self.gameBoard.count - 1 - i]];
    }
    
    //check if win on Left Diagonal
    switch ([self checkArrayForWinningPlayer: leftDiagonal]) {
        case 1:
            return GameStatus_PlayerOneWins;
            break;
        case 2:
            return GameStatus_PlayerTwoWins;
            break;
        default:
            break;
    }
    
    //check if win on Right Diagonal
    switch ([self checkArrayForWinningPlayer: RightDiagonal]) {
        case 1:
            return GameStatus_PlayerOneWins;
            break;
        case 2:
            return GameStatus_PlayerTwoWins;
            break;
        default:
            break;
    }
    
    
    //Check for in progress
    for (int x = 0; x < 3; x++) {
        for (int y = 0; y < 3; y++) {
            if ([self.gameBoard[x][y] isEqual:@0]) {
                if (self.isPlayerOnesTurn) {
                    return GameStatus_InProgressPlayerOneTurn;
                } else {
                    return GameStatus_InProgressPlayerTwoTurn;
                }
            }
        }
    }
    return GameStatus_Tie;
    
    
}

//-(Winner) checkWinner {
//
//}

-(int) checkArrayForWinningPlayer:(NSMutableArray*) arr {
    if ([arr isEqual:@[@1,@1,@1]])
        return 1;
    if ([arr isEqual:@[@2,@2,@2]])
        return 2;
    return 0;
}


@end
