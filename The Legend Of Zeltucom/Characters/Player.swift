//
//  Player.swift
//  The Legend Of Zeltucom
//
//  Created by Daniel Tarrasso on 9/4/19.
//  Copyright © 2019 Daniel Tarrasso. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Player{
    var name : String
    var heart : Int
    var sprite = SKSpriteNode()
    //var somethingelse : idk
    
    init(name : String, sprite : SKSpriteNode){
        self.name = name
        self.heart = 3
        self.sprite = sprite
    }
    
    public func getName() -> String{
        return name
    }
    
    public func setName(name:String){
        self.name = name
    }
    
    public func getSprite() -> SKSpriteNode{
        return sprite
    }
    
    public func setSprite(sprite : SKSpriteNode){
        self.sprite = sprite
    }
}
