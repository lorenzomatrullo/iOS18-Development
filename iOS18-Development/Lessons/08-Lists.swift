import SwiftUI

// Dynamic data with List and ForEach.
struct ListsView: View {
    @State private var fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape"]

    var body: some View {
        List {
            Section("Fruits") {
                ForEach(fruits, id: \.self) { fruit in
                    HStack {
                        Image(systemName: "leaf.fill")
                            .foregroundStyle(.green)
                        Text(fruit)
                    }
                }
                .onDelete { offsets in
                    fruits.remove(atOffsets: offsets)
                }
                .onMove { from, to in
                    fruits.move(fromOffsets: from, toOffset: to)
                }
            }
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("08 - Lists")
    }
}

#Preview {
    NavigationStack {
        ListsView()
    }
}
