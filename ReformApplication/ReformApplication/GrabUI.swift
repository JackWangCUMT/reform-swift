//
//  GrabUI.swift
//  ReformApplication
//
//  Created by Laszlo Korte on 18.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import Foundation
import ReformTools
import ReformStage

struct GrabUIRenderer : Renderer {
    let grabUI : GrabUI
    
    func renderInContext(context: CGContext) {
        CGContextSetRGBFillColor(context, 0.2, 0.7, 1, 1)
        CGContextSetRGBStrokeColor(context, 0.2, 0.6, 0.9, 1)
        CGContextSetLineWidth(context, 1)
        let dotSize : Double = 7
        
        
        switch grabUI.state {
        case .Hide:
            return
        case .Show(let points):
            for p in points {
                drawDotAt(context, position: p.position, size: dotSize)
            }
            CGContextDrawPath(context, .FillStroke)
        case .Active(let active, let points):
            for p in points {
                drawDotAt(context, position: p.position, size: dotSize)
            }
            CGContextDrawPath(context, .FillStroke)

            drawDotAt(context, position: active.position, size: dotSize*1.5)
            
            CGContextDrawPath(context, .FillStroke)
        }
    }
}