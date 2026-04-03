import SwiftUI

// Ranges, steps, labels.
struct SlidersView: View {
    @State private var volume = 50.0
    @State private var brightness = 0.7
    @State private var rating = 3.0

    var body: some View {
        Form {
            Section("Basic Slider") {
                Slider(value: $volume, in: 0...100)
                Text("Volume: \(Int(volume))%")
                    .foregroundStyle(.secondary)
            }

            Section("Slider with Label") {
                Slider(value: $brightness, in: 0...1) {
                    Text("Brightness")
                } minimumValueLabel: {
                    Image(systemName: "sun.min")
                } maximumValueLabel: {
                    Image(systemName: "sun.max")
                }
                Text("Brightness: \(Int(brightness * 100))%")
                    .foregroundStyle(.secondary)
            }

            Section("Stepped Slider") {
                Slider(value: $rating, in: 1...5, step: 1)
                HStack {
                    ForEach(1...Int(rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                }
            }
        }
        .navigationTitle("12 - Sliders")
    }
}

#Preview {
    SlidersView()
}
