import SwiftUI

// Exact toolbar positioning and grouping.
struct PositionalToolbarsView: View {
    var onBack: () -> Void

    var body: some View {
        NavigationStack {
            List {
                Text("Positional toolbars let you choose where items appear.")
                Text("Use .topBarLeading, .topBarTrailing, .bottomBar, etc.")
            }
            .navigationTitle("20 - Positional Toolbars")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Back") { onBack() }
                }

                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {} label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    Button {} label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }

                ToolbarItemGroup(placement: .bottomBar) {
                    Button {} label: {
                        Image(systemName: "folder")
                    }
                    Spacer()
                    Button {} label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

#Preview {
    PositionalToolbarsView(onBack: {})
}
