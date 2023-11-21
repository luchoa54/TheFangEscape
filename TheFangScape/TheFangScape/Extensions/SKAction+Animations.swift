//
//  SKAction+Animations.swift
//  TheFangScape
//
//  Created by Luciano Uchoa on 21/11/23.
//

import Foundation
import SpriteKit

extension SKAction {
    public static func playerRun() -> SKAction {
        return .repeatForever(.animate(with: .init(withFormat: "run%@", range: 1...8), timePerFrame: 0.15))
    }
    
    public static func playerJump() -> SKAction {
        return .repeatForever(.animate(with: .init(withFormat: "playerjump%@", range: 1...3), timePerFrame: 0.5))
    }
    
    public static func playerWallSlide() -> SKAction {
        return .repeatForever(.animate(with: .init(withFormat: "WallSlide", range: 1...1), timePerFrame: 1))
    }
}