import SwiftUI

struct HomeView: View {
    @State var text: String = ""
    
    var body: some View {
        LazyVStack(pinnedViews: [.sectionHeaders]) {
            Section(header: HHeaderView()) {
                HStack(alignment: .center, spacing: -5) {
                    SearchingBar(text: self.$text)
                    Mapdelegate()
                        .padding()
                }
            }
            VStack(alignment: .leading, spacing: 0) {
                HomeDiaryView()
                Spacer()
                HomecategoryView()
            }
            Spacer()
        }
    }
}


//MARK: - Map icon Button
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

//MARK: - DiaryView
struct HomeDiaryView: View {
    let biggerText = Font.system(size: 30.0)
    @State var username: String = "Journer"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading) {
                Text("These are")
                    .font(biggerText)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                HStack(spacing: 0) {
                    Text("\(username)")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("MainColor"))
                    Text("'s")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                }
                Text("new diaries!")
                    .font(biggerText)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            }
            .padding()
            
            ScrollView(.horizontal) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 30) {
                        DiaryCard(image: "Card1", title: "제목", desciption: "요약", author: "라희")
                        DiaryCard(image: "Card1", title: "제목", desciption: "요약", author: "라희")
                    }
                    
                }
            }
        }
        .padding()
    }
}

//MARK: - Category Views
struct HomecategoryView: View {
    let biggerText = Font.system(size: 30.0)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading) {
                Text("These are")
                    .font(biggerText)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                HStack(spacing: 0) {
                    Text("username")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("MainColor"))
                    Text("'s")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                }
                Text("new diaries!")
                    .font(biggerText)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
            }
            .padding()
        }
    }
}
    
//MARK: - Previews
#Preview {
    HomeView()
}
