import SwiftUI

// System paste with permissions.
struct PasteButtonView: View {
    @State private var pastedText = ""

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "doc.on.clipboard")
                .font(.system(size: 60))
                .foregroundStyle(.blue)

            PasteButton(payloadType: String.self) { strings in
                pastedText = strings.first ?? ""
            }

            if !pastedText.isEmpty {
                GroupBox("Pasted Content") {
                    Text(pastedText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
            }

            Text("PasteButton provides a system-managed paste action with user consent.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .navigationTitle("24 - Paste Button")
    }
}

#Preview {
    PasteButtonView()
}
