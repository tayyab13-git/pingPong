//
//  menuVC.swift
//  pingPong
//
//  Created by Max on 22/08/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

enum gameType {
    case easy
    case medium
    case hard
    case player2
}

class menuVC: UIViewController {

    
    @IBAction func easy(_ sender: Any) {
        moveTo(game: .easy)
    }
    
    @IBAction func medium(_ sender: Any) {
        moveTo(game: .medium)
    }
    
    @IBAction func hard(_ sender: Any) {
        moveTo(game: .hard)
    }
    
    @IBAction func player2(_ sender: Any) {
        moveTo(game: .player2)
    }
    
    func moveTo(game: gameType){
        
        let gameVC  = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        currentGameType = game
        self.navigationController?.pushViewController(gameVC, animated: true)
        
    }
    
}

