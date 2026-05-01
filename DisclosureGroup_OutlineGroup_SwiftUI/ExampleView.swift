import SwiftUI

struct SettingItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String?
    let detail: String?
    let children: [SettingItem]?
}

private extension SettingItem {
    static let sample: [SettingItem] = [
        SettingItem(title: "General", icon: "gearshape", detail: nil, children: [
            SettingItem(title: "Appearance", icon: "moon.circle", detail: "Light/Dark", children: nil),
            SettingItem(title: "Language", icon: "globe", detail: "English", children: nil)
        ]),
        SettingItem(title: "Notifications", icon: "bell.badge", detail: nil, children: [
            SettingItem(title: "Push", icon: "bell", detail: "Enabled", children: nil),
            SettingItem(title: "Email", icon: "envelope", detail: "Enabled", children: nil)
        ]),
        SettingItem(title: "Privacy", icon: "hand.raised", detail: nil, children: [
            SettingItem(title: "Location Services", icon: "location", detail: "While Using", children: nil),
            SettingItem(title: "Contacts", icon: "person.2", detail: "Allowed", children: nil)
        ]),
        SettingItem(title: "Advanced", icon: "wrench.and.screwdriver", detail: nil, children: [
            SettingItem(title: "Developer Mode", icon: "chevron.left.slash.chevron.right", detail: "Off", children: nil),
            SettingItem(title: "Reset Options", icon: "arrow.counterclockwise", detail: nil, children: [
                SettingItem(title: "Reset Warnings", icon: "exclamationmark.circle", detail: nil, children: nil),
                SettingItem(title: "Reset Caches", icon: "trash", detail: nil, children: nil)
            ])
        ]),
        SettingItem(title: "About", icon: "info.circle", detail: nil, children: [
            SettingItem(title: "Version", icon: "number.square", detail: "1.0.0", children: nil),
            SettingItem(title: "Licenses", icon: "doc.text", detail: nil, children: nil)
        ])
    ]
}

struct ExampleView: View {
    @State private var isDarkMode: Bool = false
    @State private var sendPush: Bool = true
    @State private var sendEmail: Bool = false
    @State private var locationAccessIndex: Int = 1
    @State private var developerMode: Bool = false
    @State private var autoUpdate: Bool = true

    @State private var showAllSettings: Bool = false

    private let locationOptions = ["Never", "While Using", "Always"]

    var body: some View {
        NavigationStack {
            List {
                // General
                DisclosureGroup {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.fill")
                    }
                    Toggle(isOn: $autoUpdate) {
                        Label("Auto Update", systemImage: "arrow.triangle.2.circlepath")
                    }
                    Picker(selection: $locationAccessIndex) {
                        ForEach(locationOptions.indices, id: \.self) { idx in
                            Text(locationOptions[idx]).tag(idx)
                        }
                    } label: {
                        Label("Default Location Access", systemImage: "location")
                    }
                } label: {
                    Label("General", systemImage: "gearshape")
                }

                // Notifications
                DisclosureGroup {
                    Toggle(isOn: $sendPush) {
                        Label("Push Notifications", systemImage: "bell")
                    }
                    Toggle(isOn: $sendEmail) {
                        Label("Email Notifications", systemImage: "envelope")
                    }
                    Button {
                        // open per-app notification settings
                    } label: {
                        Label("Notification Settings", systemImage: "bell.badge")
                    }
                } label: {
                    Label("Notifications", systemImage: "bell.badge")
                }

                // Privacy
                DisclosureGroup {
                    Picker(selection: $locationAccessIndex) {
                        ForEach(locationOptions.indices, id: \.self) { idx in
                            Text(locationOptions[idx]).tag(idx)
                        }
                    } label: {
                        Label("Location Services", systemImage: "location")
                    }
                    Button {
                        // manage contacts access
                    } label: {
                        Label("Contacts", systemImage: "person.2")
                    }
                } label: {
                    Label("Privacy", systemImage: "hand.raised")
                }

                // Advanced
                DisclosureGroup {
                    Toggle(isOn: $developerMode.animation()) {
                        Label("Developer Mode", systemImage: "chevron.left.slash.chevron.right")
                    }
                    if developerMode {
                        Button(role: .destructive) {
                            // reset warnings
                        } label: {
                            Label("Reset Warnings", systemImage: "exclamationmark.circle")
                        }
                        Button(role: .destructive) {
                            // reset caches
                        } label: {
                            Label("Reset Caches", systemImage: "trash")
                        }
                    }
                } label: {
                    Label("Advanced", systemImage: "wrench.and.screwdriver")
                }

                // About
                DisclosureGroup {
                    HStack {
                        Label("Version", systemImage: "number.square")
                        Spacer()
                        Text("1.0.0")
                            .foregroundStyle(.secondary)
                    }
                    Button {
                        // show licenses
                    } label: {
                        Label("Licenses", systemImage: "doc.text")
                    }
                } label: {
                    Label("About", systemImage: "info.circle")
                }

                // OutlineGroup demo
                DisclosureGroup(isExpanded: $showAllSettings) {
                    OutlineGroup(SettingItem.sample, children: \.children) { item in
                        HStack {
                            if let icon = item.icon { Image(systemName: icon) }
                            Text(item.title)
                            Spacer()
                            if let detail = item.detail { Text(detail).foregroundStyle(.secondary) }
                        }
                    }
                } label: {
                    Label("All Settings", systemImage: "list.bullet")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ExampleView()
}
