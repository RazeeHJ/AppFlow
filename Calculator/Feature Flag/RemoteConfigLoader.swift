//
//  FeatureLoader.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-25.
//

import Firebase

protocol ConfigLoader {
    func activate() async throws
}

class RemoteConfigLoader: ConfigLoader {
    private var remoteConfig: RemoteConfig
    
    init(remoteConfig: RemoteConfig = RemoteConfig.remoteConfig()) {
        self.remoteConfig = remoteConfig
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        self.remoteConfig.configSettings = settings
    }
    
    func activate() async throws {
        try await remoteConfig.fetchAndActivate()
    }
}

