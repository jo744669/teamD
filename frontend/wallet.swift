// WalletView.swift
import SwiftUI

struct WalletView: View {
    @Binding var cards: [CreditCard]
    @State private var isShowingAddCardView: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                // Your wallet content goes here

                if cards.isEmpty {
                    Text("No cards added. Tap the button below to add a card.")
                        .padding()
                        .multilineTextAlignment(.center)
                } else {
                    List {
                        ForEach(cards) { card in
                            NavigationLink(
                                destination: Text("Details for \(card.cardNumber)"), // Replace with your card details view
                                label: {
                                    VStack(alignment: .leading) {
                                        Text("Card Number: \(card.cardNumber)")
                                        Text("Card Holder: \(card.cardHolder)")
                                    }
                                }
                            )
                        }
                        .onDelete { indexSet in
                            deleteCards(at: indexSet)
                        }
                    }
                }

                Button("Add Card") {
                    isShowingAddCardView.toggle()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .fullScreenCover(isPresented: $isShowingAddCardView) {
                    AddCardView(cards: $cards)
                }
            }
            .navigationBarTitle("Wallet")
            .navigationBarItems(
                leading: Button("Sign Out") {
                    // Handle sign-out action
                }
            )
        }
    }

    private func deleteCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
    }
}

#if DEBUG
struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(cards: .constant([]))
    }
}
#endif

