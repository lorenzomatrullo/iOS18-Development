import SwiftUI

struct CourseOnboardingView: View {
    let onComplete: () -> Void

    @State private var currentPage = 0

    private let pages: [(title: String, subtitle: String, icon: String)] = [
        ("iOS 18 Development", "Learn SwiftUI from scratch with\n37 hands-on lessons.", "swift"),
        ("Build Real UI", "Master Lists, Forms, Navigation,\nMenus, Toolbars and more.", "rectangle.stack.fill"),
        ("Advanced Features", "Charts, Maps, Photos, TipKit\nand modern frameworks.", "star.fill"),
        ("Modern Frameworks", "Notifications, StoreKit,\nWebKit and beyond.", "shippingbox.fill"),
        ("Ready to Start?", "Use the lesson picker to explore\neach topic at your own pace.", "checkmark.circle.fill")
    ]

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Image(systemName: pages[currentPage].icon)
                .font(.system(size: 80))
                .foregroundStyle(.blue)
                .contentTransition(.symbolEffect(.replace))
                .id(currentPage)

            VStack(spacing: 10) {
                Text(pages[currentPage].title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(pages[currentPage].subtitle)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            HStack(spacing: 8) {
                ForEach(0..<pages.count, id: \.self) { index in
                    Capsule()
                        .fill(currentPage == index ? .blue : .gray.opacity(0.4))
                        .frame(width: currentPage == index ? 24 : 8, height: 8)
                }
            }

            Button {
                if currentPage == pages.count - 1 {
                    onComplete()
                } else {
                    withAnimation(.easeInOut) {
                        currentPage += 1
                    }
                }
            } label: {
                Text(currentPage == pages.count - 1 ? "Get Started" : "Continue")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal, 30)

            if currentPage > 0 {
                Button("Back") {
                    withAnimation(.easeInOut) {
                        currentPage -= 1
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    CourseOnboardingView {
        print("Onboarding completed")
    }
}
