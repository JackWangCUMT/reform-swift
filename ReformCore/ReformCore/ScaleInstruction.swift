//
//  ScaleInstruction.swift
//  ReformCore
//
//  Created by Laszlo Korte on 14.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//


import ReformMath

class ScaleInstruction : Instruction {
    typealias PointType = LabeledPoint
    typealias FactorType = protocol<RuntimeScaleFactor, Labeled>

    var parent : InstructionGroup?
    
    var target : FormIdentifier? {
        return formId
    }
    
    let formId : FormIdentifier
    let factor : FactorType
    var fixPoint : PointType
    
    init(formId: FormIdentifier, factor: FactorType, fixPoint: PointType) {
        self.formId = formId
        self.factor = factor
        self.fixPoint = fixPoint
    }
    
    func evaluate(runtime: Runtime) {
        guard let form = runtime.get(formId) as? Scalable else {
            runtime.reportError(self, error: .UnknownForm)
            return
        }
        guard let fix : Vec2d = fixPoint.getPositionFor(runtime) else {
            runtime.reportError(self, error: .InvalidFixPoint)
            return
        }
        guard let f : Double = factor.getFactorFor(runtime) else {
            runtime.reportError(self, error: .InvalidFactor)
            return
        }
        
        form.scaler.scale(runtime, factor: f, fix: fix, axis: Vec2d())
    }
    
    
    func analyze(analyzer: Analyzer) {
        let formName = analyzer.get(formId)?.name ?? "???"
        
        analyzer.publish(self, label: "Scale \(formName) around \(fixPoint.getDescription(analyzer)) by \(factor)")
    }
    
}