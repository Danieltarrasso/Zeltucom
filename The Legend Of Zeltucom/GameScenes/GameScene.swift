//
//  GameScene.swift
//  The Legend Of Zeltucom
//
//  Created by Daniel Tarrasso on 9/4/19.
//  Copyright © 2019 Daniel Tarrasso. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    //Character Node
    var player = Player(name: "Link", sprite: SKSpriteNode(imageNamed: "Player_Normal_1"))
    
    //Background Node
    var map = SKNode()
    let cam = SKCameraNode()
    
    //Moves Node
    var move = SKSpriteNode()
    var attack = SKSpriteNode()
    
    //Score Node
    var labelScore = SKLabelNode()
    var score = 0
    
    //Character Textures
    var textureLink1 = SKTexture()
    var textureLink2 = SKTexture()
    
    //Timer
    var timer = Timer()
    
    var gameOver = false
    
    //Collision of Nodes
    
    enum nodeType : UInt32{
        case link = 1
        case enemyKilled = 2
        case death = 4
    }
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x:0, y: 0.30)
        backgroundColor = SKColor(red: 81.0/255.0, green: 192.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        
        addChild(player.getSprite())
        
        //asignamos la default camara a la nuestra
        self.camera = cam
        addChild(cam)
        
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player.getSprite().run(SKAction.move(to: pos, duration: 1.0))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        //la camara va siguiendo al jugador
        cam.position = player.getSprite().position
    }
}
