//
//  CalculatorStore.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-26.
//

import SwiftUI

class CalculatorStore: ObservableObject {
    enum CurrentView {
        case calculator
        case loader
    }
    
    @Published var currentView: CurrentView?
    
    var view: AnyView {
        switch currentView {
        case .calculator:
            return AnyView(EmptyView().background(.yellow))
        case .loader:
            return AnyView(LaunchScreen())
        case nil:
            return AnyView(EmptyView().background(.red))
        }
    }
}

struct CalculatorView: View {
    @ObservedObject var store: CalculatorStore
    
    var body: some View {
        store.view
    }
}

#if DEBUG
#Preview {
    CalculatorView(store: CalculatorStore())
}
#endif
