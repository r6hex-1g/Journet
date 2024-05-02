import SwiftUI

struct DiariesView: View {
    var body: some View {
        VStack {
            VStack(spacing: 25) {
                DHeaderView()
                DButtonGroup1()
            }
            Spacer()
            ScrollView(.vertical) {
                VStack {
                    myDiaryListView()
                    theyDiaryListView()
                }
            }
            .frame(width: .infinity, height: 595)
            Spacer()
        }
    }
}

//MARK: - Button Group
struct DButtonGroup1: View {
    @State var diaries = Diaries()
    
    
    var body: some View {
        HStack(spacing: 20) {
            Button("start") {
                diaries.onLiveActivity()
            }
            .font(.callout)
            .fontDesign(.rounded)
            .frame(width: 160, height: 30, alignment: .center)
            .foregroundColor(.white)
            .background(Color("MainColor"))
            .cornerRadius(10)
            
            
            
            Button("stop") {
                diaries.offLiveActivity()
            }
            .font(.callout)
            .fontDesign(.rounded)
            .frame(width: 160, height: 30, alignment: .center)
            .foregroundColor(.white)
            .background(Color("CancelColor"))
            .cornerRadius(10)
        }
    }
}

//MARK: - My Diary List View
struct myDiaryListView: View {
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
                        DiaryCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                        DiaryCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                        DiaryCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                    }
                    .padding(.leading)
                }
        }
        .padding()
    }
}

//MARK: - They Diary List View
struct theyDiaryListView: View {
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
                        DiaryCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                        DiaryCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                        DiaryCard(image: "Card1", title: "제목", tag: "라희", date: "2024.04.22.")
                    }
                    .padding(.leading)
                }
        }
        .padding()
    }
}

#Preview {
//    DiariesView()
    TabbarView()
}
