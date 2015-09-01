//
//  ScaleFactor.swift
//  ReformCore
//
//  Created by Laszlo Korte on 13.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//


public protocol RuntimeScaleFactor : Degeneratable {
    func getFactorFor<R:Runtime>(runtime: R) -> Double?
}
