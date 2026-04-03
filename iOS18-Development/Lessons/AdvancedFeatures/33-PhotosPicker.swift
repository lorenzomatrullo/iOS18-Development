import SwiftUI
import PhotosUI

// PhotosPicker for selecting images from the photo library.
struct PhotosPickerView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var multipleItems: [PhotosPickerItem] = []
    @State private var multipleImages: [Image] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Single photo picker
                GroupBox("Single Photo") {
                    VStack(spacing: 12) {
                        if let selectedImage {
                            selectedImage
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }

                        PhotosPicker(selection: $selectedItem, matching: .images) {
                            Label("Select Photo", systemImage: "photo")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }

                // Multiple photo picker
                GroupBox("Multiple Photos") {
                    VStack(spacing: 12) {
                        if !multipleImages.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(0..<multipleImages.count, id: \.self) { index in
                                        multipleImages[index]
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
                            }
                        }

                        PhotosPicker(selection: $multipleItems, maxSelectionCount: 5, matching: .images) {
                            Label("Select Photos", systemImage: "photo.stack")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
            }
            .padding()
        }
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = Image(uiImage: uiImage)
                }
            }
        }
        .onChange(of: multipleItems) { _, newItems in
            Task {
                multipleImages = []
                for item in newItems {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        multipleImages.append(Image(uiImage: uiImage))
                    }
                }
            }
        }
        .navigationTitle("33 - PhotosPicker")
    }
}

#Preview {
    PhotosPickerView()
}
