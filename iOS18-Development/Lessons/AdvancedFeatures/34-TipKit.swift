import SwiftUI
import TipKit

// TipKit for in-app tips and guidance.
struct FavoriteTip: Tip {
    var title: Text {
        Text("Add to Favorites")
    }

    var message: Text? {
        Text("Tap the heart icon to save items to your favorites list.")
    }

    var image: Image? {
        Image(systemName: "heart")
    }
}

struct SearchTip: Tip {
    var title: Text {
        Text("Search Items")
    }

    var message: Text? {
        Text("Use the search bar to quickly find what you're looking for.")
    }

    var image: Image? {
        Image(systemName: "magnifyingglass")
    }
}

struct TipKitView: View {
    let favoriteTip = FavoriteTip()
    let searchTip = SearchTip()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Inline tip
                TipView(favoriteTip)

                // Popover tip on a button
                HStack {
                    Spacer()
                    Button {} label: {
                        Image(systemName: "heart")
                            .font(.title2)
                    }
                    .popoverTip(searchTip)
                    Spacer()
                }

                GroupBox("About TipKit") {
                    Text("TipKit lets you display tips to educate users about features in your app. Tips can appear inline or as popovers.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Button("Reset All Tips") {
                    try? Tips.resetDatastore()
                    try? Tips.configure([
                        .displayFrequency(.immediate),
                        .datastoreLocation(.applicationDefault)
                    ])
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .task {
            try? Tips.configure([
                .displayFrequency(.immediate),
                .datastoreLocation(.applicationDefault)
            ])
        }
        .navigationTitle("34 - TipKit")
    }
}

#Preview {
    TipKitView()
}
