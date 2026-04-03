import SwiftUI

// Menu-based toolbar items.
struct ToolbarMenuView: View {
    @State private var sortOrder = "Name"

    var body: some View {
        List {
            ForEach(1..<10, id: \.self) { index in
                Text("Item \(index)")
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Button("Sort by Name") { sortOrder = "Name" }
                    Button("Sort by Date") { sortOrder = "Date" }
                    Button("Sort by Size") { sortOrder = "Size" }

                    Divider()

                    Button(role: .destructive) {} label: {
                        Label("Clear All", systemImage: "trash")
                    }
                } label: {
                    Label("Options", systemImage: "ellipsis.circle")
                }
            }
        }
        .navigationTitle("21 - Toolbar Menu")
    }
}

#Preview {
    NavigationStack {
        ToolbarMenuView()
    }
}
