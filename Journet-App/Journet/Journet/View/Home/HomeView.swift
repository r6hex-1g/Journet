import SwiftUI

//MARK: - Views setup
struct HomeView: View {
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HHeaderView()
                Spacer()
                HStack(alignment: .center, spacing: -25) {
                    SearchingBar(text: self.$text)
                    Mapdelegate()
                        .padding()
                }
                ScrollView(.vertical) {
                    VStack {
                        HomeDiaryView()
                        HomecategoryView()
                    }
                }
            }
        }
    }
}

//MARK: - Bell icon -> Notification View
struct Mapdelegate: View {
    var body: some View {
        NavigationLink(destination: NotificationView()) {
            Image(systemName: "bell.fill")
                .resizable()
                .frame(width: 20, height: 25, alignment: .center)
                .foregroundColor(Color("MainColor"))
                .padding()
        }
    }
}

//MARK: - DiaryView
struct HomeDiaryView: View {
    let biggerText = Font.system(size: 25)
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
                    HStack(spacing: 30) {
                        DiaryCard(image: "Card1", title: "제목", desciption: "요약", author: "라희")
                        DiaryCard(image: "Card1", title: "제목", desciption: "요약", author: "라희")
                        DiaryCard(image: "Card1", title: "제목", desciption: "요약", author: "라희")
                    }
                    .padding(.leading)
                }
        }
        .padding()
    }
}

//MARK: - CategoryView
struct HomecategoryView: View {
    let biggerText = Font.system(size: 25)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading) {
                Text("These are")
                    .font(biggerText)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                HStack(spacing: 0) {
                    Text("new ")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("Category")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("MainColor"))
                    Text("!")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                }
            }
            .padding()
            
            ScrollView(.horizontal) {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 30) {
                        CategoryCard(imoji: "🌷", title: "튤립 천국인 곳", description: "튤립을 정적으로 만날 수 있는 곳들이에요!")
                        CategoryCard(imoji: "🌷", title: "튤립 천국인 곳", description: "튤립을 정적으로 만날 수 있는 곳들이에요!")
                        CategoryCard(imoji: "🌷", title: "튤립 천국인 곳", description: "튤립을 정적으로 만날 수 있는 곳들이에요!")
                    }
                    .padding(.leading)
                }
            }
        }
        .padding()
    }
}

//MARK: - Previews
#Preview {
//    HomeView()
    TabbarView()
}
