//
//  Sector2d.swift
//  ReformMath
//
//  Created by Laszlo Korte on 23.09.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//


public struct Sector2d : Equatable {
    public let arc : Arc2d

    public init(center: Vec2d, radius:Double, start: Angle, end: Angle) {
        self.arc = Arc2d(center: center, radius: radius, start: start, end: end)
    }
}

public func ==(lhs: Sector2d, rhs: Sector2d) -> Bool {
    return lhs.arc == rhs.arc
}