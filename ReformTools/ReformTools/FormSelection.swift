//
//  EntitySelection.swift
//  ReformTools
//
//  Created by Laszlo Korte on 17.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import ReformCore
import ReformStage

public class FormSelection {
    public var selected : FormIdentifier?
    
    public init() {}
}


extension FormSelection {
    public func isSelected(entity: Entity) -> Bool {
        return false
    }
}