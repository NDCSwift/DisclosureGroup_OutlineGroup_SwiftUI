# 📂 DisclosureGroup + OutlineGroup in SwiftUI

Collapsible settings sections and recursive file trees — two views, one clean answer.

---

## 🤔 What this is

A focused SwiftUI demo covering `DisclosureGroup` and `OutlineGroup` — the two views that handle collapsible content without a `VStack` full of `if/else`. `DisclosureGroup` wraps a single expandable section with optional external state control. `OutlineGroup` walks a recursive data model and renders a full expand/collapse tree with zero manual nesting.

## ✅ Why you'd use it

- **`DisclosureGroup`** — hides advanced settings (or any secondary content) behind a tap, keeping the UI clean without removing functionality
- **`OutlineGroup`** — renders arbitrarily deep hierarchies from a single `children` keypath; add a level to your data and the UI updates automatically
- **`List(children:)`** — the drop-in upgrade: same recursive rendering as `OutlineGroup` plus selection, swipe actions, and native disclosure arrows

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtube.com/watch?v=PLACEHOLDER)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97).

---

## 🚀 Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/NoahDoesCoding97/DisclosureGroup_OutlineGroup_SwiftUI.git
```

### 2. Open in Xcode
```
DisclosureGroup_OutlineGroup_SwiftUI.xcodeproj
```

### 3. Set your Team
Xcode → Project → Signing & Capabilities → Team → select your Apple ID.

### 4. Set your Bundle ID
Change `com.example.DisclosureGroup-OutlineGroup-SwiftUI` to something unique (e.g. `com.yourname.DisclosureGroup`).

---

## 🛠️ Notes

- **`ContentView.swift`** — the main demo: a `DisclosureGroup` with a nested child, an `OutlineGroup` over a real recursive model, and a button driving the expanded state programmatically.
- **`FileNode.swift`** — the model. `children: [FileNode]?` being optional is the key: `nil` = leaf (file), non-nil = branch (folder). Swap `root` for any real data source.
- **`WhyTheseMatter.swift`** — shows the problem both views solve: a settings screen with all toggles permanently exposed, and a file browser with manually hardcoded indentation.

## 📦 Requirements

| | |
|---|---|
| Xcode | 16+ |
| iOS | 18+ |
| Swift | 6 |

---

📺 [Watch the guide on YouTube](https://youtube.com/watch?v=PLACEHOLDER)
