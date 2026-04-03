import SwiftUI

// Menu, segmented, wheel, inline picker styles.
struct PickersView: View {
    @State private var selectedFruit = "Apple"
    @State private var selectedSize = "Medium"
    @State private var selectedDate = Date()

    let fruits = ["Apple", "Banana", "Cherry", "Date"]
    let sizes = ["Small", "Medium", "Large"]

    var body: some View {
        Form {
            Section("Menu Picker (Default)") {
                Picker("Fruit", selection: $selectedFruit) {
                    ForEach(fruits, id: \.self) { Text($0) }
                }
            }

            Section("Segmented Picker") {
                Picker("Size", selection: $selectedSize) {
                    ForEach(sizes, id: \.self) { Text($0) }
                }
                .pickerStyle(.segmented)
            }

            Section("Wheel Picker") {
                Picker("Fruit", selection: $selectedFruit) {
                    ForEach(fruits, id: \.self) { Text($0) }
                }
                .pickerStyle(.wheel)
                .frame(height: 120)
            }

            Section("Date Picker") {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
            }

            Section("Compact Date Picker") {
                DatePicker("Select Date", selection: $selectedDate)
                    .datePickerStyle(.compact)
            }
        }
        .navigationTitle("13 - Pickers")
    }
}

#Preview {
    PickersView()
}
