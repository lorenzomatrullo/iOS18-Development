import SwiftUI

// Empty states and error views.
struct ContentUnavailableExampleView: View {
    @State private var searchText = ""
    @State private var showError = false

    let items = ["SwiftUI", "UIKit", "Combine", "MapKit"]

    var filtered: [String] {
        if searchText.isEmpty { return items }
        return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            Group {
                if showError {
                    ContentUnavailableView {
                        Label("No Connection", systemImage: "wifi.slash")
                    } description: {
                        Text("Check your internet connection and try again.")
                    } actions: {
                        Button("Retry") { showError = false }
                            .buttonStyle(.borderedProminent)
                    }
                } else if !searchText.isEmpty && filtered.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                } else {
                    List(filtered, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("30 - Content Unavailable")
            .toolbar {
                Toggle("Error", isOn: $showError)
            }
        }
    }
}

#Preview {
    ContentUnavailableExampleView()
}
