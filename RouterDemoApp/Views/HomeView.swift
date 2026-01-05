//
//  HomeView.swift
//  RouterDemoApp
//
//  Created by Kaushal Bhalara on 05/01/26.
//

import SwiftUI

/// `HomeView` is the root screen of the application.
///
/// It provides entry points to the main navigation flows
/// such as Profile and Settings using a card-based layout.
/// Navigation is handled via the shared `DemoRouter`.
struct HomeView: View {

    /// Shared router injected from the environment.
    /// Used to trigger navigation actions.
    @EnvironmentObject var router: DemoRouter

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                // MARK: - Header

                /// Welcome message and short description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome 👋")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Choose where you want to go")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // MARK: - Navigation Cards

                /// Primary navigation options displayed as cards
                VStack(spacing: 16) {

                    /// Navigates to the Profile screen
                    NavigationCard(
                        title: "Profile",
                        subtitle: "View user details",
                        icon: "person.crop.circle.fill",
                        color: .blue
                    ) {
                        router.push(.profile(userId: 101))
                    }

                    /// Navigates to the Settings screen
                    NavigationCard(
                        title: "Settings",
                        subtitle: "Manage app preferences",
                        icon: "gearshape.fill",
                        color: .orange
                    ) {
                        router.push(.settings)
                    }
                }

                Spacer(minLength: 40)
            }
            .padding()
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Supporting UI Components

/// `NavigationCard` represents a reusable
/// card-style navigation button.
///
/// It displays an icon, title, subtitle,
/// and executes an action when tapped.
struct NavigationCard: View {

    /// Primary title text
    let title: String

    /// Secondary descriptive text
    let subtitle: String

    /// SF Symbol name for the icon
    let icon: String

    /// Background color for the icon
    let color: Color

    /// Action executed when the card is tapped
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {

                Image(systemName: icon)
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .frame(width: 56, height: 56)
                    .background(color)
                    .cornerRadius(14)

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                /// Chevron indicates forward navigation
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(
                        color: Color.black.opacity(0.08),
                        radius: 8,
                        x: 0,
                        y: 4
                    )
            )
        }
        .buttonStyle(.plain)
    }
}
