import SwiftUI

struct DHeaderView: View {
    
    var body: some View {
        Spacer(minLength: 20)
        VStack(alignment: .center, spacing: 0) {
            Text("Diaries")
                .fontWeight(.bold)
                .fontDesign(.rounded)
        }
    }
}

#Preview {
    DHeaderView()
}
