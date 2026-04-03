import SwiftUI

// Modal presentations with sheets and fullScreenCover.
struct SheetsView: View {
    @State private var showSheet = false
    @State private var showFullScreen = false

    var body: some View {
        VStack(spacing: 20) {
            Button("Show Sheet") {
                showSheet = true
            }
            .buttonStyle(.bordered)

            Button("Show Full Screen") {
                showFullScreen = true
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showSheet) {
            SheetContent(title: "Sheet")
                .presentationDetents([.medium, .large])
        }
        .fullScreenCover(isPresented: $showFullScreen) {
            SheetContent(title: "Full Screen Cover")
        }
        .navigationTitle("15 - Sheets")
    }
}

private struct SheetContent: View {
    let title: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "rectangle.portrait.bottomhalf.inset.filled")
                    .font(.system(size: 60))
                    .foregroundStyle(.blue)

                Text("This is a \(title)")
                    .font(.title2)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    SheetsView()
}
