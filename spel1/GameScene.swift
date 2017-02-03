//
//  GameScene.swift
//  spel1
//
//  Created by Oliver Buvik on 2017-02-03.
//  Copyright © 2017 Oliver Buvik. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene {
    var bg = SKSpriteNode()
    
    var didLoad = false;
  
    
    func setUpGame (){
        
        //Bakgrunden : 600 × 385
        let bgTexture = SKTexture(imageNamed: "bakgrund.png")
        let moveBGAnimation = SKAction.move(by: CGVector(dx: -bgTexture.size().width, dy: 0), duration: 10)
        let shiftBGAnimation = SKAction.move(by: CGVector(dx: bgTexture.size().width, dy:0), duration: 0)
        let moveBGForever = SKAction.repeatForever(SKAction.sequence([moveBGAnimation, shiftBGAnimation]))
        var i:CGFloat = 0
        
        while i < 3 {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width * i, y: self.frame.midY)
            bg.size.height = self.frame.height
            bg.size.width = (self.frame.height / 385) * 600;
            bg.run(moveBGForever)
            self.addChild(bg)
            i += 1
        }
    }
    
    override func didMove(to view: SKView) {
        if(!didLoad){
            didLoad = true;
            start();
        }
    }
        
    
    func start(){
        setUpGame();
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
