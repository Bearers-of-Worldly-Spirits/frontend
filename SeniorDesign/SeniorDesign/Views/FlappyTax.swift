//
//  FlappyTax.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 4/7/21.
//  Adapted from
//  https://sweettutos.com/2017/03/09/build-your-own-flappy-bird-game-with-swift-3-and-spritekit/

import SwiftUI
import SpriteKit


struct CollisionBitMask {
    static let birdCategory:UInt32 = 0x1 << 0
    static let pillarCategory:UInt32 = 0x1 << 1
    static let flowerCategory:UInt32 = 0x1 << 2
    static let groundCategory:UInt32 = 0x1 << 3
}


class GameScene: SKScene {
    
    let birdUpFlap = "flappy-bird-assets/sprites/yellowbird-upflap.png"
    let birdMidFlap = "flappy-bird-assets/sprites/yellowbird-midflap.png"
    let birdDownFlap = "flappy-bird-assets/sprites/yellowbird-downflap.png"
    var bird:SKSpriteNode = SKSpriteNode(imageNamed: "flappy-bird-assets/sprites/yellowbird-downflap.png")
    var wallPair = SKNode()
    var moveAndRemove = SKAction()
    
    var gameOver:Bool = false
    var gameStarted:Bool = false
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        createSky()
        createBird()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            gameStarted = true
            //1
            let spawn = SKAction.run({
                () in
                self.wallPair = self.createWalls()
                self.addChild(self.wallPair)
            })
            //2
            let delay = SKAction.wait(forDuration: 1.5)
            let SpawnDelay = SKAction.sequence([spawn, delay])
            let spawnDelayForever = SKAction.repeatForever(SpawnDelay)
            self.run(spawnDelayForever)
            //3
            let distance = CGFloat(self.frame.width + wallPair.frame.width)
            let movePillars = SKAction.moveBy(x: -distance - 50, y: 0, duration: TimeInterval(0.008 * distance))
            let removePillars = SKAction.removeFromParent()
            moveAndRemove = SKAction.sequence([movePillars, removePillars])
            bird.physicsBody?.affectedByGravity = true
            bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 10))
        }else{
            bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 30))
        }
    }
    
    override func update(_ currentTime: CFTimeInterval){
        guard gameOver == false else {return}
        if self.bird.position.x <= 10 || self.bird.position.x >= self.size.width {
            print("Game over!")
            self.removeAllActions()
            self.gameOver = true
         }
        if gameOver == true {
            let message = SKSpriteNode(imageNamed: "flappy-bird-assets/sprites/gameover.png")
            message.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            message.setScale(0.7)
            self.addChild(message)
        }
    }
    
    func createBird() {
        bird.size = CGSize(width: 34, height: 24)
        bird.position = CGPoint(x:self.frame.midX, y:self.frame.midY)
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.width / 2)
        bird.physicsBody?.linearDamping = 1.1
        bird.physicsBody?.restitution = 0
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        self.addChild(bird)
        let animateBird = SKAction.animate(with: [SKTexture(imageNamed: birdDownFlap), SKTexture(imageNamed: birdMidFlap), SKTexture(imageNamed: birdUpFlap)], timePerFrame: 0.1)
        let repeatActionBird = SKAction.repeatForever(animateBird)
        bird.run(repeatActionBird)
    }
    
    func createSky() {
        let background_name = "flappy-bird-assets/sprites/background-day.png"
        let backgroundTexture = SKTexture(imageNamed: background_name)
        for i in 0 ... 1 {
            let background = SKSpriteNode(texture: backgroundTexture)
            background.zPosition = -30
            background.anchorPoint = CGPoint.zero
            background.position = CGPoint(x: (backgroundTexture.size().width * CGFloat(i)) - CGFloat(1 * i), y: 0)
            addChild(background)
            let moveLeft = SKAction.moveBy(x: -backgroundTexture.size().width, y: 0, duration: 20)
            let moveReset = SKAction.moveBy(x: backgroundTexture.size().width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            background.run(moveForever)
        }
    }
    
    func createWalls() -> SKNode  {
        wallPair = SKNode()
        wallPair.name = "wallPair"

        let topWall = SKSpriteNode(imageNamed: "tax")
        let btmWall = SKSpriteNode(imageNamed: "tax")

        let factor:CGFloat = 270
        
        topWall.position = CGPoint(x: self.frame.width + 25, y: self.frame.height / 2 + factor)
        btmWall.position = CGPoint(x: self.frame.width + 25, y: self.frame.height / 2 - factor)

        topWall.setScale(0.45)
        btmWall.setScale(0.45)

        topWall.physicsBody = SKPhysicsBody(rectangleOf: topWall.size)
        topWall.physicsBody?.categoryBitMask = CollisionBitMask.pillarCategory
        topWall.physicsBody?.collisionBitMask = CollisionBitMask.birdCategory
        topWall.physicsBody?.contactTestBitMask = CollisionBitMask.birdCategory
        topWall.physicsBody?.isDynamic = false
        topWall.physicsBody?.affectedByGravity = false

        btmWall.physicsBody = SKPhysicsBody(rectangleOf: btmWall.size)
        btmWall.physicsBody?.categoryBitMask = CollisionBitMask.pillarCategory
        btmWall.physicsBody?.collisionBitMask = CollisionBitMask.birdCategory
        btmWall.physicsBody?.contactTestBitMask = CollisionBitMask.birdCategory
        btmWall.physicsBody?.isDynamic = false
        btmWall.physicsBody?.affectedByGravity = false

        topWall.zRotation = CGFloat(Double.pi)

        wallPair.addChild(topWall)
        wallPair.addChild(btmWall)

        wallPair.zPosition = 1
        // 3
        let randomPosition = random(min: -200, max: 200)
        wallPair.position.y = wallPair.position.y +  randomPosition
        wallPair.run(moveAndRemove)

        return wallPair
    }
    
    func random() -> CGFloat{
            return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min : CGFloat, max : CGFloat) -> CGFloat{
            return random() * (max - min) + min
    }
}


struct FlappyTax: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .aspectFill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

struct FlappyTax_Previews: PreviewProvider {
    static var previews: some View {
        FlappyTax()
    }
}
