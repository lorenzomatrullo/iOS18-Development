import SwiftUI

// Email, phone, URL keyboards.
struct KeyboardTypesView: View {
    @State private var email = ""
    @State private var phone = ""
    @State private var url = ""
    @State private var number = ""

    var body: some View {
        Form {
            Section("Email") {
                TextField("Email address", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
            }

            Section("Phone") {
                TextField("Phone number", text: $phone)
                    .keyboardType(.phonePad)
                    .textContentType(.telephoneNumber)
            }

            Section("URL") {
                TextField("Website", text: $url)
                    .keyboardType(.URL)
                    .textContentType(.URL)
                    .autocapitalization(.none)
            }

            Section("Number") {
                TextField("Amount", text: $number)
                    .keyboardType(.decimalPad)
            }
        }
        .navigationTitle("23 - Keyboard Types")
    }
}

#Preview {
    KeyboardTypesView()
}
