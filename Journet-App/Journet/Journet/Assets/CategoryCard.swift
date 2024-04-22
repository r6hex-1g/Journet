import SwiftUI

struct CategoryCard: View {
    
    let normalText = Font.system(size: 15)
    let descriptionText = Font.system(size: 10)
    
    var imoji: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(imoji)
                .font(.title3)
            
            VStack(alignment: .center, spacing: 5) {
                Text(title)
                    .font(normalText)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("MainColor"))
                Text(description)
                    .font(descriptionText)
                    .foregroundColor(Color(.systemGray))
            }
            .layoutPriority(100)
        }
        .padding(.top, 15)
        .padding(.bottom, 15)
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(Color(.sRGB, red: 97/255, green: 144/255, blue: 244/255, opacity: 0.3), lineWidth: 1)
            )
    }
}

#Preview {
    CategoryCard(imoji: "🍶", title: "가성비 술 맛집", description: "찐 가성비 술 맛집들이에요!")
}
