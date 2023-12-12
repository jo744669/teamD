// Account.swift
import SwiftUI

struct CreditCard: Identifiable {
    var id = UUID()
    var cardNumber: String
    var cardExpiration: String
    var cardCVC: String
}

struct Account: View {
    @Binding var userEmail: String
    @State private var isLoggedIn: Bool = true // For testing, set this to true

    // Card information for testing
    @State private var creditCards: [CreditCard] = [
        CreditCard(cardNumber: "1234 5678 9012 3456", cardExpiration: "12/23", cardCVC: "123"),
        CreditCard(cardNumber: "2345 6789 0123 4567", cardExpiration: "05/22", cardCVC: "456")
    ]

    @State private var isAddCardSheetPresented = false
    @State private var newCardNumber: String = ""
    @State private var newCardExpiration: String = ""
    @State private var newCardCVC: String = ""

    @State private var isLoggedOut: Bool = false

    var body: some View {
        VStack {
            if isLoggedIn {
                Text("Welcome \(userEmail)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                Text("Here are your available cards")
                    .font(.headline)
                    .padding(.bottom, 10)

                List {
                    ForEach(creditCards) { card in
                        CardRow(card: card)
                            .padding()
                    }
                    .onDelete(perform: deleteCard)
                }
                .listStyle(PlainListStyle())

                Button("Add a Card") {
                    isAddCardSheetPresented.toggle()
                }
                .sheet(isPresented: $isAddCardSheetPresented) {
                    VStack {
                        Text("Add a Card")
                            .font(.title)
                            .padding()

                        TextField("Card Number", text: $newCardNumber)
                            .padding()
                            .keyboardType(.numberPad)

                        TextField("Expiration (MM/YY)", text: $newCardExpiration)
                            .padding()
                            .keyboardType(.numberPad)

                        TextField("CVC", text: $newCardCVC)
                            .padding()
                            .keyboardType(.numberPad)

                        Button("Add Card") {
                            // Add the new card to the list
                            creditCards.append(CreditCard(
                                cardNumber: newCardNumber,
                                cardExpiration: newCardExpiration,
                                cardCVC: newCardCVC
                            ))

                            // Dismiss the sheet
                            isAddCardSheetPresented.toggle()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                }

                Button("Sign Out") {
                    signOutUser()
                }
                .fullScreenCover(isPresented: $isLoggedOut, content: {
                    LoginView(userLoggedInEmail: .constant(""))
                })
            }
        }
    }

    private func deleteCard(at offsets: IndexSet) {
        creditCards.remove(atOffsets: offsets)
    }
    private func signOutUser() {
        guard let url = URL(string: "http://localhost:3000/signout") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error signing out:", error)
                // Handle error if needed
            } else if let data = data {
                // Assuming your server sends a JSON response
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let success = json["success"] as? Bool {
                    if success {
                        // Sign-out successful, update UI accordingly
                        isLoggedOut.toggle()
                    } else {
                        // Handle sign-out failure
                        print("Sign-out failed")
                    }
                }
            }
        }
        .resume()
    }
}


struct CardRow: View {
    let card: CreditCard

    var body: some View {
        HStack {
            Text("Card Number: \(card.cardNumber)\nExpiration: \(card.cardExpiration)\nCVC: \(card.cardCVC)")
            Spacer()
        }
    }
}

#if DEBUG
struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(userEmail: .constant("sample@sju.edu"))
    }
}
#endif
