//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-25.
//

import SwiftUI
import Firebase

class CalculatorAppStore {
    var calculator: Calculator?
}

@main
struct CalculatorApp: App {
    let appStore = CalculatorAppStore()
    @StateObject var store = CalculatorStore()
    
    private var remoteConfigLoader: ConfigLoader
    @State private var loadCompleted = false

    init() {
        FirebaseApp.configure()
        self.remoteConfigLoader = RemoteConfigLoader(remoteConfig: RemoteConfig.remoteConfig())
    }
        
    var body: some Scene {
        WindowGroup {
            CalculatorView(store: store)
                .task {
                    await load()
                }
                .onChange(of: loadCompleted) { _ in
                    Task {
                        await startCalculator()
                    }
                }
        }
    }
    
    @MainActor
    private func load() async {
        await startCalculator()
        do {
            try await remoteConfigLoader.activate()
            loadCompleted = true
        } catch {
            print(error)
        }
    }
    
    @MainActor
    private func startCalculator() async {
        let adapter = UIAdapter(calculatorStore: store, features: [], loadCompleted: loadCompleted)
        appStore.calculator = Calculator.start(loadCompleted: loadCompleted, features: [], delegate: adapter)
    }
}

final class UIAdapter: CalculatorDelegate {
    typealias Features = [String]
    
    private let calculatorStore: CalculatorStore
    private var features: Features
    private var loadCompleted: Bool
    
    init(calculatorStore: CalculatorStore, features: Features, loadCompleted: Bool) {
        self.calculatorStore = calculatorStore
        self.features = features
        self.loadCompleted = loadCompleted
    }
    
    func calculate(with features: [String]) {
        self.features = features
    }
    
    func didCompleteLoad(with result: Bool) {
        if result {
            self.calculatorStore.currentView = .calculator
        } else {
            self.calculatorStore.currentView = .loader
        }
        self.loadCompleted = result
    }
}
