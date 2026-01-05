//
//  Route.swift
//  RouterDemoApp
//
//  Created by Kaushal Bhalara on 05/01/26.
//

import Foundation

/// `Route` defines all possible navigation destinations
/// within the application.
///
/// This enum acts as a single source of truth for navigation,
/// ensuring type-safe and centralized routing.
///
/// Each case represents a screen, and associated values
/// allow passing strongly-typed data between views.
enum Route: Hashable {

    /// Navigates to the Profile screen.
    ///
    /// - Parameter userId: Unique identifier of the user
    ///   whose profile should be displayed.
    case profile(userId: Int)

    /// Navigates to the Settings screen.
    case settings
}
