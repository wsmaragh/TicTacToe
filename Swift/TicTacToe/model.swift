//  Model.swift
//  TicTacToe
//  Created by C4Q on 10/24/17.
//  Copyright © 2017 Winston Maragh. All rights reserved.

import Foundation
import UIKit

class Model {
	var winningCombos:[Set<Int>] = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	var playerOneChoices = [Int]()
	var playerTwoChoices = [Int]()
	var playerWon: Bool = false
	var winnerText: String = ""
	var boardMoves = 0
    var board = [[String]]()

	
	func resetModel() {
		playerOneChoices = []
		playerTwoChoices = []
		playerWon = false
		winnerText = ""
		boardMoves = 0
	}
	
	func checkWin() {
		for nums in winningCombos {
			if nums.isSubset(of: playerOneChoices) {
				playerWon = true
				winnerText = "Player 1 wins!"
				return
			} else if nums.isSubset(of: playerTwoChoices) {
				playerWon = true
				winnerText = "Player 2 wins!"
				return
			} else if boardMoves == 9 && playerWon == false {
				winnerText = "Draw!"
				return
			}
		}
	}
    
    //check win
    func checkWinV2(arr: [[String]]) -> String {
        var lastIndex: Int = arr.count - 1
        var char: String
        
        //Horizontal
        for i in 0...lastIndex {
            char = arr[i][0]
            for j in 1..<arr.count {
                if char != arr[i][j] {break}
                if j == lastIndex {return char}
            }
        }
        
        //Vertical
        for i in 0...lastIndex {
            char = arr[0][i]
            for j in 0..<arr.count {
                if char != arr[j][i] {break}
                if j == lastIndex {return char}
            }
        }
        
        
//        let midChar = arr[(arr.count-1)/2][(arr.count-1)/2]
        
        //Left Diagonal
        char = arr[0][0]
        for i in 0...lastIndex {
            if char != arr[i][i] {break}
            if i == lastIndex {return char}
//            if midChar != arr[i][i] {break}
//            if i == lastIndex {return midChar}
        }
        
        //Right Diagonal
        char = arr[0][lastIndex]
        for i in 0..<arr.count {
            if char != arr[i][i] {break}
            if i == lastIndex {return char}
//            if midChar != arr[i][arr.count-1-i] {break}
//            if i == lastIndex {return midChar}
        }
        
        return "No Winner"
    }
    
	/*
	func AIplayer() {
	//AI logic (has 4 moves)
	
     
     //All spots on the board = corners(4), center (1), or diamond (4)
     
    
    //Option: A
     if humanFirstMove = (1 || 3 || 7 || 9) { //corners
        aiFirstMove = 5 //center
     }

	
    //Option: B
     if humanFirstMove = 5 { //center
        aiFirstMove = 1 //Left corner
     }
     if humanSecondMove = 9 { //center
        aiSecondMove = 3 //right corner - force human to play in between at 2
     }
     
	
    //Option: C - go left
     if humanFirstMove = 2 { //top diamond
        aiFirstMove = 1 //Left corner
     
     }
     
    //Option: D - go left
     if humanFirstMove = 8 { //top diamond
        aiFirstMove = 7 //Left corner
     
     }
	
     //Option: E - go up
     if humanFirstMove = 4 { //top diamond
        aiFirstMove = 1 //Left corner
     
     }
     
     //Option: F - go up
     if humanFirstMove = 6 { //top diamond
        aiFirstMove = 3 //right corner
     
     }

     switch humanFirstMove {
         case 1,3,7,9: aiFirstMove = 5
         case 2,4,5: aiFirstMove = 1
         case 8: aiFirstMove = 7
         case 6: aiFirstMove = 3
     }
     
     

	*/
	
}

class Brain {
    func checkWinV2(arr: [[String]]) -> String {
        var char: String
        let midChar = arr[(arr.count-1)/2][(arr.count-1)/2]
        
        //Horizontal
        for i in 0..<arr.count {
            char = arr[i][0]
            for j in 1..<arr.count {
                if char != arr[i][j] {break}
                if j == arr.count - 1 {return char}
            }
        }
        
        //Vertical
        for i in 0..<arr.count {
            char = arr[0][i]
            for j in 0..<arr.count {
                if char != arr[j][i] {break}
                if j == arr.count - 1 {return char}
            }
        }
        
        
        //Left Diagonal
        for i in 0..<arr.count {
            if midChar != arr[i][i] {break}
            if i == arr.count - 1 {return midChar}
        }
        
        //Right Diagonal
        for i in 0..<arr.count {
            if midChar != arr[i][arr.count-1-i] {break}
            if i == arr.count - 1 {return midChar}
        }
        
        return "No Winner"
    }
    
    
    
    
    /*
     func AIplayer() {
     AI logic (has 4 moves)
     
     NESTED 1 - AI 1st move:
     -if human plays the corners (1,3,7,9), AI plays center (5)
     AI 2nd move:
     
     
     -if human plays center, AI plays left corner (1)
     AI 2nd move:
     
     
     -if human plays 2 - AI play 1 (left of it)
     AI 2nd move:
     
     
     -if human plays 4, AI play 1 (top of it)
     AI 2nd move:
     
     
     
     -if human plays 6, AI play 3 (top of it)
     AI 2nd move:
     
     
     
     -if human plays 8, AI play 7 (left of it)
     AI 2nd move:
     }
     */
    

    

}



