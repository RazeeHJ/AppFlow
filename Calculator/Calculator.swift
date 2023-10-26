//
//  Calculator.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-26.
//

import Foundation

final class Calculator {
    private let flow: Any
    
    private init(flow: Any) {
        self.flow = flow
    }
    
    public static func start<Delegate: CalculatorDelegate>(
        loadCompleted: Bool,
        features: Delegate.Features,
        delegate: Delegate
    ) -> Calculator where [String]: Equatable {
        let flow = Flow(loadCompleted: loadCompleted, features: features, delegate: delegate)
        flow.start()
        return Calculator(flow: flow)
    }
}
