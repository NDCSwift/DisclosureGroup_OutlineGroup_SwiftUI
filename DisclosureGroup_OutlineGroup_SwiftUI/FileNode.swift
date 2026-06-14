//
        //
    //  Project: DisclosureGroup_OutlineGroup_SwiftUI
    //  File: FileNode.swift
    //  Created by Noah Carpenter
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

import Foundation

// The model OutlineGroup and List(children:) need.
// `children` being optional is the key — nil means leaf node (file),
// non-nil means it has children (folder). OutlineGroup uses that
// distinction to know whether to render a disclosure chevron.
struct FileNode: Identifiable {
    let id = UUID()
    let name: String
    var children: [FileNode]? = nil
}

// Sample tree passed to OutlineGroup in ContentView.
// Swap this out for a real data source — the recursive rendering is free.
let root = FileNode(name: "Documents", children: [
    FileNode(name: "Photos", children: [
        FileNode(name: "Summer.jpg"),
        FileNode(name: "Vacation.png")
    ]),
    FileNode(name: "Work", children: [
        FileNode(name: "Notes.txt"),
        FileNode(name: "Ideas", children: [
            FileNode(name: "App.md")
        ])
    ])
])
