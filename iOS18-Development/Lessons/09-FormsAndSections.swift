import SwiftUI

// Settings screens with Form.
struct FormsAndSectionsView: View {
    @State private var name = ""
    @State private var notificationsEnabled = true
    @State private var fontSize = 14.0
    @State private var selectedColor = "Blue"

    let colors = ["Red", "Blue", "Green", "Purple"]

    var body: some View {
        Form {
            Section("Profile") {
                TextField("Name", text: $name)
                Picker("Favorite Color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) { color in
                        Text(color)
                    }
                }
            }

            Section("Preferences") {
                Toggle("Notifications", isOn: $notificationsEnabled)
                Slider(value: $fontSize, in: 10...24, step: 1) {
                    Text("Font Size")
                }
                Text("Size: \(Int(fontSize))pt")
                    .foregroundStyle(.secondary)
            }

            Section {
                Button("Save", action: {})
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("09 - Forms & Sections")
    }
}

#Preview {
    FormsAndSectionsView()
}
