import SwiftUI

// Search with the searchable modifier.
struct SearchableView: View {
    let frameworks = ["SwiftUI", "UIKit", "Core Data", "Combine", "MapKit", "CoreML", "AVFoundation", "Vision"]

    @State private var searchText = ""

    var filteredFrameworks: [String] {
        if searchText.isEmpty {
            return frameworks
        } else {
            return frameworks.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredFrameworks, id: \.self) { framework in
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundStyle(.blue)
                        Text(framework)
                    }
                }
            }
            .navigationTitle("27 - Searchable")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    SearchableView()
}
