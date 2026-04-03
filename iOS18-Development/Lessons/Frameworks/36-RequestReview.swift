import SwiftUI
import StoreKit

// App Store review prompts with StoreKit.
struct RequestReviewView: View {
    @Environment(\.requestReview) private var requestReview

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.bubble.fill")
                .font(.system(size: 100))
                .foregroundStyle(.yellow, .blue)

            Text("Enjoying the app?")
                .font(.title2)
                .fontWeight(.semibold)

            Text("Your feedback helps us improve.")
                .foregroundStyle(.secondary)

            Button("Rate This App") {
                requestReview()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("36 - Request Review")
    }
}

#Preview {
    RequestReviewView()
}
