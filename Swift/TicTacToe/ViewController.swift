//  ViewController.swift
//  TicTacToe
//  Created by C4Q on 10/16/17.
//  Copyright © 2017 Winston Maragh. All rights reserved.

import UIKit
import Foundation

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		self.boardSpots = [topLeft, topMid, topRight, midLeft, midMid, midRight, bottomLeft, bottomMid, bottomRight]
	}
	
	
	@IBOutlet weak var topLeft: UIButton!
	@IBOutlet weak var topMid: UIButton!
	@IBOutlet weak var topRight: UIButton!
	@IBOutlet weak var midLeft: UIButton!
	@IBOutlet weak var midMid: UIButton!
	@IBOutlet weak var midRight: UIButton!
	@IBOutlet weak var bottomLeft: UIButton!
	@IBOutlet weak var bottomMid: UIButton!
	@IBOutlet weak var bottomRight: UIButton!
	
	@IBOutlet weak var playerDisplay: UILabel!
	@IBOutlet weak var winnerDisplay: UILabel!
	
	var model = Model()
	var currentPlayer: Int = 1
	var boardSpots: [UIButton] = []
    var board = [[String]]()
	
	func resetView(){
		currentPlayer = 1
		playerDisplay.text = "Player 1 turn!"
		playerDisplay.isHidden = false
		winnerDisplay.isHidden = true
		for spot in boardSpots {
			spot.setImage(nil, for: .normal)
			spot.isUserInteractionEnabled = true
		}
	}
	
	@IBAction func restartGame(_ sender: UIButton) {
		model.resetModel()
		resetView()
	}
	
	func displayWinner() {
		guard model.winnerText != "" else { return }
		winnerDisplay.text = model.winnerText
		winnerDisplay.isHidden = false
		playerDisplay.isHidden = true
		for spot in boardSpots {
			spot.isUserInteractionEnabled = false
		}
    }
	
	@IBAction func selectSpot(_ sender: UIButton) {
		sender.isUserInteractionEnabled = false
		sender.setImage(currentPlayer == 1 ? #imageLiteral(resourceName: "boardX") : #imageLiteral(resourceName: "boardO"), for: .normal)
		if currentPlayer == 1 {
            model.playerOneChoices.append(sender.tag)
            
        }
		else { model.playerTwoChoices.append(sender.tag)}
		model.boardMoves += 1
		model.checkWin()
		displayWinner()
		currentPlayer = currentPlayer == 1 ? 2 : 1 //switch player
		playerDisplay.text = "Player \(currentPlayer) turn!"
	}
    
} //end viewController

