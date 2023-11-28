import SwiftUI

struct Account: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showWalletView: Bool = false
    @State private var loginError: Bool = false
    @State private var creditCards: [CreditCard] = [] // Placeholder for your credit cards

    var body: some View {
        VStack {
            if isLoggedIn {
                // Display the WalletView immediately upon successful login
                WalletView(cards: $creditCards)
            } else {
                // Your login UI
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("SJU Email address", text: $email)
                    .padding()
                    .font(.title3)
                    .background(Color.gray)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onTapGesture {
                        if !showWalletView {
                            email = "" // Clear the text field when tapped
                        }
                    }

                SecureField("Password", text: $password)
                    .padding()
                    .font(.title3)
                    .background(Color.gray)
                    .onTapGesture {
                        if !showWalletView {
                            password = "" // Clear the secure field when tapped
                        }
                    }

                Button("Sign In") {
                    // Check email and password (replace with actual authentication logic)
                    if isValidEmail(email) && password == "password" {
                        withAnimation {
                            print("Valid login. Logging in...")
                            isLoggedIn = true
                            showWalletView = true
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
                .allowsHitTesting(true) // Disable hit testing when the user is logged in

            }
        }
        .padding()
    }

    private func isValidEmail(_ email: String) -> Bool {
        return email.lowercased().hasSuffix("@sju.edu")
    }
}

#if DEBUG
struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
#endif

