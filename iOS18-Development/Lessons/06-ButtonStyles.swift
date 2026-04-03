import SwiftUI

// Button styles showcase for different contexts and emphasis levels.
struct ButtonsView: View {
    var body: some View {
        Form {
            Section("Standard Button Styles") {
                LabeledContent("Default") {
                    Button("Label") {}
                }

                LabeledContent("Borderless") {
                    Button("Label") {}
                        .buttonStyle(.borderless)
                }

                LabeledContent("Plain") {
                    Button("Label") {}
                        .buttonStyle(.plain)
                }

                LabeledContent("Bordered") {
                    Button("Label") {}
                        .buttonStyle(.bordered)
                }

                LabeledContent("Bordered Prominent") {
                    Button("Label") {}
                        .buttonStyle(.borderedProminent)
                }
            }

            Section("Tinted Buttons") {
                LabeledContent("Red") {
                    Button("Delete") {}
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                }

                LabeledContent("Green") {
                    Button("Confirm") {}
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                }

                LabeledContent("Orange") {
                    Button("Warning") {}
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                }
            }
        }
        .navigationTitle("06 - Button Styles")
    }
}

#Preview {
    ButtonsView()
}
