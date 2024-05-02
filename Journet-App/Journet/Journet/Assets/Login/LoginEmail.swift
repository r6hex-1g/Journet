import SwiftUI

//MARK: - Login info Textfield
struct LoginEmail: View {
    
    @Binding var mail: String
    @State var editText: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("계정 이름이나 ID", text: self.$mail)
                .font(.Hanbit15)
                .padding()
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .onTapGesture {
                    self.editText = true
                }
        }
        .padding()
    }
}
