//
//  AnchorPoint.swift
//  ReformCore
//
//  Created by Laszlo Korte on 13.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import ReformMath

struct AnchorPoint : RuntimePoint, Labeled {
    private let anchor : Anchor
    
    init(anchor: Anchor) {
        self.anchor = anchor
    }
    
    func getPositionFor(runtime: Runtime) -> Vec2d? {
        return anchor.getPositionFor(runtime)
    }
    
    func getDescription(analyzer: Analyzer) -> String {
        return anchor.name
    }
}