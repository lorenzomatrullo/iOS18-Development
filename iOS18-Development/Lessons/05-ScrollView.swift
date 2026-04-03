import SwiftUI

// Vertical and horizontal scroll views.
struct ScrollViewExampleView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Horizontal scroll section
                Text("Horizontal Scroll")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<10, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.blue.opacity(0.3))
                                .frame(width: 120, height: 80)
                                .overlay {
                                    Text("Card \(index + 1)")
                                        .font(.caption)
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Vertical content
                Text("Vertical Content")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ForEach(1..<15, id: \.self) { index in
                    HStack {
                        Image(systemName: "\(index).circle.fill")
                            .font(.title2)
                            .foregroundStyle(.blue)
                        Text("Row \(index)")
                        Spacer()
                    }
                    .padding()
                    .background(.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle("05 - ScrollView")
    }
}

#Preview {
    ScrollViewExampleView()
}
