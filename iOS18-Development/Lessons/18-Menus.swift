import SwiftUI

// Context menus, submenus, dividers.
struct MenusView: View {
    @State private var selectedAction = "None"

    var body: some View {
        VStack(spacing: 30) {
            // Basic menu
            Menu("Actions") {
                Button("Copy", action: { selectedAction = "Copy" })
                Button("Paste", action: { selectedAction = "Paste" })
                Button("Cut", action: { selectedAction = "Cut" })

                Divider()

                Button(role: .destructive) {
                    selectedAction = "Delete"
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
            .buttonStyle(.bordered)

            // Menu with submenu
            Menu("More Options") {
                Menu("Sort By") {
                    Button("Name") { selectedAction = "Sort by Name" }
                    Button("Date") { selectedAction = "Sort by Date" }
                    Button("Size") { selectedAction = "Sort by Size" }
                }

                Menu("Filter") {
                    Button("All") { selectedAction = "Filter All" }
                    Button("Recent") { selectedAction = "Filter Recent" }
                }
            }
            .buttonStyle(.bordered)

            // Context menu on a view
            RoundedRectangle(cornerRadius: 16)
                .fill(.blue.opacity(0.3))
                .frame(width: 200, height: 120)
                .overlay { Text("Long press me") }
                .contextMenu {
                    Button("Share") { selectedAction = "Share" }
                    Button("Favorite") { selectedAction = "Favorite" }
                    Button(role: .destructive) { selectedAction = "Remove" } label: {
                        Label("Remove", systemImage: "trash")
                    }
                }

            Text("Last action: \(selectedAction)")
                .foregroundStyle(.secondary)
        }
        .navigationTitle("18 - Menus")
    }
}

#Preview {
    MenusView()
}
