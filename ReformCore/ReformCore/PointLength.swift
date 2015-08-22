//
//  PointLength.swift
//  ReformCore
//
//  Created by Laszlo Korte on 22.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import ReformMath

struct PointLength : RuntimeLength {
    private let pointA : RuntimePoint
    private let pointB : RuntimePoint
    
    init(pointA: RuntimePoint, pointB: RuntimePoint) {
        self.pointA = pointA
        self.pointB = pointB
    }
    
    func getLengthFor(runtime: Runtime) -> Double? {
        guard let a = pointA.getPositionFor(runtime),
                  b = pointB.getPositionFor(runtime) else {
            return nil
        }
        return (b-a).length
    }
}