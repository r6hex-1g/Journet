import SwiftUI

//MARK: - Views setup
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                hHeaderView()
                Spacer()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Spacer(minLength: 20)
                        VStack(spacing: 10) {
                            headerEventNotificationView()
                            homeDiaryView()
                            homecategoryView()
                        }
                    }
                }
            }
        }
    }
}

//MARK: - Headers Event Notification Views
struct headerEventNotificationView: View {
    
    let biggerText = Font.system(size: 17.5)
    let background = Color.green
        .opacity(0.2)
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "globe.asia.australia.fill")
                .resizable()
                .frame(width: 30, height: 30)
            VStack(alignment: .leading, spacing: 5) {
                Text("오늘은 지구의 날이에요!")
                    .font(biggerText)
                    .fontWeight(.bold)
                VStack(alignment: .leading) {
                    Text("지구의 날인 만큼 오늘은 지구의 환경을 위해서, 환경을 아끼러 가볼까요?")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding()
        }
        .frame(width: 300, height: 110)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .background(background)
        .cornerRadius(50)
        .foregroundColor(.green)
    }
}

//MARK: - DiaryView
struct homeDiaryView: View {
    
    @Namespace var topID
    @Namespace var bottomID
    
    @State var username: String = "Journer"
    
    let biggerText = Font.system(size: 25)
    
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
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    DiaryCard(image: "Card1", title: "제목", desciption: "요약", author: "라희", date: "2024.04.22.")
                    DiaryCard(image: "Card2", title: "제목", desciption: "요약", author: "라희", date: "2024.04.22.")
                    DiaryCard(image: "Card1", title: "제목", desciption: "요약", author: "라희", date: "2024.04.22.")
                }
                .padding(.leading, 15)
            }
        }
        .padding()
    }
}

//MARK: - CategoryView
struct homecategoryView: View {
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
            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    LazyHStack(spacing: 20) {
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
