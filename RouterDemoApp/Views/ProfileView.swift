//
//  ProfileView.swift
//  RouterDemoApp
//
//  Created by Kaushal Bhalara on 05/01/26.
//

import SwiftUI

/// `ProfileView` displays user-related information
/// and provides actions to navigate within the app.
///
/// This view uses a card-based layout and communicates
/// navigation events through the shared `DemoRouter`.
struct ProfileView: View {

    /// Shared router from the environment.
    /// Used for push, pop, and pop-to-root navigation actions.
    @EnvironmentObject var router: DemoRouter

    /// Unique identifier of the user being displayed.
    let userId: Int

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // MARK: - Profile Header

                /// Displays the user's avatar and basic information
                VStack(spacing: 12) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 96, height: 96)
                        .foregroundColor(.blue)

                    Text("User Profile")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("User ID: \(userId)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 16)

                // MARK: - User Information

                /// Card displaying static user-related information
                InfoCard {
                    InfoRow(title: "Account Type", value: "Premium")
                    Divider()
                    InfoRow(title: "Status", value: "Active")
                }

                // MARK: - Action Buttons

                /// Navigation and action controls
                VStack(spacing: 16) {

                    /// Navigates to the Settings screen
                    PrimaryActionButton(
                        title: "Open Settings",
                        icon: "gearshape.fill",
                        color: .orange
                    ) {
                        router.push(.settings)
                    }

                    /// Navigates back to the previous screen
                    SecondaryActionButton(
                        title: "Go Back",
                        icon: "chevron.left"
                    ) {
                        router.pop()
                    }

                    /// Navigates back to the root (Home) screen
                    DestructiveActionButton(
                        title: "Go to Home",
                        icon: "house.fill"
                    ) {
                        router.popToRoot()
                    }
                }

                Spacer(minLength: 40)
            }
            .padding()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Supporting UI Components

/// A reusable card container used to display
/// grouped informational content.
struct InfoCard<Content: View>: View {

    /// Content displayed inside the card
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            content
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(
                    color: .black.opacity(0.08),
                    radius: 8,
                    x: 0,
                    y: 4
                )
        )
    }
}

/// Displays a single key-value pair
/// used within informational cards.
struct InfoRow: View {

    /// Title describing the information
    let title: String

    /// Value associated with the title
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)

            Spacer()

            Text(value)
                .fontWeight(.medium)
        }
    }
}

/// Primary call-to-action button used
/// for main navigation or important actions.
struct PrimaryActionButton: View {

    /// Button title text
    let title: String

    /// SF Symbol name for the leading icon
    let icon: String

    /// Background color of the button
    let color: Color

    /// Action executed when the button is tapped
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: icon)
                .frame(maxWidth: .infinity)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(14)
        }
    }
}

/// Secondary button used for non-destructive
/// navigation actions such as "Back".
struct SecondaryActionButton: View {

    /// Button title text
    let title: String

    /// SF Symbol name for the leading icon
    let icon: String

    /// Action executed when the button is tapped
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: icon)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(14)
        }
    }
}

/// Destructive-style button used for
/// high-impact navigation actions.
struct DestructiveActionButton: View {

    /// Button title text
    let title: String

    /// SF Symbol name for the leading icon
    let icon: String

    /// Action executed when the button is tapped
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label(title, systemImage: icon)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red.opacity(0.15))
                .foregroundColor(.red)
                .cornerRadius(14)
        }
    }
}
