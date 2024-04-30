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
                        Spacer(minLength: 1)
                        VStack(spacing: 10) {
                            homeDiaryView()
                        }
                    }
                }
                .frame(height: 540)
            }
        }
    }
}

//MARK: - DiaryView
struct homeDiaryView: View {
    
    @Namespace var topID
    @Namespace var bottomID
        
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom){
                    Text("나의 여행 기록")
                        .font(.Hanbit25)
                    Circle()
                        .fill(Color("MainColor"))
                        .frame(width: 8, height: 8)
                        .position(x: 3, y: 20)
                }
                .padding(.leading, 10)
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    DiaryBigCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                    LazyHStack(alignment: .top, spacing: -15) {
                        DiaryCard(image: "Card2", title: "제목", tag: "라희", date: "2024.04.22.")
                        DiaryCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                    }
                    .padding(.bottom, 50)
                }
                .offset(y: 30)
            }
            .frame(width: 380, height: 300)
        }
        .padding()
    }
}

//MARK: - Previews
#Preview {
//    HomeView()
    TabbarView()
}
