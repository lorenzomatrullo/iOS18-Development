import SwiftUI

// Labels combine text with an icon.
struct LabelsView: View {
    var body: some View {
        Form {
            Section("Label Styles") {
                Label("Default label", systemImage: "star")

                Label("Title only", systemImage: "star")
                    .labelStyle(.titleOnly)

                Label("Icon only", systemImage: "star")
                    .labelStyle(.iconOnly)

                Label("Title and icon", systemImage: "star")
                    .labelStyle(.titleAndIcon)
            }

            Section("Custom Labels") {
                Label {
                    Text("Downloads")
                        .font(.headline)
                } icon: {
                    Image(systemName: "arrow.down.circle.fill")
                        .foregroundStyle(.blue)
                }

                Label {
                    Text("Favorites")
                        .font(.headline)
                } icon: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                }
            }
        }
        .navigationTitle("04 - Labels")
    }
}

#Preview {
    LabelsView()
}
