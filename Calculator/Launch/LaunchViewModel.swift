//
//  LaunchViewModel.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-26.
//

import Foundation

class LaunchViewModel: ObservableObject {
    var action: () async -> Void?
    
    init(action: @escaping () async  -> Void?) {
        self.action = action
    }
    
    @MainActor
    func load() async {
        await action()
    }
}
