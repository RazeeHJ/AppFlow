//
//  FlowTest.swift
//  CalculatorTests
//
//  Created by Razee Hussein-Jamal on 2023-10-26.
//

import XCTest
@testable import Calculator

final class FlowTest: XCTestCase {


    func makeSUT(features: [String], isLoading: Bool) -> DelegateSpy {
        let sut = DelegateSpy(features: features, isLoading: isLoading)
        return sut
    }
}

class DelegateSpy: CalculatorDelegate {
    typealias AppState = Bool
    typealias Features = [String]
    
    var features: Features = []
    var isLoading: Bool = false
    
    init(features: Features, isLoading: Bool) {
        self.features = features
        self.isLoading = isLoading
    }
    
    func calculate(with features: [String]) {
        self.features = features
    }
    
    func didCompleteLoad(with result: Bool) {
        self.isLoading = result
    }
}
