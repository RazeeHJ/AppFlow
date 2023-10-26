//
//  Flow.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-26.
//

import Foundation

final class Flow<Delegate: CalculatorDelegate> {
    typealias Features = Delegate.Features
    
    private let delegate: Delegate
    private var loadCompleted: Bool
    private let features: Features
    
    init(loadCompleted: Bool, features: Features, delegate: Delegate) {
        self.loadCompleted = loadCompleted
        self.features = features
        self.delegate = delegate
    }
    
    func start() {
        delegateLoadHandling()
    }
    
    private func delegateLoadHandling() {
        delegate.didCompleteLoad(with: loadCompleted)

        if loadCompleted {
            delegate.calculate(with: features)
        }
    }
}
