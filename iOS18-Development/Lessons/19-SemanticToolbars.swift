import SwiftUI

// Platform-appropriate toolbar placement.
struct SemanticToolbarsView: View {
    var onBack: () -> Void

    var body: some View {
        NavigationStack {
            List {
                Text("Semantic toolbar placements adapt to the platform automatically.")
                Text("Try this on iPhone, iPad and Mac to see how they differ.")
            }
            .navigationTitle("19 - Semantic Toolbars")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {}
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { onBack() }
                }

                ToolbarItem(placement: .destructiveAction) {
                    Button("Delete", role: .destructive) {}
                }
            }
        }
    }
}

#Preview {
    SemanticToolbarsView(onBack: {})
}
