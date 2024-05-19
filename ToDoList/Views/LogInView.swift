import SwiftUI

struct LogInView: View {
   @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 15,
                           background: .brown)
                
                // Form with offset
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal) // Add horizontal padding
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal) // Add horizontal padding
                    
                    TLButtonView(title: "LogIn", backkground: .brown, action: {
                        //attempt Log in
                        viewModel.login()
                    })
                    
                   
                }
                .offset(y: -50) // Apply offset directly to the Form

                // Create Account
                VStack {
                    Text("New Around Here?")
                        .padding(.bottom, 1) // Add bottom padding
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                
                Spacer()
            }
            .padding(.vertical) // Add vertical padding
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
