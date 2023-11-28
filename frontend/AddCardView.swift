import SwiftUI

struct AddCardView: View {
    @Binding var cards: [CreditCard]
    @State private var cardNumber: String = ""
    @State private var cardHolder: String = ""

    var body: some View {
        VStack {
            // Your add card content goes here

            TextField("Card Number", text: $cardNumber)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.bottom, 10)

            TextField("Card Holder", text: $cardHolder)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
                .padding(.bottom, 20)

            Button("Add Card") {
                addCard()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        // .navigationBarTitle("Add Card", displayMode: .inline)
    }

    private func addCard() {
        let newCard = CreditCard(cardNumber: cardNumber, cardHolder: cardHolder)
        cards.append(newCard)
        cardNumber = ""
        cardHolder = ""
    }
}

#if DEBUG
struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView(cards: .constant([]))
    }
}
#endif

