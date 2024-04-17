import SwiftUI

struct CategoryCard: View {
    var imoji: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(imoji)
                .font(.largeTitle)
            VStack(alignment: .center, spacing: 5) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundColor(Color("MainColor"))
                Text(description)
                    .font(.footnote)
                    .foregroundColor(Color(.systemGray))
            }
            .layoutPriority(100)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(Color(.sRGB, red: 97/255, green: 144/255, blue: 244/255, opacity: 0.3), lineWidth: 1)
        )
        .padding()
        .frame(width: 500, height: 120, alignment: .center)
    }
}

#Preview {
    CategoryCard(imoji: "🍶", title: "가성비 술 맛집", description: "찐 가성비 술 맛집들이에요!")
}
