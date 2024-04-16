import SwiftUI

struct HHeaderView: View {
    let biggerText = Font.system(size: 25.0)
    
    var body: some View {
        Spacer(minLength: 50)
        VStack(alignment: .center, spacing: 25) {
            Text("Journet")
                .font(biggerText)
                .fontWeight(.bold)
                .fontDesign(.rounded)
        }
    }
}

#Preview {
    TabbarView()
}
