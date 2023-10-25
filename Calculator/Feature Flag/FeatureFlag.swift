//
//  ConfigurableValue.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-25.
//

import Foundation

protocol ConfigurableValue {
    associatedtype Value
    static var defaultValue: Value { get }
}

protocol FeatureFlag: ConfigurableValue where Value == Bool {}

struct IsAdditionEnabled: FeatureFlag {
    typealias RemoteConfigPrimitiveValue = Bool
    
    static var defaultValue: Bool = true
    static var remoteConfigurationKey = "additionFeatureEnabled"
}

struct IsSubtractionEnabled: FeatureFlag {
    typealias RemoteConfigPrimitiveValue = Bool
    
    static var defaultValue: Bool = true
    static var remoteConfigurationKey = "subtractionFeatureEnabled"
}
