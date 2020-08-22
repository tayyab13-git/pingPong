//
//  GameScene.swift
//  pingPong
//
//  Created by Max on 21/08/2020.
//  Copyright © 2020 Max. All rights reserved.
//

import SpriteKit
import GameplayKit


var currentGameType = gameType.easy

class GameScene: SKScene {
    
    private var ball = SKSpriteNode()
    private var enemy = SKSpriteNode()
    private var main = SKSpriteNode()
    private var toplbl = SKLabelNode()
    private var btmlbl = SKLabelNode()
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        ball   = self.childNode(withName: "ball") as! SKSpriteNode
        enemy  = self.childNode(withName: "enemy") as! SKSpriteNode
        main   = self.childNode(withName: "main") as! SKSpriteNode
        toplbl = self.childNode(withName: "topLabel") as! SKLabelNode
        btmlbl = self.childNode(withName: "bottomLabel") as! SKLabelNode
        
        
        let border = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        startGame()

    }
    
    func startGame() {
        score = [0,0]
        
        toplbl.text = "\(score[1])"
        btmlbl.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))

    }
    
    func addScore(playerWon: SKSpriteNode) {
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWon == main {
            
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        else
        {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
        
        toplbl.text = "\(score[1])"
        btmlbl.text = "\(score[0])"

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            if currentGameType == .player2 {
            if location.y > 0
            {
                enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))

            }
            if location.y < 0
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))

            }
            }
            else
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                
            }
            
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if location.y > 0
            {
                enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                
            }
            if location.y < 0
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                
            }
            else
            {
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        switch  currentGameType {
        case .easy :
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))

            break
            
        case .medium :
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))

            break
            
        case .hard :
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.7))

            break
            
        case .player2 :
            
            break
        }
        
        if ball.position.y <= main.position.y - 70 {
            addScore(playerWon: enemy)
        }
        else if ball.position.y >= enemy.position.y + 70 {
            addScore(playerWon: main)
            
        }
    }
}


