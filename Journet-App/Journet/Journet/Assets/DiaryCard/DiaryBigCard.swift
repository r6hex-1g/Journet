import SwiftUI

struct DiaryBigCard: View {
    
    var image: String
    var title: String
    var tag: String
    var date: String
    
    var body: some View {
        VStack(alignment: .center, spacing: -3) {
            Spacer(minLength: 10)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 205, height: 135)
                .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
            
            
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text(title)
                        .font(.Hanbit23)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(tag)
                            .font(.Hanbit12)
                            .foregroundColor(.secondary)
                        Text(date)
                            .font(.Hanbit12)
                            .foregroundColor(.secondary)
                    }
                    .opacity(0.7)
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.sRGB, red: 0/255, green: 152/255, blue: 130/255, opacity: 0.3), lineWidth: 1)
        )
        .frame(width: 220, height: 160)
        .foregroundColor(.white)
        .padding()
    }
}

#Preview {
    DiaryBigCard(image: "Card2", title: "제목", tag: "#혼자_걷기_좋은곳", date: "2024.04.22.")
}
