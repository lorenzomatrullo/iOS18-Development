import SwiftUI

// Grouped content containers.
struct GroupBoxView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GroupBox("Statistics") {
                    VStack(alignment: .leading, spacing: 12) {
                        Label("Downloads: 1,234", systemImage: "arrow.down.circle")
                        Label("Rating: 4.8", systemImage: "star.fill")
                        Label("Reviews: 89", systemImage: "text.bubble")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                GroupBox {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About this app")
                            .font(.headline)
                        Text("A sample application demonstrating GroupBox containers in SwiftUI.")
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                } label: {
                    Label("Information", systemImage: "info.circle")
                }

                GroupBox("Actions") {
                    VStack(spacing: 12) {
                        Button("Share App") {}
                            .frame(maxWidth: .infinity)
                            .buttonStyle(.bordered)

                        Button("Rate App") {}
                            .frame(maxWidth: .infinity)
                            .buttonStyle(.borderedProminent)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("10 - GroupBox")
    }
}

#Preview {
    GroupBoxView()
}
