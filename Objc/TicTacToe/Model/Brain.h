//
//  Brain.h
//  TicTacToe
//
//  Created by Winston Maragh on 8/25/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

#import <Foundation/Foundation.h>

//Enum definition
typedef NS_ENUM(NSInteger, GameStatus) {
    GameStatus_Tie,
    GameStatus_PlayerOneWins,
    GameStatus_PlayerTwoWins,
    GameStatus_InProgressPlayerOneTurn,
    GameStatus_InProgressPlayerTwoTurn,
    GameStatus_InvalidMove
};

typedef NS_ENUM(NSInteger, Winner) {
    Winner_NoWinner,
    Winner_PlayerOne,
    Winner_PlayerTwo
};



@interface Brain : NSObject

@property (strong, nonatomic) NSMutableArray* gameBoard;
@property (assign) BOOL isPlayerOnesTurn;

-(GameStatus) makeMoveAtX:(int) x andY: (int) y;
//-(Winner) checkWinner;

@end
