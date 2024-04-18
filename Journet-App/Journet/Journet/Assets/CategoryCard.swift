import SwiftUI

struct CategoryCard: View {
    
    let normalText = Font.system(size: 17.5)
    
    var imoji: String
    var title: String
    var description: String
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            Text(imoji)
                .font(.title)
            
            VStack(alignment: .center, spacing: 5) {
                Text(title)
                    .font(normalText)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("MainColor"))
                Text(description)
                    .font(.caption2)
                    .foregroundColor(Color(.systemGray))
            }
            .layoutPriority(100)
        }
        .padding(.top, 20)
        .padding(.bottom, 20)
        .padding(.leading, 50)
        .padding(.trailing, 50)
        .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(Color(.sRGB, red: 97/255, green: 144/255, blue: 244/255, opacity: 0.3), lineWidth: 1)
            )
    }
}

#Preview {
    CategoryCard(imoji: "🍶", title: "가성비 술 맛집", description: "찐 가성비 술 맛집들이에요!")
}
