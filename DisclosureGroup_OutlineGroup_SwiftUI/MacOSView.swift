//
        //
    //  Project: DisclosureGroup_OutlineGroup_SwiftUI
    //  File: MacOSView.swift
    //  Created by Noah Carpenter
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

#if os(macOS)
import SwiftUI

// MARK: - macOS DisclosureGroup (animation caveat)

// On macOS, `withAnimation {}` does not animate a DisclosureGroup —
// the state changes but the expand/collapse plays instantly.
// Drive the animation on the value instead; this works on both platforms.
// Bonus: a focused DisclosureGroup responds to ← → arrow keys for free.
struct MacSettingsView: View {
    @State private var showAdvanced = false
    @State private var analytics = true
    @State private var crashReports = false

    var body: some View {
        Form {
            DisclosureGroup("Advanced", isExpanded: $showAdvanced) {
                Toggle("Analytics", isOn: $analytics)
                Toggle("Crash Reports", isOn: $crashReports)
            }
        }
        .padding()

        Button(showAdvanced ? "Collapse" : "Expand") {
            showAdvanced.toggle()         // no withAnimation{} — drives via .animation below
        }
        .animation(.easeInOut, value: showAdvanced)
        .padding(.bottom)
    }
}

// MARK: - macOS File Browser (Sidebar + Detail)

// On macOS the idiomatic hierarchy pattern is NavigationSplitView with a
// sidebar List. Add a `selection:` binding and `.tag()` each row — users
// click to navigate instead of tapping a NavigationLink.
struct MacFileBrowserView: View {
    @State private var selection: FileNode.ID?

    var body: some View {
        NavigationSplitView {
            List([root], id: \.id, children: \.children, selection: $selection) { node in
                Label(
                    node.name,
                    systemImage: node.children == nil ? "doc.text" : "folder"
                )
                .foregroundStyle(node.children == nil ? .primary : .secondary)
                .tag(node.id)
            }
            .navigationTitle("Files")
            .navigationSplitViewColumnWidth(min: 200, ideal: 240)
        } detail: {
            if let selection,
               let node = findNode(id: selection, in: root) {
                Text(node.name)
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)
            } else {
                ContentUnavailableView("Select a file", systemImage: "doc.text")
            }
        }
    }

    private func findNode(id: FileNode.ID, in node: FileNode) -> FileNode? {
        if node.id == id { return node }
        return node.children?.compactMap { findNode(id: id, in: $0) }.first
    }
}

// MARK: - Previews

#Preview("Settings") {
    MacSettingsView()
        .frame(width: 320, height: 200)
}

#Preview("File Browser") {
    MacFileBrowserView()
        .frame(width: 640, height: 400)
}
#endif
