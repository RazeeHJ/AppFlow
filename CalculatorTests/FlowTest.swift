//
//  FlowTest.swift
//  CalculatorTests
//
//  Created by Razee Hussein-Jamal on 2023-10-26.
//

import XCTest
@testable import Calculator

final class FlowTest: XCTestCase {

    func test_start_withLoadNotCompleted_doesNotDelegateFeaturesHandling() {
        let features: [String] = []
        let loadCompleted = false
        
        makeSUT(loadCompleted: loadCompleted, features: features).start()
        
        XCTAssertEqual(delegate.loadCompleted, false)
        XCTAssertEqual(delegate.features.isEmpty, true)
    }
    
    func test_start_withLoadCompletedSuccess_delegatesRemoteFeaturesHandling() {
        let features = ["Addition", "Subtraction"]
        let loadCompleted = true

        makeSUT(loadCompleted: true, features: features).start()
        
        XCTAssertEqual(delegate.loadCompleted, true)
        XCTAssertEqual(delegate.features, features)
    }
    
    func test_start_withLoadCompletedWithEmptyFeatures_doesDelegateLocalFeaturesHandling() {
        let features: [String] = []
        let loadCompleted = true

        makeSUT(loadCompleted: true, features: features).start()
        
        XCTAssertEqual(delegate.loadCompleted, true)
        XCTAssertEqual(delegate.features, features)
    }

    // MARK: Helpers
    
    private let delegate = DelegateSpy()
    private weak var weakSUT: Flow<DelegateSpy>?
    
    override func tearDown() {
        super.tearDown()
        
        XCTAssertNil(weakSUT, "Memory leak detected. Weak reference to the SUT instance is not nil.")
    }
    
    func makeSUT(loadCompleted: Bool, features: [String]) -> Flow<DelegateSpy> {
        let sut = Flow(loadCompleted: loadCompleted, features: features, delegate: delegate)
        return sut
    }
}

class DelegateSpy: CalculatorDelegate {
    var features: [String] = []
    var loadCompleted: Bool = false
    
    func calculate(with features: [String]) {
        self.features = features
    }
    
    func didCompleteLoad(with result: Bool) {
        self.loadCompleted = result
    }
}
