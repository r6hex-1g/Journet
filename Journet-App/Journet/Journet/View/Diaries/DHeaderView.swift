import SwiftUI

struct DHeaderView: View {
    
    var body: some View {
        Spacer(minLength: 20)
        HStack(alignment: .center, spacing: 130) {
            Text("Diaries")
                .fontWeight(.bold)
                .fontDesign(.rounded)
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(Color("MainColor"))
                .onTapGesture {
                    //
                }
        }
    }
}

#Preview {
    DHeaderView()
}
