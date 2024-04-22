import SwiftUI

struct DiaryCard: View {
    
    let normalText = Font.system(size: 20)
    
    var image: String
    var title: String
    var desciption: String
    var author: String
    var date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: -3) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 100)
                .clipped()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(normalText)
                        .fontWeight(.bold)
                        .foregroundColor(Color("MainColor"))
                        .fontDesign(.rounded)
                        .lineLimit(2)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(desciption)
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                        HStack(spacing: 5) {
                            Text(author)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("•")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
//                .padding()
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.sRGB, red: 97/255, green: 144/255, blue: 244/255, opacity: 0.3), lineWidth: 1)
        )
        .frame(width: 180)
    }
}

#Preview {
    DiaryCard(image: "Card2", title: "제목", desciption: "요약", author: "라희", date: "2024.04.22.")
}
