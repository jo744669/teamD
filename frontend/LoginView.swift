// LoginView.swift
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginError: Bool = false
    @State private var isMainTabViewPresented: Bool = false

    var body: some View {
        VStack {
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("SJU Email address", text: $email)
                .padding()
                .font(.title3)
                .background(Color.gray)
                .autocapitalization(.none)
                .disableAutocorrection(true)

            SecureField("Password", text: $password)
                .padding()
                .font(.title3)
                .background(Color.gray)

            Button("Sign In") {
                // Check email and password (replace with actual authentication logic)
                if isValidLogin() {
                    withAnimation {
                        print("Valid login. Logging in...")
                        isMainTabViewPresented = true
                        loginError = false
                    }
                } else {
                    withAnimation {
                        print("Invalid login. Check email and password.")
                        loginError = true
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(loginError ? Color.red : Color.clear, lineWidth: 2)
            )
            .padding(.top, 20)
        }
        .padding()
        .fullScreenCover(isPresented: $isMainTabViewPresented, content: {
            MainTabView(userEmail: email)
        })
    }

    private func isValidLogin() -> Bool {
        // Add your logic to check email and password
        // For example, return true if the email has "@sju.edu" suffix and password is "password"
        return email.lowercased().hasSuffix("@sju.edu") && password == "password"
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif

