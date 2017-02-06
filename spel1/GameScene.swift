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
    var mario = SKSpriteNode()
    var didLoad = false;
    enum ColliderType: UInt32{
        case mario = 1
        //case Object = 2
        //case Gap = 4
    }

    
    func setUpGame (){
        
        //Bakgrunden : 591 × 531
        let bgTexture = SKTexture(imageNamed: "bakgrundspel.png")
        let moveBGAnimation = SKAction.move(by: CGVector(dx: -bgTexture.size().width, dy: 0), duration: 5)
        let shiftBGAnimation = SKAction.move(by: CGVector(dx: bgTexture.size().width, dy:0), duration: 0)
        let moveBGForever = SKAction.repeatForever(SKAction.sequence([moveBGAnimation, shiftBGAnimation]))
        var i:CGFloat = 0
        
        while i < 3 {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width * i, y: self.frame.midY)
            bg.size.height = self.frame.height
            bg.size.width = (self.frame.height / 531) * 591;
            bg.run(moveBGForever)
            self.addChild(bg)
            i += 1
        }
        //Marioanimation
        let marioTexture = SKTexture(imageNamed: "mario1.png")
        let marioTexture2 = SKTexture(imageNamed: "mario2.png")
        let animation = SKAction.animate(with: [marioTexture, marioTexture2], timePerFrame: 0.1)
        let makeMarioRun = SKAction.repeatForever(animation)
        mario = SKSpriteNode(texture: marioTexture)
        mario.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(mario)
        mario.run(makeMarioRun)
        mario.zPosition = 2
        mario.physicsBody = SKPhysicsBody(circleOfRadius: marioTexture.size().height / 2)
        mario.physicsBody!.isDynamic = true
        mario.yScale = 0.3
        mario.xScale = 0.3

        //mario.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        //mario.physicsBody!.categoryBitMask = ColliderType.mario.rawValue
        //mario.physicsBody!.collisionBitMask = ColliderType.mario.rawValue
        
        
        // Marken
        let ground = SKNode()
        ground.position = CGPoint(x: self.frame.midX, y: -self.frame.height/2)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 1))
        ground.physicsBody!.isDynamic = false
        self.addChild(ground)
        ground.physicsBody!.isDynamic = false
        //ground.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        //ground.physicsBody!.categoryBitMask = ColliderType.Object.rawValue
        //ground.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        

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
        let marioTexture = SKTexture(imageNamed: "mario1.png")
        mario.physicsBody = SKPhysicsBody(circleOfRadius: marioTexture.size().height/2)
        mario.physicsBody!.isDynamic = true
        mario.physicsBody!.velocity = CGVector(dx: 0, dy: 0)
        mario.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 50))
      
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
