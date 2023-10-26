//
//  CalculatorDelegate.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-26.
//

import Foundation

protocol CalculatorDelegate {
    associatedtype Features

    func calculate(with features: Features)
    func didCompleteLoad(with result: Bool)
}
