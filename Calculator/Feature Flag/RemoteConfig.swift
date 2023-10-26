//
//  RemoteConfig.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-25.
//

import Foundation

protocol RemoteConfigs {
    associatedtype RemoteConfigPrimitiveValue
    associatedtype Value
    
    var remoteConfigurationKey: String { get }
    
    func extractPrimitive(from remoteConfigValue: RemoteConfiguration.RemoteValueWrapper) -> RemoteConfigPrimitiveValue?
    func value(from remoteValue: RemoteConfigPrimitiveValue) -> Value?
}


struct RemoteConfiguration {
    struct RemoteValueWrapper {
        var stringValue: String?
        var boolValue: Bool
        var intValue: Int?
        var doubleValue: Double?
    }
}

extension RemoteConfigs where Self: FeatureFlag, Value == RemoteConfigPrimitiveValue {
    static func value(from remoteValue: RemoteConfigPrimitiveValue) -> Value? {
        Value(remoteValue)
    }
}
