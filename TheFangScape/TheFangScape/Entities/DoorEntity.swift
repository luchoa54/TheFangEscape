//
//  DoorEntity.swift
//  TheFangScape
//
//  Created by Luciano Uchoa on 24/11/23.
//

import Foundation
import GameplayKit

class DoorEntity: GKEntity {
    
    public init(position: CGPoint, size: CGSize) {
        super.init()
        
        let nodeTexture = SKTexture(imageNamed: "door")
        let node = SKSpriteNode(texture: nodeTexture, size: CGSize(width: 180, height: 270))
        node.position = position
        node.position.y += nodeTexture.size().height / 3
        node.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addComponent(GKSKNodeComponent(node: node))
        
        let physicsSize = CGSize(width: size.width / 1.2, height: size.height * 2)
        let physicsComp = PhysicsComponent.rectangleBody(ofSize: physicsSize)
        physicsComp.body.affectedByGravity = false
        physicsComp.body.isDynamic = false

        physicsComp.body.categoryBitMask = 0
        physicsComp.body.contactTestBitMask = .player
        self.addComponent(physicsComp)

        self.addComponent(IsDoorComponent())
        
        let lightComp = LightComponent(color: .init(
            red: 0.3, green: 0.3, blue: 0.4, alpha: 0.2))
        self.addComponent(lightComp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
