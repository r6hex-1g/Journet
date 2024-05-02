import SwiftUI

//MARK: - Login info Textfield
struct LoginPassword: View {
    
    @Binding var password: String
    @State var editText: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            SecureField("비밀번호", text: self.$password)
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
