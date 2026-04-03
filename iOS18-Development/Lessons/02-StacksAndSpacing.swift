import SwiftUI

// Horizontal, vertical and overlay stacks.
struct StacksAndSpacingView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Vertical stack
                VStack(spacing: 8) {
                    Text("VStack")
                        .font(.headline)
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                .padding()
                .background(.gray.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))

                // Horizontal stack
                HStack(spacing: 16) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("HStack")
                        .font(.headline)
                    Spacer()
                    Text("Trailing")
                        .foregroundStyle(.secondary)
                }
                .padding()
                .background(.gray.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))

                // ZStack overlay
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.blue.opacity(0.2))
                        .frame(height: 120)

                    Text("ZStack overlay")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
        .navigationTitle("02 - Stacks & Spacing")
    }
}

#Preview {
    StacksAndSpacingView()
}
