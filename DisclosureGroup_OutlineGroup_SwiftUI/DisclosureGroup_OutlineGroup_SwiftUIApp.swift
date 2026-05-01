//
        //
    //  Project: DisclosureGroup_OutlineGroup_SwiftUI
    //  File: DisclosureGroup_OutlineGroup_SwiftUIApp.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

@main
struct DisclosureGroup_OutlineGroup_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        .defaultSize(width: 100, height: 100)
        .windowResizability(.contentSize)
        #endif
    }
}

