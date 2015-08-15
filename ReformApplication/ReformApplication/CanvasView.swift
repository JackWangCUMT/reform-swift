//
//  CanvasView.swift
//  ReformApplication
//
//  Created by Laszlo Korte on 14.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import Foundation
import Cocoa

@IBDesignable
class CanvasView : NSView {
    let paperColor = NSColor.whiteColor()
    
    let canvasSize = (300,300)
    
    private var currentContext : CGContext? {
        get {
            // The 10.10 SDK provides a CGContext on NSGraphicsContext, but
            // that's not available to folks running 10.9, so perform this
            // violence to get a context via a void*.
            // iOS can just use UIGraphicsGetCurrentContext.
            
            let unsafeContextPointer = NSGraphicsContext.currentContext()?.graphicsPort
            
            if let contextPointer = unsafeContextPointer {
                let opaquePointer = COpaquePointer(contextPointer)
                let context: CGContextRef = Unmanaged.fromOpaque(opaquePointer).takeUnretainedValue()
                return context
            } else {
                return nil
            }
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        let ownBounds = bounds
        let paperRect = NSRect(x:(ownBounds.width-CGFloat(canvasSize.0))/2.0,y:(ownBounds.height-CGFloat(canvasSize.1))/2.0, width: CGFloat(canvasSize.0), height: CGFloat(canvasSize.1))
        
        paperColor.set()
        NSBezierPath.fillRect(paperRect)
        
        if let context = currentContext {
            
            CGContextTranslateCTM(context, 25, 25)
            CGContextSetRGBFillColor(context, 0.23, 0.85, 0.3, 1)
            CGContextSetRGBStrokeColor(context, 0.18, 0.5, 0.24, 1)
            CGContextSetLineWidth(context, 2)
            
            let dotSize = 12
            for x in [-1,0,1] {
                for y in [-1,0,1] {
                    guard x != 0 || y != 0 else { continue }
                    
                    let center = ( (1+x) * canvasSize.0/2, (1+y) * canvasSize.1/2 )
                    
                    let rect = CGRect(x:center.0-dotSize/2, y:center.1-dotSize/2, width: dotSize, height: dotSize)
                    CGContextFillEllipseInRect(context, rect)
                    CGContextStrokeEllipseInRect(context, rect)
                }
            }

        }
    }
    
    override var intrinsicContentSize : NSSize {
        return NSSize(width: canvasSize.0 + 50, height: canvasSize.1 + 50)
    }
}

class CenteredClipView:NSClipView
{
    override func constrainBoundsRect(proposedBounds: NSRect) -> NSRect {
        
        var rect = super.constrainBoundsRect(proposedBounds)
        if let containerView = self.documentView as? NSView {
            
            if (rect.size.width > containerView.frame.size.width) {
                rect.origin.x = (containerView.frame.width - rect.width ) / 2
            }
            
            if(rect.size.height > containerView.frame.size.height) {
                rect.origin.y = (containerView.frame.height - rect.height ) / 2
            }
        }
        
        return rect
    }
}