import SwiftUI
import PhotosUI

struct ProfileView: View {
    var body: some View {
        VStack {
            PHeaderView()
            Spacer()
            //ProfilePhotoPicker()
            ComingSoonMessages()
            Spacer()
        }
    }
}

//MARK: - Profile Photo Picker Views
struct ProfilePhotoPicker: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
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
    }
}

//MARK: - Coming Soon Message Views
struct ComingSoonMessages: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("곧 생길 예정입니다.")
            Text("이번 시연에 공개해드리지 못해 죄송합니다.")
        }
    }
}

#Preview {
    ContentView()
}
