//
//  RouterDemoAppApp.swift
//  RouterDemoApp
//
//  Created by Kaushal Bhalara on 05/01/26.
//

import SwiftUI

/// Application entry point.
///
/// This struct initializes the root navigation stack
/// and injects the shared `DemoRouter` instance
/// into the SwiftUI environment.
@main
struct RouterDemoAppApp: App {

    /// Shared router instance responsible for managing
    /// navigation state across the entire application.
    ///
    /// `@StateObject` ensures the router is created once
    /// and survives view re-rendering.
    @StateObject private var router = DemoRouter()

    var body: some Scene {
        WindowGroup {

            /// Root `NavigationStack` driven by the router's path.
            ///
            /// Any changes to `router.path` will automatically
            /// update the visible navigation hierarchy.
            NavigationStack(path: $router.path) {

                /// Initial (root) screen of the application.
                HomeView()

                    /// Maps route values to destination views.
                    ///
                    /// This keeps view creation centralized
                    /// and decouples screens from navigation logic.
                    .navigationDestination(for: Route.self) { route in
                        switch route {

                        case .profile(let userId):
                            ProfileView(userId: userId)

                        case .settings:
                            SettingsView()
                        }
                    }
            }

            /// Injects the router into the environment so that
            /// any child view can access it using `@EnvironmentObject`.
            .environmentObject(router)
        }
    }
}
