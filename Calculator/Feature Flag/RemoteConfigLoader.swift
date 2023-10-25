//
//  FeatureLoader.swift
//  Calculator
//
//  Created by Razee Hussein-Jamal on 2023-10-25.
//

import Firebase

protocol ConfigLoader {
    func load() async throws
}

struct RemoteConfigLoader: ConfigLoader {
    private var remoteConfig: RemoteConfig

    init(remoteConfig: RemoteConfig) {
        self.remoteConfig = remoteConfig
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    func load() async throws {
        try await self.remoteConfig.fetchAndActivate()
    }
}
