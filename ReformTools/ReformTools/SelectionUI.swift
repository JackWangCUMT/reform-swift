//
//  SelectionUI.swift
//  ReformTools
//
//  Created by Laszlo Korte on 17.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import ReformCore

class SelectionUI {
    enum State {
        case Hide
        case Show(FormIdentifier?)
    }
    
    var state : State = .Hide
}