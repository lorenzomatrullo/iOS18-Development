import SwiftUI

// Native share sheet.
struct ShareLinkView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "square.and.arrow.up")
                .font(.system(size: 60))
                .foregroundStyle(.blue)

            // Share a string
            ShareLink(item: "Check out this SwiftUI course!")

            // Share with custom label
            ShareLink(item: "https://developer.apple.com") {
                Label("Share Link", systemImage: "link")
            }

            // Share with subject and message
            ShareLink(
                item: "SwiftUI is amazing!",
                subject: Text("SwiftUI Course"),
                message: Text("I'm learning SwiftUI with this hands-on course.")
            ) {
                Label("Share with Message", systemImage: "envelope")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 40)
        }
        .navigationTitle("25 - Share Link")
    }
}

#Preview {
    ShareLinkView()
}
