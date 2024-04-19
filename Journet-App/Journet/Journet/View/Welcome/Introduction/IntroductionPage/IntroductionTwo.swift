import SwiftUI

struct IntroductionTwo: View {
    var body: some View {
        VStack {
            Spacer()
            I2HeaderView()
            Spacer()
        }
        .padding(.horizontal, 40.0)
    }
}

//MARK: - Header Views
struct I2HeaderView: View {
    let biggerText = Font.system(size: 35.0)
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.line.dotted.person.fill")
                .resizable()
                .foregroundColor(Color("MainColor"))
                .frame(width: 80, height: 40)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10.0) {
                VStack(alignment: .leading, spacing: -5.0) {
                    Text("Connect to")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    Text("Journey")
                        .font(biggerText)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("MainColor"))
                        .fontDesign(.rounded)
                }
                
                Text("일기를 통해 타인과 연결되어보세요.")
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("다른 사람들과 일기를 나누고,")
                        .font(.footnote)
                    Text("자신만의 공간을 나눌 수 있고,")
                        .font(.footnote)
                    Text("서로가 서로의 공간을 확인하면서 알아갈 수 있는 공간입니다.")
                        .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    IntroductionTwo()
}
