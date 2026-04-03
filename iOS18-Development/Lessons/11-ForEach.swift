import SwiftUI

// Dynamic view generation with ForEach.
struct ForEachExampleView: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    let animals = ["Dog", "Cat", "Bird", "Fish", "Rabbit"]

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // ForEach with index
                Text("Color Palette")
                    .font(.headline)

                HStack(spacing: 8) {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 40, height: 40)
                    }
                }

                Divider()

                // ForEach with identifiable data
                Text("Animals")
                    .font(.headline)

                ForEach(animals, id: \.self) { animal in
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .foregroundStyle(.brown)
                        Text(animal)
                        Spacer()
                    }
                    .padding()
                    .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
                }

                Divider()

                // ForEach with range
                Text("Grid")
                    .font(.headline)

                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 8) {
                    ForEach(1..<10, id: \.self) { number in
                        Text("\(number)")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue.opacity(0.2), in: RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .padding()
        }
        .navigationTitle("11 - ForEach")
    }
}

#Preview {
    ForEachExampleView()
}
