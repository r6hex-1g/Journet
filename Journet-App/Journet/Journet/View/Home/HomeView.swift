import SwiftUI

struct HomeView: View {
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HHeaderView()
            HStack(alignment: .center, spacing: -25) {
                SearchingBar(text: self.$text)
                Mapdelegate()
                    .padding()
            }
            Spacer()
            HomeTextView()
            Spacer()
        }
    }
}


//MARK: - Map icon
struct Mapdelegate: View {
    var body: some View {
        NavigationLink(destination: MapView()) {
            Image(systemName: "map.fill")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(Color("MainColor"))
                .padding()
        }
    }
}

//MARK: - textView
struct HomeTextView: View {
    var body: some View {
        VStack {
            Text("안녕하세요")
        }
    }
}

//MARK: - Previews
#Preview {
    HomeView()
}
