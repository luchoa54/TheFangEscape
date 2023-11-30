//
//  SKEntityManager.swift
//  TheFangScape
//
//  Created by Victor Vasconcelos on 13/11/23.
//

import Foundation
import SpriteKit
import GameplayKit

public class SKEntityManager {
    
    public var entities = Set<GKEntity>()
    private weak var scene: GameScene?
    
    public init(scene: GameScene) {
        self.scene = scene
    }
    
    public func add(entity: GKEntity, onParent parent: GKEntity? = nil) {
        self.entities.insert(entity)
        
        guard let scene else { return }
        guard let node = entity.component(ofType: GKSKNodeComponent.self)?.node else { return }
        
        if let parentNode = parent?.component(ofType: GKSKNodeComponent.self)?.node {
            parentNode.addChild(node)
        } else {
            scene.mask.addChild(node)
        }
    }
    
    public func remove(entity: GKEntity) {
        
        if let node = entity.component(ofType: GKSKNodeComponent.self)?.node {
            node.removeFromParent()
        }
        
        self.entities.remove(entity)
    }
    
    public func update(atTime time: TimeInterval) {
        for entity in entities {
            entity.update(deltaTime: time)
        }
    }
    
    public func first(withComponent component: GKComponent.Type) -> GKEntity? {
        return entities.first { entity in
            return entity.component(ofType: component) != nil
        }
    }
    
    public func removeAll() {
        for entity in entities {
            self.remove(entity: entity)
        }
    }
    
}
