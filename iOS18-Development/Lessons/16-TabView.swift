import SwiftUI

// Tab-based app structure with badges (iOS 18 style).
struct TabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)

            Text("New")
                .tabItem {
                    Label("New", systemImage: "sparkle")
                }
                .tag(1)

            ScrollView {
                VStack {
                    ForEach(0..<35, id: \.self) { index in
                        Text("Article \(index + 1)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding()
            }
            .tabItem {
                Label("Pages", systemImage: "doc.plaintext")
            }
            .badge("!")
            .tag(2)

            Text("Library")
                .tabItem {
                    Label("Library", systemImage: "books.vertical")
                }
                .badge(2)
                .tag(3)
        }
        .tint(.red)
        .navigationTitle("16 - Tab View")
    }
}

#Preview {
    TabBarView()
}
