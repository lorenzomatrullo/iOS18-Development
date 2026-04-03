import SwiftUI

// System images, SF Symbols and image modifiers.
struct ImagesAndSFSymbolsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // SF Symbol with rendering mode
                Image(systemName: "macbook.and.iphone")
                    .font(.system(size: 60))
                    .symbolRenderingMode(.multicolor)

                // Symbol with variable value
                Image(systemName: "wifi", variableValue: 0.6)
                    .font(.system(size: 50))
                    .foregroundStyle(.blue)

                // Clipped and resized image
                Image(systemName: "photo.artframe")
                    .font(.system(size: 80))
                    .foregroundStyle(.orange)
                    .frame(width: 120, height: 120)
                    .background(.orange.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                // Symbol effect
                Image(systemName: "heart.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.red)
                    .symbolEffect(.pulse)
            }
            .padding()
        }
        .navigationTitle("03 - Images & SF Symbols")
    }
}

#Preview {
    ImagesAndSFSymbolsView()
}
