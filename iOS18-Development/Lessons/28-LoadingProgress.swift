import SwiftUI

// ProgressView and loading states.
struct LoadingProgressView: View {
    @State private var progress = 0.4
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 30) {
            // Indeterminate spinner
            GroupBox("Indeterminate") {
                VStack(spacing: 12) {
                    ProgressView()
                    ProgressView("Loading...")
                }
                .frame(maxWidth: .infinity)
                .padding()
            }

            // Determinate progress bar
            GroupBox("Determinate") {
                VStack(spacing: 12) {
                    ProgressView(value: progress)

                    ProgressView(value: progress) {
                        Text("Downloading")
                    } currentValueLabel: {
                        Text("\(Int(progress * 100))%")
                    }

                    Slider(value: $progress, in: 0...1)
                }
                .padding()
            }

            // Simulated loading
            Button(isLoading ? "Loading..." : "Start Loading") {
                isLoading = true
                Task {
                    try? await Task.sleep(for: .seconds(2))
                    isLoading = false
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(isLoading)
        }
        .padding()
        .navigationTitle("28 - Loading Progress")
    }
}

#Preview {
    LoadingProgressView()
}
