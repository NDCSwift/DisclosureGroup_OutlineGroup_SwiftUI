//
        //
    //  Project: DisclosureGroup_OutlineGroup_SwiftUI
    //  File: WhyTheseMatter.swift
    //  Created by Noah Carpenter
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

import SwiftUI

// MARK: - Problem 1: Settings with too many toggles

struct SettingsProblemView: View {
    @State private var notifications = true
    @State private var darkMode = false
    @State private var soundEnabled = true
    @State private var haptics = true
    @State private var badgeCount = true

    @State private var autoLock = false
    @State private var debugLogging = false
    @State private var experimentalUI = false
    @State private var verboseNetwork = false
    @State private var http2Enabled = true
    @State private var diskCache = true
    @State private var compression = false
    @State private var analytics = true
    @State private var crashReporting = true
    @State private var performanceMonitor = false

    var body: some View {
        Form {
            Section("General") {
                Toggle("Notifications", isOn: $notifications)
                Toggle("Dark Mode", isOn: $darkMode)
                Toggle("Sound Effects", isOn: $soundEnabled)
                Toggle("Haptic Feedback", isOn: $haptics)
                Toggle("Badge Count", isOn: $badgeCount)
            }
            // No way to hide these — they're always visible
            Section("Advanced") {
                Toggle("Auto Lock", isOn: $autoLock)
                Toggle("Debug Logging", isOn: $debugLogging)
                Toggle("Experimental UI", isOn: $experimentalUI)
                Toggle("Verbose Network", isOn: $verboseNetwork)
                Toggle("HTTP/2", isOn: $http2Enabled)
                Toggle("Disk Cache", isOn: $diskCache)
                Toggle("Compression", isOn: $compression)
                Toggle("Analytics", isOn: $analytics)
                Toggle("Crash Reporting", isOn: $crashReporting)
                Toggle("Performance Monitor", isOn: $performanceMonitor)
            }
        }
        .navigationTitle("Settings")
    }
}

// MARK: - Problem 2: File browser with manual nesting

struct FileBrowserProblemView: View {
    var body: some View {
        List {
            // Every item and its depth is hardcoded — no recursion, no expand/collapse
            FileRow(name: "Documents", icon: "folder.fill", depth: 0)
            FileRow(name: "Projects", icon: "folder.fill", depth: 1)
            FileRow(name: "SwiftUI", icon: "folder.fill", depth: 2)
            FileRow(name: "ContentView.swift", icon: "doc.text", depth: 3)
            FileRow(name: "ViewModel.swift", icon: "doc.text", depth: 3)
            FileRow(name: "UIKit", icon: "folder.fill", depth: 2)
            FileRow(name: "ViewController.swift", icon: "doc.text", depth: 3)
            FileRow(name: "Storyboard.storyboard", icon: "doc.text", depth: 3)
            FileRow(name: "Archive", icon: "folder.fill", depth: 1)
            FileRow(name: "2023", icon: "folder.fill", depth: 2)
            FileRow(name: "OldProject.zip", icon: "doc.zipper", depth: 3)
            FileRow(name: "Downloads", icon: "folder.fill", depth: 0)
            FileRow(name: "WWDC25", icon: "folder.fill", depth: 1)
            FileRow(name: "session_notes.pdf", icon: "doc.richtext", depth: 2)
            FileRow(name: "Resume.pdf", icon: "doc.richtext", depth: 1)
        }
        .navigationTitle("Files")
    }
}

private struct FileRow: View {
    let name: String
    let icon: String
    let depth: Int

    var body: some View {
        HStack(spacing: 8) {
            // Manual indentation — breaks the moment a folder moves
            Spacer().frame(width: CGFloat(depth) * 20)
            Image(systemName: icon)
                .foregroundStyle(icon.hasPrefix("folder") ? .blue : .secondary)
            Text(name)
                .lineLimit(1)
        }
    }
}

// MARK: - Showcase container

struct WhyTheseMatterView: View {
    var body: some View {
        TabView {
            NavigationStack {
                SettingsProblemView()
            }
            .tabItem { Label("Settings", systemImage: "gear") }

            NavigationStack {
                FileBrowserProblemView()
            }
            .tabItem { Label("Files", systemImage: "folder") }
        }
    }
}

#Preview {
    WhyTheseMatterView()
}
