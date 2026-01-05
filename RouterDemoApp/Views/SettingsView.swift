//
//  SettingsView.swift
//  RouterDemoApp
//
//  Created by Kaushal Bhalara on 05/01/26.
//

import SwiftUI

/// `SettingsView` displays application configuration
/// and preference-related options.
///
/// This view follows a card-based layout similar to
/// iOS system settings and uses the router to
/// handle navigation actions.
struct SettingsView: View {

    /// Shared router injected from the environment.
    /// Used to perform navigation actions such as
    /// pop and pop-to-root.
    @EnvironmentObject var router: DemoRouter

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // MARK: - Header

                /// Screen title and description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Customize your app experience")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // MARK: - Preferences Section

                /// User preference related options
                SettingsCard {
                    SettingsRow(
                        icon: "bell.fill",
                        title: "Notifications",
                        subtitle: "Manage alerts",
                        color: .blue
                    )

                    Divider()

                    SettingsRow(
                        icon: "lock.fill",
                        title: "Privacy",
                        subtitle: "Security & permissions",
                        color: .purple
                    )
                }

                // MARK: - App Information Section

                /// Application related informational options
                SettingsCard {
                    SettingsRow(
                        icon: "info.circle.fill",
                        title: "About App",
                        subtitle: "Version & details",
                        color: .green
                    )

                    Divider()

                    SettingsRow(
                        icon: "star.fill",
                        title: "Rate App",
                        subtitle: "Share your feedback",
                        color: .yellow
                    )
                }

                // MARK: - Navigation Actions

                /// Navigation control buttons
                VStack(spacing: 16) {

                    /// Navigates back to the previous screen
                    SecondaryActionButton(
                        title: "Back",
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
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Supporting UI Components

/// A reusable card container used to group
/// related settings options together.
struct SettingsCard<Content: View>: View {

    /// Content displayed inside the card
    @ViewBuilder let content: Content

    var body: some View {
        VStack(spacing: 12) {
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

/// A single row representing a settings option.
///
/// Displays an icon, title, subtitle,
/// and a trailing chevron to indicate navigation.
struct SettingsRow: View {

    /// SF Symbol name for the leading icon
    let icon: String

    /// Primary text describing the setting
    let title: String

    /// Secondary text providing additional context
    let subtitle: String

    /// Background color for the icon
    let color: Color

    var body: some View {
        HStack(spacing: 16) {

            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 36, height: 36)
                .background(color)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            /// Chevron indicates a tappable row
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
    }
}
