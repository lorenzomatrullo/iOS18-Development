import SwiftUI

// Toggle switches controlled by @State.
struct TogglesView: View {
    @State private var wifiEnabled = true
    @State private var bluetoothEnabled = false
    @State private var airplaneMode = false

    var body: some View {
        Form {
            Section("Settings") {
                Toggle("Wi-Fi", isOn: $wifiEnabled)
                Toggle("Bluetooth", isOn: $bluetoothEnabled)
                Toggle("Airplane Mode", isOn: $airplaneMode)
            }

            Section("Tinted Toggles") {
                Toggle("Notifications", isOn: $wifiEnabled)
                    .tint(.red)

                Toggle("Location", isOn: $bluetoothEnabled)
                    .tint(.purple)
            }

            Section("Current State") {
                LabeledContent("Wi-Fi", value: wifiEnabled ? "On" : "Off")
                LabeledContent("Bluetooth", value: bluetoothEnabled ? "On" : "Off")
                LabeledContent("Airplane", value: airplaneMode ? "On" : "Off")
            }
        }
        .navigationTitle("07 - Toggles")
    }
}

#Preview {
    TogglesView()
}
