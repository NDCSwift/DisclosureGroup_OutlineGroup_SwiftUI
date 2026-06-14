//
        //
    //  Project: DisclosureGroup_OutlineGroup_SwiftUI
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

import SwiftUI

struct ContentView: View {
    // Tracks whether the Advanced section is open or closed.
    // Passing this to `isExpanded` lets you drive it programmatically
    // (e.g. the Expand/Collapse button below) instead of tap-only.
    @State private var showAdvanced = false

    var body: some View {
        Form {
            // DisclosureGroup — a single collapsible section.
            // `isExpanded` is optional; omit it if you don't need external control.
            DisclosureGroup("Advanced", isExpanded: $showAdvanced) {

                // DisclosureGroups nest freely — each manages its own expanded state.
                DisclosureGroup("Nested") {
                    Toggle("Analytics", isOn: .constant(true))
                    Toggle("Stats", isOn: .constant(false))
                }
            }

            // OutlineGroup — walks the `children` keypath recursively, so no matter
            // how deep your tree is you only write this once.
            // `root` is defined in FileNode.swift.
            OutlineGroup(root, children: \.children) { node in
                Text(node.name)
            }

            // Bonus: List supports the same `children:` trick and adds row
            // selection, swipe actions, and system-style disclosure arrows.
            // Uncomment to compare the two approaches side by side.
//            List([root], id: \.id, children: \.children) { node in
//                Label(node.name, systemImage: node.children == nil ? "doc" : "folder")
//            }
        }

        // External control of DisclosureGroup via the `isExpanded` binding.
        // `withAnimation` gives the expand/collapse a smooth transition.
        Button(showAdvanced ? "Collapse" : "Expand") {
            withAnimation {
                showAdvanced.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
