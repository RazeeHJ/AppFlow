//
//  LaunchScreen.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-25.
//

import SwiftUI

struct LaunchScreen: View {
//    @ObservedObject var viewModel: LaunchViewModel
    
//    init(viewModel: LaunchViewModel) {
//        self.viewModel = viewModel
//    }
    
    var body: some View {
        ProgressView()
    }
}

#if DEBUG
#Preview {
    LaunchScreen()
}
#endif
