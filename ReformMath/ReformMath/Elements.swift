//
//  Elements.swift
//  ReformMath
//
//  Created by Laszlo Korte on 15.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

public struct LineSegment2d {
    public let from: Vec2d
    public let to: Vec2d
    
    public init(from: Vec2d, to: Vec2d) {
        self.from = from
        self.to = to
    }
}

extension LineSegment2d {
    var length : Double {
        return (to-from).length
    }
}

public struct Arc2d {
    public let center : Vec2d
    public let radius: Double
    public let start: Angle
    public let end: Angle
    
    public init(center: Vec2d, radius:Double, start: Angle, end: Angle) {
        self.center = center
        self.radius = radius
        self.start = start
        self.end = end
    }
}

extension Arc2d {
    public var length : Double {
        print(normalize360(end-start).percent/100)
        return 2 * M_PI * radius * normalize360(end-start).percent/100
    }
}
