//
//  PhotoPickerView.swift
//  VintedClone
//
//  Created by Thibault Giraudon on 24/11/2023.
//

import SwiftUI
import PhotosUI

class PhotoSelectorViewModel: ObservableObject {
    @Published var images = [UIImage]()
    @Published var selectedPhotos = [PhotosPickerItem]()
    
    @MainActor
    func convertDataToImage() {
        // reset the images array before adding more/new photos
        images.removeAll()
        
        if !selectedPhotos.isEmpty {
            for eachItem in selectedPhotos {
                Task {
                    if let imageData = try? await eachItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                }
            }
        }
        
        selectedPhotos.removeAll()
    }
}

struct PhotoSelectorView: View {
    @StateObject var vm = PhotoSelectorViewModel()
    let maxPhotosToSelect = 20
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(0..<vm.images.count, id: \.self) { index in
                        Image(uiImage: vm.images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                }
            }
            PhotosPicker(
                selection: $vm.selectedPhotos,
                maxSelectionCount: maxPhotosToSelect,
                selectionBehavior: .ordered,
                matching: .images
            ) {
                HStack {
                    Image(systemName: "plus")
                    Text("Ajouter photos")
                }
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke())
                .foregroundStyle(.teal)
                .padding(8)
            }
        }
        .padding()
        .onChange(of: vm.selectedPhotos) { _, _ in
            vm.convertDataToImage()
        }
    }
}

#Preview {
    PhotoSelectorView()
}
