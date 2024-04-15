import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack {
            PHeaderView()
            
            Spacer()
            
            PhotosPicker (
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Image(systemName: "person.fill")
                        .font(.title)
                        .frame(width: 40, height: 40)
                }
            
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
            
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle().inset(by: 30))
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
