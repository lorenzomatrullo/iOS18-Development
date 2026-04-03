import SwiftUI

// Custom return key labels.
struct KeyboardSubmitLabelView: View {
    @State private var searchText = ""
    @State private var message = ""
    @State private var url = ""

    var body: some View {
        Form {
            Section("Search (Submit Label)") {
                TextField("Search...", text: $searchText)
                    .submitLabel(.search)
            }

            Section("Send (Submit Label)") {
                TextField("Message...", text: $message)
                    .submitLabel(.send)
            }

            Section("Go (Submit Label)") {
                TextField("URL...", text: $url)
                    .submitLabel(.go)
            }

            Section("On Submit") {
                TextField("Press return to submit", text: $searchText)
                    .submitLabel(.done)
                    .onSubmit {
                        print("Submitted: \(searchText)")
                    }
            }
        }
        .navigationTitle("22 - Submit Label")
    }
}

#Preview {
    KeyboardSubmitLabelView()
}
