import SwiftUI

struct hHeaderView: View {
    
    var body: some View {
        Spacer(minLength: 20)
        VStack(alignment: .center, spacing: 0) {
            Text("Journet")
                .fontWeight(.bold)
                .fontDesign(.rounded)
        }
    }
}

#Preview {
    hHeaderView()
}
