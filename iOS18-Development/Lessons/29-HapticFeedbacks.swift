import SwiftUI

// Tactile feedback and vibrations.
struct HapticFeedbacksView: View {
    var body: some View {
        List {
            Section("Notification Feedback") {
                Button("Success") {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }

                Button("Warning") {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.warning)
                }

                Button("Error") {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                }
            }

            Section("Impact Feedback") {
                Button("Light") {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                }

                Button("Medium") {
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.impactOccurred()
                }

                Button("Heavy") {
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.impactOccurred()
                }

                Button("Rigid") {
                    let generator = UIImpactFeedbackGenerator(style: .rigid)
                    generator.impactOccurred()
                }

                Button("Soft") {
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.impactOccurred()
                }
            }

            Section("Selection Feedback") {
                Button("Selection Changed") {
                    let generator = UISelectionFeedbackGenerator()
                    generator.selectionChanged()
                }
            }
        }
        .navigationTitle("29 - Haptic Feedbacks")
    }
}

#Preview {
    HapticFeedbacksView()
}
