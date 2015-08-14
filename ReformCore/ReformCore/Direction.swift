//
//  Direction.swift
//  ReformCore
//
//  Created by Laszlo Korte on 13.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import ReformMath

protocol RuntimeDirection {
    func getAdjustedFor(runtime: Runtime, anchor: Vec2d, position: Vec2d) -> Vec2d
}

public enum Catersian : RuntimeDirection, Labeled {
    case Vertical
    case Horizontal
    
    public func getDescription(analyzer: Analyzer) -> String {
        switch self {
        case .Vertical:
            return "Vertical"
        case .Horizontal:
            return "Horizontal"
        }
    }
    
    func getAdjustedFor(runtime: Runtime, anchor: Vec2d, position: Vec2d) -> Vec2d {
        switch self {
            
        case .Vertical:
            return Vec2d(x: anchor.x, y: position.y)
        case .Horizontal:
            return Vec2d(x: position.x, y: anchor.y)
        }
        
    }
}

public struct FreeDirection : RuntimeDirection, Labeled {
    
    public func getDescription(analyzer: Analyzer) -> String {
        return ""
    }
    
    func getAdjustedFor(runtime: Runtime, anchor: Vec2d, position: Vec2d) -> Vec2d {
        return position
    }
}


public struct ProportionalDirection : RuntimeDirection, Labeled {
    
    var proportion : Double
    
    init(proportion: Double) {
        self.proportion = proportion
    }
    
    public func getDescription(analyzer: Analyzer) -> String {
        return ""
    }
    
    func getAdjustedFor(runtime: Runtime, anchor: Vec2d, position: Vec2d) -> Vec2d {
        return anchor + proportioned((position-anchor), proportion: proportion)
    }
}