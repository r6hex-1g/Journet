import SwiftUI

struct IntroductionOne: View {
    var body: some View {
        VStack {
            Spacer()
            I1HeaderView()
            Spacer()
        }
         .padding(.horizontal, 40.0)
    }
}

//MARK: - Header Views
struct I1HeaderView: View {
    let biggerText = Font.system(size: 35.0)
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "square.and.pencil")
                .resizable()
                .foregroundColor(Color("MainColor"))
                .frame(width: 60, height: 60)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: -5.0) {
                    Text("Write to")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("Journey")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("MainColor"))
                        .fontDesign(.rounded)
                }
                
                Text("나만의 일기를 써보새요.")
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("평소와는 다른 공간에서의 일기를 저장하고,")
                        .font(.footnote)
                    Text("그 일기에서 그 날에 대한 감정들을 저잘하고,")
                        .font(.footnote)
                    Text("언제든 필요하다면 꺼내보고 추억을 회상할 수 있도록 도와주기도 하는 공간입니다.")
                        .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    IntroductionOne()
}
