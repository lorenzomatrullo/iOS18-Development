import SwiftUI

// Page-style swiping with TabView.
struct TabViewPagesView: View {
    var body: some View {
        TabView {
            ForEach(1..<6, id: \.self) { page in
                VStack(spacing: 16) {
                    Image(systemName: "\(page).circle.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.blue)

                    Text("Page \(page)")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Swipe left or right to navigate between pages.")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .navigationTitle("17 - Tab View Pages")
    }
}

#Preview {
    TabViewPagesView()
}
