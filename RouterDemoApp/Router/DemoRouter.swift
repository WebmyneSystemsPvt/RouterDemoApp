//
//  DemoRouter.swift
//  RouterDemoApp
//
//  Created by Kaushal Bhalara on 05/01/26.
//

import SwiftUI
import Combine

/// `DemoRouter` is responsible for managing
/// the app-wide navigation state using `NavigationStack`.
///
/// This class acts as a centralized router that controls
/// push, pop, and pop-to-root navigation actions.
///
/// Marked with `@MainActor` to ensure all navigation state
/// updates occur on the main thread (required for UI updates).
@MainActor
final class DemoRouter: ObservableObject {

    /// Represents the current navigation stack.
    ///
    /// `NavigationPath` stores a stack of `Route` values
    /// which SwiftUI uses to determine the active view hierarchy.
    @Published var path = NavigationPath()

    // MARK: - Navigation Actions

    /// Pushes a new route onto the navigation stack.
    ///
    /// - Parameter route: The destination route to navigate to.
    /// Appending a route automatically triggers navigation
    /// via `NavigationStack`.
    func push(_ route: Route) {
        path.append(route)
    }

    /// Pops the top-most view from the navigation stack.
    ///
    /// This safely removes the last route only if the stack
    /// is not empty, preventing runtime crashes.
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    /// Resets the navigation stack and returns to the root view.
    ///
    /// Assigning a new `NavigationPath` clears all routes,
    /// effectively navigating back to the first screen.
    func popToRoot() {
        path = NavigationPath()
    }
}

